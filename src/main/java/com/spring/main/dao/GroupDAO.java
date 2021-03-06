package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.Comments2ndDTO;
import com.spring.main.dto.CommentsDTO;
import com.spring.main.dto.GroupDTO;
import com.spring.main.dto.ReportDTO;

public interface GroupDAO {

	int groupWrite(GroupDTO groupDTO);

	GroupDTO groupDetail(int gpIdx);

	void groupWriteFile(String key, String string, int gpIdx, String string2);

	String groupCtg(int gpCtgIdx);
	
	String gpProgress(int progIdx);

	int groupAllCount(int opt);

	ArrayList<GroupDTO> groupList(int start, int end, int opt);

	ArrayList<String> groupGetFileName(int gpIdx);

	int groupPhotoDel(int gpIdx);

	int groupDel(int gpIdx);

	void groupUpHit(int gpIdx);

	/* ArrayList<GroupDTO> groupSearch(HashMap<String, String> params); */

	int groupUpdate(GroupDTO groupDTO);

	void groupUpdateFile(String key, String string, int gpIdx);

	int applyGroup(int gpIdx, String applyId);

	int currUserUp(int gpIdx);

	int cancelGroup(int gpIdx, String applyId);

	int currUserDown(int gpIdx);

	int groupSearchCount(String opt, String keyword);

	ArrayList<GroupDTO> groupSearchList(String startStr, String endStr, String opt, String keyword);

	String applyCheck(int gpIdx, String applyId);

	ArrayList<GroupDTO> applyList(int gpIdx);

	int progUpdate(int gpIdx, int updateProg);

	ArrayList<GroupDTO> deadlineChk();

	int groupCommentWrite(HashMap<String, String> params);

	ArrayList<CommentsDTO> groupCommentList(int gpIdx);

	int groupCommDel(int commIdx);

	int groupcurrUser(int gpIdx);

	String groupCommRecChk(int commIdx, String loginId);

	int groupCommRec(int commIdx, String loginId);

	int groupCommDec(int commIdx, String loginId);

	ArrayList<GroupDTO> myRecList(String loginId);

	int groupRecommWrite(HashMap<String, String> params);

	ArrayList<Comments2ndDTO> groupRecommList(int commIdx);

	int groupRecommDel(int com2ndIdx);

	ReportDTO groupRepBoardForm(int gpIdx);

	int groupRepBoard(HashMap<String, String> params);

	CommentsDTO groupCommForm(int commIdx);

	int groupRepComm(HashMap<String, String> params);

	Comments2ndDTO groupRecommForm(int commIdx);

	int groupRepRecomm(HashMap<String, String> params);

	void groupDownHit(int gpIdx);




	

}
