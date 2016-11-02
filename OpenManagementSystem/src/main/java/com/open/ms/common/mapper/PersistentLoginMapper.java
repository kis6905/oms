package com.open.ms.common.mapper;

import com.open.ms.common.vo.PersistentLogin;

/**
 * @author iskwon
 */
public interface PersistentLoginMapper {
	
	PersistentLogin getTokenForSeries(String series);
	int insertToken(PersistentLogin token);
	int updateToken(PersistentLogin token);
	int deleteToken(String memberId);
	
}
