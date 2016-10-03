package com.open.ms.service.common;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.vo.common.Member;

@Service
public interface MemberService {
	
	public boolean checkId(String memberId);
	public boolean checkNickname(String nickname);
	public boolean joinMember(Member member) throws Exception;
	public List<Member> getSearchMemberList(String search, String memberId);
	
}
