package com.open.ms.common.mapper;

import java.util.List;

import com.open.ms.common.vo.MyService;

/**
 * @author iskwon
 */
public interface MyServiceMapper {
	
	List<MyService> getMyServiceList();
	MyService getMyServiceOfServiceId(Integer serviceId);
	
}
