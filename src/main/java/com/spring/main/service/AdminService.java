package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;

@Service
public class AdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDAO dao; 
	@Autowired AdminService service;
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		// 오늘 날짜 불러오기
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(new Date(System.currentTimeMillis()));
		logger.info("date:{}",sqlDate);
		
		// 오늘 가입자 수 불러오기
		int newMemberCnt = dao.cntNewMember("21/04/23");
		logger.info("오늘 가입자 수: {} ", newMemberCnt);
		
		// 오늘 가입한 회원 불러오기
		ArrayList<MemberDTO> newMemberList = dao.listNewMember("21/04/23");
		logger.info("오늘 가입자 ID : {}", newMemberList.size());
		mav.addObject("newMemberList", newMemberList);
		mav.addObject("memberCnt", newMemberCnt);
		
		// 현재 관리자 수 불러오기
		int adminCnt = dao.cntNewAdmin();
		logger.info("관리자 수 : {} ", adminCnt);
		
		// 현재 관리자 ID 불러오기
		ArrayList<MemberDTO> adminList = dao.listAdmin();
		logger.info("관리자 ID : {}", adminList.size());
		mav.addObject("adminList", adminList);
		mav.addObject("adminCnt", adminCnt);
		
		// 오늘 신고된 게시글 수 불러오기
		int reportedBrdCnt = dao.reportedBrdCnt("21/04/23");
		logger.info("신고된 게시글 수 : {}", reportedBrdCnt);
		
		// 오늘 신고된 게시글 제목, 카테고리 불러오기
		HashMap<String, Object> reportedBrdList = dao.reportedBrdList("21/04/23");
		logger.info("신고된 게시글 : {}", reportedBrdList);
		mav.addObject("reportedBrdCnt", reportedBrdCnt);
		mav.addObject("reportedBrdList", reportedBrdList);
		
		// 오늘 게시된 댓글 수 불러오기
		int reportedCommCnt = dao.reportedCommCnt("21/04/23");
		logger.info("신고된 댓글 수 : {}", reportedCommCnt);
		
		// 오늘 신고된 댓글 내용, 카테고리 불러오기
		HashMap<String, Object> reportedCommList = dao.reportedCommList("21/04/23");
		logger.info("신고된 댓글 : {}", reportedCommList);
		mav.addObject("reportedBrdCnt", reportedCommCnt);
		mav.addObject("reportedBrdList", reportedCommList);
		
		mav.setViewName("adminMain");
		return mav;
	}
	
	public HashMap<String, Object> list(int pagePerCnt, int page, String gradeIdx, String stateIdx, String searchId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		int maxCnt = dao.memberMaxCnt(gradeIdx, stateIdx, searchId);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminMemberList(start, end, gradeIdx, stateIdx, searchId));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		
		return map;
	}

	public ModelAndView memberDetail(String id) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = new MemberDTO();
		dto = dao.memberDetail(id);
		mav.addObject("dto", dto);
		mav.setViewName("adminMemberDetail");
		return mav;
	}

	public HashMap<String, Object> comList(int pagePerCnt, int page, String searchId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		HashMap<String, Object> mapId = new HashMap<String, Object>();
		mapId.put("searchId", searchId);
		logger.info("id : {}", mapId);
		int maxCnt = dao.companyMaxCnt(mapId);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminCompanyList(start, end, searchId));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView companyDetail(String comId) {
		ModelAndView mav = new ModelAndView();
		CompanyMemberDTO dto = new CompanyMemberDTO();
		dto = dao.companyDetail(comId);
		long rate = dto.getRate();
		logger.info("rate : {}",rate);
		mav.addObject("dto", dto);
		mav.setViewName("adminCompanyDetail");
		return mav;
	}

	public String penaltyCfm(String id, String stateIdx) {
		int success = dao.penaltyCfm(id, stateIdx);
		return null;
	}


	
}
