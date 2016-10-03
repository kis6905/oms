package com.open.ms.service.common;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.vo.common.MyService;

@Service
public interface MyServiceService {
	
	public List<MyService> getMyServiceList();
	public MyService getMyService(Integer serviceId);
	
}
