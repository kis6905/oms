package com.open.ms.common.mapper;

import java.util.List;

import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.OmsService;

/**
 * @author iskwon
 */
public interface OmsServiceMapper {
	
	List<OmsService> getOmsServiceList(Member member);
	OmsService getOmsServiceOfServiceId(Integer serviceId);
	
}
