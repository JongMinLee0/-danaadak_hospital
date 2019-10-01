<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=utf-8 />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phone Authentication simple popup flow</title>

<!-- Material Design Theming -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.1.3/material.orange-indigo.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/hos/resources/css/phone.css">
</head>
<body>

	<main class="mdl-layout__content mdl-color--grey-100">
	<div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-grid">
		<form id="sign-in-form" action="#">
			<!-- Input to enter the phone number -->
			<div
				class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text"
					pattern="\+[0-9\s\-\(\)]+" id="phone-number"
					value="+82 ${param.phone_number }"> <label
					class="mdl-textfield__label" for="phone-number">전화번호를
					입력해주세요</label> <span class="mdl-textfield__error">전화번호 형식이 아닙니다.</span>
			</div>

			<!-- Button that handles sign-in -->
			<input type="submit" disabled
				class="mdl-button mdl-js-button mdl-button--raised"
				id="sign-in-button" value="인증 요청" />

			<!-- Container to display the re-captcha check -->
			<div id="recaptcha-container"></div>
		</form>
	</div>
	</main>

	<!-- Import and configure the Firebase SDK -->
	<!-- These scripts are made available when the app is served or deployed on Firebase Hosting -->
	<!-- If you do not serve/host your project using Firebase Hosting see https://firebase.google.com/docs/web/setup -->
	<script src="https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/6.5.0/firebase-auth.js"></script>
	<script src="/hos/resources/js/init-firebase.js"></script>

	<script type="text/javascript">
  /**
   * Set up UI event listeners and registering Firebase auth listeners.
   */
  window.onload = function() {
	  
    // Event bindings.
    document.getElementById('sign-in-form').addEventListener('submit', onSignInSubmit);
    document.getElementById('phone-number').addEventListener('keyup', updateSignInButtonUI);
    document.getElementById('phone-number').addEventListener('change', updateSignInButtonUI);
    // [START appVerifier]
    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
    // [END appVerifier]
  };
  /**
   * Function called when clicking the Login/Logout button.
   */
  function onSignInSubmit(e) {
    e.preventDefault();
    if (isPhoneNumberValid()) {
      window.signingIn = true;
      updateSignInButtonUI();
      var phoneNumber = getPhoneNumberFromUserInput();
      var appVerifier = window.recaptchaVerifier;
      firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
          .then(function(confirmationResult) {
            window.signingIn = false;
            updateSignInButtonUI();
            resetRecaptcha();
            
            swal({
          	  title: "인증번호를 입력해주세요",
	          content: {
	        	  element: "input",
	        	  attributes: {
	        		  placeholder: "인증번호 입력",
	        		  type: "text",
	        		},
	        	},
            }).then((inputValue) => {
          		if (inputValue) {
                      confirmationResult.confirm(inputValue).then(function () {
                    	  opener.document.getElementById("phone_number").value = document.getElementById("phone-number").value.replace("+82 ","");
                    	  opener.document.getElementById("phone_auth_finish").style.display = "inline";
                    	  opener.document.getElementById("phone_auth_button").style.display = "none";
        	              window.close();
                      }).catch(function (error) {
                        // User couldn't sign in (bad verification code?)
                        console.error('인증코드 확인 중 에러가 발생했습니다.', error);
                        swal('인증코드 확인 중 에러가 발생했습니다.:\n\n'
                                + error.code + '\n\n' + error.message);
/*                           window.alert('인증코드 확인 중 에러가 발생했습니다.:\n\n'
                            + error.code + '\n\n' + error.message) */
                      });
                    }
                  
          		});
          }).catch(function(error) {
              // Error; SMS not sent
              window.signingIn = false;
              /* console.error('Error during signInWithPhoneNumber', error);
              window.alert('Error during signInWithPhoneNumber:\n\n'
                  + error.code + '\n\n' + error.message); */
                  console.error('인증코드 확인 중 에러가 발생했습니다.', error);
                  swal('인증코드 확인 중 에러가 발생했습니다.:\n\n'
                          + error.code + '\n\n' + error.message);
              updateSignInButtonUI();
              resetRecaptcha();
            });
    }
  }
  /**
   * Reads the phone number from the user input.
   */
  function getPhoneNumberFromUserInput() {
    return document.getElementById('phone-number').value;
  }
  /**
   * Returns true if the phone number is valid.
   */
  function isPhoneNumberValid() {
    var pattern = /^\+[0-9\s\-\(\)]+$/;
    var phoneNumber = getPhoneNumberFromUserInput();
    return phoneNumber.search(pattern) !== -1;
  }
  /**
   * This resets the recaptcha widget.
   */
  function resetRecaptcha() {
    return window.recaptchaVerifier.render().then(function(widgetId) {
      grecaptcha.reset(widgetId);
    });
  }
  /**
   * Updates the Sign-in button state depending on ReCaptcha and form values state.
   */
  function updateSignInButtonUI() {
    document.getElementById('sign-in-button').disabled = !isPhoneNumberValid() || !!window.signingIn;
  }
</script>
</body>
</html>