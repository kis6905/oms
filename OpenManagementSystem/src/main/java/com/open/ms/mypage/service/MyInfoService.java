package com.open.ms.mypage.service;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.Member;

/**
 * @author iskwon
 */
@Service
public interface MyInfoService {
	
	boolean updateMyInfo(Member member) throws Exception;
	
}
