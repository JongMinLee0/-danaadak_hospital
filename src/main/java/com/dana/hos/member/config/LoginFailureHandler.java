package com.dana.hos.member.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {

		String username = request.getParameter("username");
		String type = request.getParameter("type");
		String errorMsg = "";
		
		if(exception instanceof DisabledException) {
            errorMsg = "계정이 활성화되지 않았습니다.관리자의 승인 후 사용하실 수 있습니다.";
        }else {
        	errorMsg = "회원정보를 확인해주세요.";
        }

		request.setAttribute("username", username);
		request.setAttribute("errorMsg", errorMsg);
		request.setAttribute("type", type);

		// 로그인 실패시 필요한 작업 추가
		request.getRequestDispatcher("login").forward(request, response);
		// response.sendRedirect("login?error=true");

	}
}
