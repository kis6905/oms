package com.open.ms.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.Member;

/**
 * @author iskwon
 */
@Service
public interface MemberService {

	public List<Member> getMemberList(long offset, long limit, String sort, String order) throws Exception;
	public Integer getMemberListTotalCnt() throws Exception;
	
	public boolean checkId(String memberId) throws Exception;
	public boolean checkMemberName(String memberName) throws Exception;
	
	public boolean insertMember(Member member) throws Exception;
	public boolean updateMember(Member member) throws Exception;
	public boolean deleteMember(Member member) throws Exception;
	
}
