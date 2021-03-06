package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.service.MemberService;

@RestController
public class MemberController {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;

	@RequestMapping(value = "/membership", method = RequestMethod.GET)
	public ModelAndView membership() {
		logger.info("로그인 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public  ModelAndView login(Model model, @RequestParam String id, @RequestParam String pw 
			,@RequestParam String mode , HttpSession session, RedirectAttributes rAttr) {
		logger.info("로그인  요청");
		logger.info("id : " + id  + "pw :" + pw +"mode :" + mode);
		ModelAndView mav = new ModelAndView();
		String msg = "아이디와 패스워드를 확인해 주세요.";
		String page = "login";
		
		if(mode.equals("member")) {
			if(service.login(id,pw)) {
				msg ="로그인에 성공 하였습니다.";
				page="redirect:/";
				session.setAttribute("loginId", id);
				logger.info("세션 아이디 : {}", session.getAttribute("loginId"));
			}
			
		}else if(mode.equals("company")) {
			if(service.cLogin(id,pw)) {
				msg ="로그인에 성공 하였습니다.";
				page="redirect:/";
				session.setAttribute("cLoginId", id);
				logger.info("세션 아이디 : {}", session.getAttribute("cLoginId"));
			}
		}
		rAttr.addFlashAttribute("msg", msg);
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public ModelAndView registForm() {
		logger.info("회원가입 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("registForm");
		return mav;
	}
	
	@RequestMapping(value = "/cRegistForm", method = RequestMethod.GET)
	public ModelAndView cRegistForm() {
		logger.info("업체회원가입 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberCregistForm");
		return mav;
	}
	
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	public HashMap<String, Object> overlay(Model model , @RequestParam HashMap<String, String> params) {
		logger.info("아이디 중복확인  요청");
		logger.info("params {} " , params);
		boolean success = false;
		if(service.overlay(params) == 0) {
			success = true;
		}
		logger.info("success {} " , success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	@RequestMapping(value = "/cOverlay", method = RequestMethod.GET)
	public HashMap<String, Object> cOverlay(Model model , @RequestParam HashMap<String, String> params) {
		logger.info("업체아이디 중복확인  요청");
		logger.info("params {} " , params);
		boolean success = false;
		if(service.cOverlay(params) == 0) {
			success = true;
		}
		logger.info("success {} " , success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	@RequestMapping(value = "/company_nameOverChk", method = RequestMethod.GET)
	public HashMap<String, Object> company_nameOverChk(Model model , @RequestParam HashMap<String, String> params) {
		logger.info("업체명 중복확인  요청");
		logger.info("params {} " , params);
		boolean success = false;
		if(service.company_nameOverChk(params) == 0) {
			success = true;
		}
		logger.info("success {} " , success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	@RequestMapping(value = "/licenChk", method = RequestMethod.GET)
	public HashMap<String, Object> licenChk(Model model , @RequestParam HashMap<String, String> params) {
		logger.info("사업자번호 중복확인  요청");
		logger.info("params {} " , params);
		boolean success = false;
		if(service.licenChk(params) == 0) {
			success = true;
		}
		logger.info("success {} " , success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
		logger.info("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		logger.info("params {} ",params);
		boolean success = false;
		if(service.join(params) > 0 ) {
			success = true;
		}
		logger.info("success {} ", success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);

		return map;
	}
	
	@RequestMapping(value = "/cJoin", method = RequestMethod.POST)
	public HashMap<String, Object> cJoin(@RequestParam HashMap<String, String> params) {
		logger.info("업체회원가입 요청");
		ModelAndView mav = new ModelAndView();
		logger.info("params {} ",params);
		boolean success = false;
		if(service.cJoin(params) > 0 ) {
			success = true;
		}
		logger.info("success {} ", success);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);

		return map;
	}
	
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public ModelAndView findId() {
		logger.info("아이디찾기 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idFind");
		return mav;
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public ModelAndView findPw() {
		logger.info("비밃번호찾기 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pwFind");
		return mav;
	}
	
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public ModelAndView idFind(@RequestParam HashMap<String, String> params) {
		logger.info("일반회원 아이디 찾기 요청");
		logger.info("params {} " , params);
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = service.idFind(params);
		if(dto != null) {
			logger.info("찾아낸 아이디 {} " , dto.getId());
			logger.info("찾아낸 아이디 가입날짜 {} " + dto.getReg_date());
			mav.addObject("findId", dto.getId());
			mav.addObject("reg_date", dto.getReg_date());			
		}
		mav.setViewName("idResult");
		return mav;
	}
	
	@RequestMapping(value = "/comIdFind", method = RequestMethod.POST)
	public ModelAndView comIdFind(@RequestParam HashMap<String, String> params) {
		logger.info("업체회원 아이디 찾기 요청");
		logger.info("params {} " , params);
		ModelAndView mav = new ModelAndView();
		CompanyMemberDTO dto = service.comIdFind(params);
		if(dto != null) {
			mav.addObject("findId", dto.getComId());
			mav.addObject("reg_date" , dto.getReg_date());
		}
		
		mav.setViewName("idResult");
		return mav;
		
	}
	
		@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
		public ModelAndView pwFind(@RequestParam HashMap<String, String> params) {
			logger.info("일반회원 비밀번호 찾기 요청");
			logger.info("params {} " , params);
			ModelAndView mav = new ModelAndView();
			
			String page = "pwFind";
			String msg = "요청하신 정보로 찾을수 없습니다.";
			MemberDTO dto = service.pwFind(params);
			if(dto != null) {
				logger.info("findId {} " , dto.getId());
				logger.info("findPw {} ", dto.getPw());				
				page ="memberPwReset";
				msg ="비밀번호를 재설정 합니다.";
				mav.addObject("id", dto.getId());
			}
			mav.addObject("msg", msg);
			mav.setViewName(page);
			return mav;
	}
		
		@RequestMapping(value = "/cPwFind", method = RequestMethod.POST)
		public ModelAndView comPwFind(@RequestParam HashMap<String, String> params) {
			logger.info("업체회원 비밀번호 찾기 요청");
			logger.info("params {} " , params);
			ModelAndView mav = new ModelAndView();
			CompanyMemberDTO dto = new CompanyMemberDTO();
			String page = "pwFind";
			String msg = "요청하신 정보로 찾을수 없습니다.";
			dto = service.comPwFind(params);
			logger.info("findId {} " , dto.getComId());
			logger.info("findPw {} ", dto.getPw());
			String findId = dto.getComId();
			String findPw = dto.getPw();
			if(findId != null  && findPw != null) {
				page ="memberCPwReset";
				msg ="비밀번호를 재설정 합니다.";
				mav.addObject("id", findId);
			}
			mav.addObject("msg", msg);
			mav.setViewName(page);
			return mav;
	}
		
		@RequestMapping(value = "/adminLogPage", method = RequestMethod.GET)
		public ModelAndView adminLogPage() {
			logger.info("관리자로그인 페이지 요청");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminLogin");
			return mav;
		}	
		@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
		public  ModelAndView adminLogin(Model model, @RequestParam String id, @RequestParam String pw , HttpSession session) {
			logger.info("관리자로그인  요청");
			logger.info("id : " + id  + "pw :" + pw);
			ModelAndView mav = new ModelAndView();
			String msg = "아이디와 패스워드를 확인해 주세요.";
			String page = "adminLogin";
			String adminLoginId = service.adLogin(id,pw);
			if(adminLoginId != null) {
				msg ="로그인에 성공 하였습니다.";
				page="redirect:/adminMain";
				session.setAttribute("adminLoginId", adminLoginId);
			}
			logger.info("세션 아이디 : " + adminLoginId);
			mav.addObject("msg", msg);
			mav.setViewName(page);
			return mav;
		}

		@RequestMapping(value = "/resetCPw" , method = RequestMethod.POST)
		public ModelAndView restCPw(@RequestParam String id , String rPw , RedirectAttributes rAttr) {
			logger.info("비밀번호 재설정 요청");
			logger.info("재설정  아이디 " + id + "/" + "재설정 비밀번호" + rPw);
			ModelAndView mav = new ModelAndView();
			boolean success = false;
			String msg = "실패 하였습니다.";
			String page = "findPw";
			if(service.resetCPw(id,rPw) > 0) {
				success = true;
				msg = "비밀번호를 재설정 하였습니다.";
				page = "redirect:/membership";
			}
			rAttr.addFlashAttribute("msg",msg);
			mav.setViewName(page);
			return mav;
		}
		
		@RequestMapping(value = "/resetPw" , method = RequestMethod.POST)
		public ModelAndView resetPw(@RequestParam String id , String rPw , RedirectAttributes rAttr) {
			logger.info("비밀번호 재설정 요청");
			logger.info("재설정  아이디 " + id + "/" + "재설정 비밀번호" + rPw);
			ModelAndView mav = new ModelAndView();
			boolean success = false;
			String msg = "실패 하였습니다.";
			String page = "findPw";
			if(service.resetPw(id,rPw) > 0) {
				success = true;
				msg = "비밀번호를 재설정 하였습니다.";
				page = "redirect:/membership";
			}
			rAttr.addFlashAttribute("msg",msg);
			mav.setViewName(page);
			return mav;
		}
		
		@RequestMapping(value = "/logOut", method = RequestMethod.GET)
		public ModelAndView logOut(HttpSession session , RedirectAttributes rAttr) {
			logger.info("로그아웃 요청");
			String loginId = (String) session.getAttribute("loginId");
			String cLoginId = (String) session.getAttribute("cLoginId");
			String msg = "로그아웃 실패";
			ModelAndView mav = new ModelAndView();
			if(loginId != null) {
				session.removeAttribute("loginId");
				logger.info("로그아웃 아이디 {} " , loginId);
				msg = "로그아웃 되었습니다.";
			}else if(cLoginId != null){
				session.removeAttribute("cLoginId");
				logger.info("로그아웃 업체회원 아이디 {} " , cLoginId);
				msg = "업체회원 로그아웃 되었습니다.";
			}
			rAttr.addFlashAttribute("msg", msg);
			mav.setViewName("redirect:/membership");
			return mav;
			
		}
}

