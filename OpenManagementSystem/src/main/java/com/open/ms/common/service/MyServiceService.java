package com.open.ms.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.MyService;

@Service
public interface MyServiceService {
	
	public List<MyService> getMyServiceList();
	public MyService getMyService(Integer serviceId);
	
}
