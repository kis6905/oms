package com.open.ms.mapper.common;

import java.util.List;

import com.open.ms.vo.common.MyService;

/**
 * @author iskwon
 */
public interface MyServiceMapper {
	
	List<MyService> getMyServiceList();
	MyService getMyServiceOfServiceId(Integer serviceId);
	
}
