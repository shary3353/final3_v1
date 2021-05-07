package com.spring.main.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.MemberDTO;

public class PenaltyInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	AdminDAO admindao;
	
	@SuppressWarnings("null")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("패널티 확인중....");
		boolean pass = false;
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId:"+loginId);
		String msg = "현재 작성금지 패널티 적용중입니다.";
		MemberDTO dto = admindao.checkPenalty(loginId);
		System.out.println(dto.getStateIdx());
		if(dto.getStateIdx() == 0) {
			pass = true;
		} else if (dto.getStateIdx() == 7) {
			msg = "현재 계정 비활성화 상태입니다.";
		}
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
		return pass;
	}
	
	
}