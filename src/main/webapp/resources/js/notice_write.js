$(document).ready(function(){
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "smart", // textarea에서 지정한 id와 일치해야 합니다.
			// SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "/hos/resources/smartEditor/SmartEditor2Skin.html",
			htParams:{
				// 툴바 사용여부(true:사용/false:사용하지 않음)
				bUseToolbar:true,
				// 입력창 크기 조절바 사용 여부(true: 사용 / false: 사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부(true:사용 / false:사용하지 않음)
				bUseModeChanger:true,
				fOnBeForeUnload : function(){
					
				}
			},
			fOnAppLoad : function(){
				// 기존 저장된 내용의 text내용을 에디터 상에 뿌려주고자 할 때 사용
				oEditors.getById["smart"].exec("PASTE_HTML", [""]);
			},
			fCreator: "createSEditor2"
		});
	
	});
	
	$('#btnSave').click(function(){
		saveNotice();
	});
	
	$('#btnList').bind('click',function(){
		$('#frm').attr('action', 'noticelist');
		$('#frm').submit();
	});
	
	function saveNotice(){
		oEditors.getById["smart"].exec("UPDATE_CONTENTS_FIELD", []);
        var queryString = $('form').serialize();
		$.ajax({
			type:'post',
			url:'/hos/noticewrite',
			data:queryString,
			success:function(){
		//		alert(res);
				location.href='/hos/noticelist';
			},error:function(e){
				alert(e.status + ' 오류가 발생했습니다.');
				location.href='/hos/noticewrite';
			}
		});
	}
	
});