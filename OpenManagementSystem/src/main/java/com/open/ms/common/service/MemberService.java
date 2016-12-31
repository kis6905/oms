package com.open.ms.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.open.ms.common.vo.Member;

/**
 * @author iskwon
 */
@Service
public interface MemberService {

	List<Member> getMemberList(long offset, long limit, String sort, String order) throws Exception;
	Integer getMemberListTotalCnt() throws Exception;
	
	Member getMemberOfId(String memberId);
	
	boolean checkId(String memberId) throws Exception;
	boolean checkMemberName(String memberName) throws Exception;
	
	boolean insertMember(Member member) throws Exception;
	boolean updateMember(Member member) throws Exception;
	boolean deleteMember(Member member) throws Exception;
	
	List<Member> getSignRoleMemberList() throws Exception;
}
