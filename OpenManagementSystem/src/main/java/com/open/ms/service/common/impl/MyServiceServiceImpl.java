package com.open.ms.service.common.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.mapper.common.MyServiceMapper;
import com.open.ms.service.common.MyServiceService;
import com.open.ms.vo.common.MyService;

@Service(value = "myServiceServiceImpl")
public class MyServiceServiceImpl implements MyServiceService {

	@Autowired
	private MyServiceMapper myServiceMapper;
	
	/**
	 * 서비스 목록 리턴
	 */
	@Override
	public List<MyService> getMyServiceList() {
		return myServiceMapper.getMyServiceList();
	}

	/**
	 * MyService 리턴
	 */
	@Override
	public MyService getMyService(Integer serviceId) {
		return myServiceMapper.getMyServiceOfServiceId(serviceId);
	}
	
}
