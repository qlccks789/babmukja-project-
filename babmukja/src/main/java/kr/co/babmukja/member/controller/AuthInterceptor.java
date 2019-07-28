package kr.co.babmukja.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.babmukja.repository.domain.Member;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	// 인증필터와 같은 클래스 

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 실행하기 전에 ?? 
		
		HttpSession session = request.getSession(); // 세션 얻어오기
		
		Member m = (Member)session.getAttribute("user");
		if(m != null) {
			// 로그인 한 상태
			return true; // true -> 원래 요청한 페이지로 넘어감, 별다른 작업없이 넘어간다  
		} 
		// 로그인 하지 않은 상태
		response.sendRedirect("/babmukja/member/loginform.do");
		return false; // false -> 원래 가려고 한 페이지로 넘어가지 않는다
	}

}
