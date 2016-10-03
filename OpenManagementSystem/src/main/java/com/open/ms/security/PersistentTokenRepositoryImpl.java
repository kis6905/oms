package com.open.ms.security;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.open.ms.mapper.common.MemberMapper;
import com.open.ms.mapper.common.PersistentLoginMapper;
import com.open.ms.vo.common.Member;
import com.open.ms.vo.common.PersistentLogin;

/**
 * PersistentTokenRepository 구현 클래스
 * 자동 로그인 관련
 * 
 * @author iskwon
 */
public class PersistentTokenRepositoryImpl implements PersistentTokenRepository {

	private static final Logger logger = LoggerFactory.getLogger(PersistentTokenRepositoryImpl.class);
	
	@Autowired
	private PersistentLoginMapper persistentLoginMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private HttpServletRequest request;
	
	@Override
	public void createNewToken(PersistentRememberMeToken token) {
		persistentLoginMapper.insertToken(new PersistentLogin(token));
	}

	@Override
	public void updateToken(String series, String tokenValue, Date lastUsed) {
		persistentLoginMapper.updateToken(new PersistentLogin(null, series, tokenValue, lastUsed));
	}

	@Override
	public PersistentRememberMeToken getTokenForSeries(String seriesId) {
		logger.info("-> [seriesId = {}]", seriesId);
		
		PersistentLogin token = persistentLoginMapper.getTokenForSeries(seriesId);
		
		if (token != null) {
			// request를 가져와 session에 MEMBER 세팅
			HttpSession session = request.getSession(true);
			Member member = memberMapper.getMemberOfId(token.getMemberId());
			session.setAttribute("MEMBER", member);
			
			logger.info("<- [member = {}]", member.toString());
			return new PersistentRememberMeToken(token.getMemberId(), token.getSeries(), token.getTokenValue(), token.getLastUsed());
		}
		
		logger.info("<- [token is null!]");
		return null;
	}

	@Override
	public void removeUserTokens(String username) {
		persistentLoginMapper.deleteToken(username);
	}

}
