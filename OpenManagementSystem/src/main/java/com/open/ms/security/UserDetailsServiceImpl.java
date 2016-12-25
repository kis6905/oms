package com.open.ms.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.open.ms.common.Codes;
import com.open.ms.common.mapper.ComCodeMapper;
import com.open.ms.common.mapper.MemberMapper;
import com.open.ms.common.mapper.RoleMapper;
import com.open.ms.common.vo.ComCode;
import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.Role;

/**
 * 로그인 시 비밀번호 확인해 성공, 실패 처리
 * DB에 저장된 권한 부여
 * 
 * @author iskwon
 */
public class UserDetailsServiceImpl implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private ComCodeMapper comCodeMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public UserDetails loadUserByUsername(String memberId) {
		logger.info("-> [memberId = {}]", memberId);
		
		UserDetails user = null;
		Member member = memberMapper.getMemberOfId(memberId);
		
		if (member != null) {
			Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
			boolean accountNonLocked = true; // true = 잠김x, false = 잠김o
			
			List<Role> roleList = roleMapper.getRoleListOfMember(member);
			// 권한 설정
			for (Role role : roleList)
				authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
			
			// 관리자일 경우 passwordFailCnt를 확인하지 않는다.
			if (member.getGradeCode() == Codes.GRADE_CODE_USER) {
				ComCode comCode = new ComCode(Codes.INFO_CODE_GROUP, Codes.INFO_CODE_VALID_PASSWORD_CNT);
				int validPasswordFailCnt = Integer.parseInt(comCodeMapper.getComCode(comCode).getCodeValue());
				if (validPasswordFailCnt <= member.getPasswordFailCnt())
					accountNonLocked = false; // 비밀번호를 일정 횟수 이상 틀린 경우, 계정 잠김 상태로 본다.
			}
			
			// spring security 에서 제공하는 User 객체이다.
			user = new User(memberId, member.getPassword(), true, true, true, accountNonLocked, authorities);
			logger.info("<- [user = {}]", user.toString());
		}
		
		return user;
	}
	
}
