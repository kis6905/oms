package com.open.ms.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.OmsService;

/**
 * @author iskwon
 */
@Service
public interface OmsServiceService {
	
	public List<OmsService> getOmsServiceList(Member member);
	public OmsService getOmsService(Integer serviceId);
	
}
