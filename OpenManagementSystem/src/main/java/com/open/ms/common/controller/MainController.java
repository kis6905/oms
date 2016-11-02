package com.open.ms.common.controller;

import java.util.List;

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

import com.open.ms.common.service.MyServiceService;
import com.open.ms.common.vo.MyService;

@Controller
public class MainController {

	// 서비스 페이지로 이동 시 jsp 이름 앞에 붙일 폴더 명
	private static final String PREFIX_DIRECTORY = "service/";
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MyServiceService myServiceServiceImpl;
	
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
	public String postMyServiceList() {
		
		logger.info("-> []");
		
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonMyServiceArray = new JSONArray();
		
		List<MyService> myServiceList = myServiceServiceImpl.getMyServiceList();
		for (MyService myService : myServiceList)
			jsonMyServiceArray.add(myService.toJSONObject());
		
		jsonResult.put("myServiceList", jsonMyServiceArray);
		
		logger.info("<- [myServiceListSize = {}]", myServiceList.size());
		return jsonResult.toString();
	}
	
	/**
	 * 서비스에 맞는 페이지 이동
	 */
	@RequestMapping(value = "/service/page/{serviceId}", method = RequestMethod.GET)
	public String getServicePage(
			@PathVariable(value = "serviceId") Integer serviceId,
			ModelMap modelMap) {
		
		logger.info("-> [serviceId = {}]", serviceId);
		
		MyService myService = myServiceServiceImpl.getMyService(serviceId);
		
		if (myService == null)
			return "redirect:/error/204";
		
		modelMap.addAttribute("myService", myService);
		
		logger.info("<- [myService = {}]", myService.toString());
		return PREFIX_DIRECTORY + myService.getPageName();
	}
	
}
