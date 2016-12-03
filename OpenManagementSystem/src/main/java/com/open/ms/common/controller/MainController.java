package com.open.ms.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.service.OmsServiceService;
import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.OmsService;

/**
 * @author iskwon
 */
@Controller
public class MainController {

	private static final String PREFIX_DIRECTORY = "service/";
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private OmsServiceService omsServiceServiceImpl;
	
	/**
	 * 메인 페이지 이동
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getMain(ModelMap modelMap) {
		
		logger.info("-> []");
		
		logger.info("<- []");
		return "main/main";
	}
	
	/**
	 * 메인 페이지에서 보여줄 서비스 목록 리턴
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/service/list", method = RequestMethod.POST)
	@ResponseBody
	public String postOmsServiceList(HttpServletRequest request) {
		
		logger.info("-> []");
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonOmsServiceArray = new JSONArray();
		
		List<OmsService> omsServiceList = omsServiceServiceImpl.getOmsServiceList(member);
		for (OmsService omsService : omsServiceList)
			jsonOmsServiceArray.add(omsService.toJSONObject());
		
		jsonResult.put("omsServiceList", jsonOmsServiceArray);
		
		logger.info("<- [omsServiceListSize = {}]", omsServiceList.size());
		return jsonResult.toString();
	}
	
	/**
	 * 서비스에 맞는 페이지 이동
	 * 
	 * @see 2016-12-01 by.iskwon
	 * 		- page 리턴 방식 변경으로 인해 더이상 사용하지 않음
	 */
	@Deprecated
	@RequestMapping(value = "/service/page/{serviceId}", method = RequestMethod.GET)
	public String getServicePage(
			@PathVariable(value = "serviceId") Integer serviceId,
			ModelMap modelMap) {
		
		logger.info("-> [serviceId = {}]", serviceId);
		
		OmsService omsService = omsServiceServiceImpl.getOmsService(serviceId);
		
		if (omsService == null)
			return "redirect:/error/204";
		
		modelMap.addAttribute("omsService", omsService);
		
		logger.info("<- [omsService = {}]", omsService.toString());
		return PREFIX_DIRECTORY + omsService.getPageName();
	}
	
}
