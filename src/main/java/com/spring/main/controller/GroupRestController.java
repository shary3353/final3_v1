package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.main.service.GroupService;

@RestController
public class GroupRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GroupService groupService;

	
	//  url : list/보여줄 개수/페이지/옵션
	@RequestMapping(value = "/groupList/{pagePerCnt}/{page}/{opt}", method = RequestMethod.GET)
	public HashMap<String, Object> list( @PathVariable int pagePerCnt, @PathVariable int page,  @PathVariable int opt) {
		HashMap<String , Object> map = new HashMap<String, Object>();	
		logger.info("opt:"+opt);
		logger.info("pagePerCnt :{}, page :{}", pagePerCnt, page);
		logger.info("리스트 요청");
		return groupService.groupList(pagePerCnt,page,opt);
	}
	
	@RequestMapping(value = "/groupSearchList/{pagePerCnt}/{page}/{opt}", method = RequestMethod.GET)
	public HashMap<String, Object> groupSearchList(  @PathVariable int pagePerCnt, @PathVariable int page,  @PathVariable int opt,  @RequestParam HashMap<String , String> params, RedirectAttributes rAttr ) {
		logger.info("search params: "+params);
		logger.info("opt:"+opt);
		logger.info("pagePerCnt :{}, page :{}", pagePerCnt, page);
		logger.info("리스트 요청");
		return null;
	}
	
	
}