package com.open.ms.mapper.common;

import com.open.ms.vo.common.PersistentLogin;

/**
 * @author iskwon
 */
public interface PersistentLoginMapper {
	
	PersistentLogin getTokenForSeries(String series);
	int insertToken(PersistentLogin token);
	int updateToken(PersistentLogin token);
	int deleteToken(String memberId);
	
}
