package com.open.ms.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.Member;

@Service
public interface MemberService {
	
	public boolean checkId(String memberId);
	public boolean checkNickname(String nickname);
	public boolean joinMember(Member member) throws Exception;
	public List<Member> getSearchMemberList(String search, String memberId);
	
}
