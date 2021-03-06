package com.spring.main.service;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.CompanyMemberDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.PhotoDTO;

@Service
public class AdminService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminDAO dao;
	@Autowired
	AdminService service;
	@Autowired
	BoardDAO boardDAO;

	@Value("#{config['Globals.root']}")
	String root;

	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		// 오늘 날짜 불러오기
		String sqlDate = new SimpleDateFormat("yy/MM/dd").format(new Date(System.currentTimeMillis()));
		logger.info("date:{}", sqlDate);

		// 오늘 가입자 수 불러오기
		int newMemberCnt = dao.cntNewMember(sqlDate);
		logger.info("오늘 가입자 수: {} ", newMemberCnt);

		// 오늘 가입한 회원 불러오기
		ArrayList<MemberDTO> newMemberList = dao.listNewMember(sqlDate);
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
		int reportedBrdCnt = dao.reportedBrdCnt(sqlDate);
		logger.info("신고된 게시글 수 : {}", reportedBrdCnt);

		// 오늘 신고된 게시글 제목, 카테고리 불러오기
		ArrayList<BoardDTO> reportedBrdList = dao.reportedBrdList(sqlDate);
		logger.info("신고된 게시글 : {}", reportedBrdList);
		mav.addObject("reportedBrdCnt", reportedBrdCnt);
		mav.addObject("reportedBrdList", reportedBrdList);

		// 오늘 게시된 댓글 수 불러오기
		int reportedCommCnt = dao.reportedCommCnt(sqlDate);
		logger.info("신고된 댓글 수 : {}", reportedCommCnt);

		// 오늘 신고된 댓글 내용, 카테고리 불러오기
		HashMap<String, Object> reportedCommList = dao.reportedCommList(sqlDate);
		logger.info("신고된 댓글 : {}", reportedCommList);
		mav.addObject("reportedCommCnt", reportedCommCnt);
		mav.addObject("reportedCommList", reportedCommList);

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
		float rate = dto.getRate();
		logger.info("rate : {}", rate);
		mav.addObject("dto", dto);
		mav.setViewName("adminCompanyDetail");
		return mav;
	}

	public HashMap<String, Object> penaltyCfm(String id, String stateIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		String sqlDate = null;
		String adminId = "testAD";
		cal.setTime(new Date(System.currentTimeMillis()));
		int addDay = 0;
		if (!stateIdx.equals("0")) {
			if (stateIdx.equals("1")) {
				logger.info("작성금지 1일");
				addDay = 1;
			} else if (stateIdx.equals("2")) {
				logger.info("작성금지 3일");
				addDay = 3;
			} else if (stateIdx.equals("3")) {
				logger.info("작성금지 5일");
				addDay = 5;
			} else if (stateIdx.equals("4")) {
				logger.info("작성금지 7일");
				addDay = 7;
			} else if (stateIdx.equals("5")) {
				logger.info("작성금지 30일");
				addDay = 30;
			} else if (stateIdx.equals("6")) {
				logger.info("계정 비활성화");
			}
			cal.add(Calendar.DATE, addDay);
			sqlDate = df.format(cal.getTime());
			logger.info("sqlDate : {}", sqlDate);
			int endDaySuccess = dao.penaltyEndDay(id, stateIdx, sqlDate, adminId);
		} else if (stateIdx.equals("0")) {
			int delEndDay = dao.delEndDay(id);
		}
		int success = dao.penaltyCfm(id, stateIdx);
		String msg = "";
		logger.info("패널티 idx : {}", stateIdx);
		if (success > 0) {
			if (stateIdx.equals("1")) {
				logger.info("작성금지 1일");
				msg += "작성금지 1일 패널티가 부여되었습니다.";
			} else if (stateIdx.equals("2")) {
				logger.info("작성금지 3일");
				msg += "작성금지 3일 패널티가 부여되었습니다.";
				
			} else if (stateIdx.equals("3")) {
				logger.info("작성금지 5일");
				msg += "작성금지 5일 패널티가 부여되었습니다.";
			} else if (stateIdx.equals("4")) {
				logger.info("작성금지 7일");
				msg += "작성금지 7일 패널티가 부여되었습니다.";
			} else if (stateIdx.equals("5")) {
				logger.info("작성금지 30일");
				msg += "작성금지 30일 패널티가 부여되었습니다.";
			} else if (stateIdx.equals("6")) {
				logger.info("계정 비활성화");
				msg += "계정 비활성화 패널티가 부여되었습니다.";
			} else if (stateIdx.equals("0")) {
				logger.info("패널티 해제");
				msg = "패널티가 해제되었습니다.";
			}
		}
		logger.info(msg);
		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> adminSoundList(int pagePerCnt, int page, String stgctg) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		int boardCtg = 5;
		logger.info("boardCtg : {}", boardCtg);
		int maxCnt = dao.soundMaxCnt(boardCtg, stgctg);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminSoundList(start, end, stgctg));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView adminSoundDetail(int boardIdx) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = new BoardDTO();
		dto = dao.adminSoundDetail(boardIdx);
		ArrayList<PhotoDTO> fileList = boardDAO.fileList(boardIdx);
		logger.info("fileList.size  : {}", fileList.size());
		mav.addObject("fileList", fileList);
		mav.addObject("dto", dto);
		mav.setViewName("adminSoundDetail");
		return mav;
	}

	public void download(String oriFileName, String newFileName, HttpServletResponse resp) {
		logger.info("파일 다운로드 시작");
		try {
			// 1. 파일 불러오기(java.nio)
			Path path = Paths.get(root + "upload/" + newFileName);
			byte[] file = Files.readAllBytes(path);
			// 2. response 객체에 넣기(java.io)
			resp.setContentType("application/octet-stream");
			oriFileName = URLEncoder.encode(oriFileName, "UTF-8");// 한글 깨짐 방지
			resp.setHeader("content-Disposition", "attachment;fileName=\"" + oriFileName + "\"");
			// 전송하기
			OutputStream os = resp.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(os);
			bos.write(file);
			bos.flush();
			bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public HashMap<String, Object> adminReportedBrdList(int pagePerCnt, int page, int repCtgIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		logger.info("repCtgIdx : {}", repCtgIdx);
		int maxCnt = dao.reportedBrdMaxCnt(repCtgIdx);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminReportedBrdList(start, end, repCtgIdx));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> adminReportedCommList(int pagePerCnt, int page, int repCtgIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		logger.info("repCtgIdx : {}", repCtgIdx);
		int maxCnt = dao.reportedCommMaxCnt(repCtgIdx);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminReportedCommList(start, end, repCtgIdx));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> adminReportedGroupList(int pagePerCnt, int page, int repCtgIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerCnt;
		int start = end - (pagePerCnt - 1);
		logger.info("repCtgIdx : {}", repCtgIdx);
		int maxCnt = dao.reportedGroupMaxCnt(repCtgIdx);
		int maxPage = (int) Math.ceil(maxCnt / (double) pagePerCnt);
		logger.info("maxCnt : {}", maxCnt);
		logger.info("maxPage : {}", maxPage);
		map.put("list", dao.adminReportedGroupList(start, end, repCtgIdx));
		map.put("maxPage", maxPage);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> adminGroupBlind(int gpIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (dao.adminGroupBlind(gpIdx) > 0) {
			msg = "블라인드 처리 되었습니다.";
		}
		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> adminCommBlind(int commIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (dao.adminCommBlind(commIdx) > 0) {
			msg = "블라인드 처리 되었습니다.";
		}
		map.put("msg", msg);
		return map;
	}

	public HashMap<String, Object> adminBrdBlind(int boardIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		if (dao.adminBrdBlind(boardIdx) > 0) {
			msg = "블라인드 처리 되었습니다.";
		}
		map.put("msg", msg);
		return map;
	}

}
