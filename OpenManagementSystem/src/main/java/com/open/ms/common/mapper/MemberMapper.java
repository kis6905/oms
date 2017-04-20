package com.open.ms.common.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.common.vo.Member;

/**
 * @author iskwon
 */
public interface MemberMapper {
	
	List<Member> getMemberList(Map<String, Object> map);
	int getMemberListTotalCnt();
	
	Member getMemberOfId(String memberId);
	Member getMemberOfMemberName(String memberName);
	
	int updateWhenLoginSuccess(String memberId);
	int increasePasswordFailCnt(String memberId);
	
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(Member member);
	
	List<Member> getHadApprovalRoleMemberList();
	
	int updateDeviceSeqAndFcmToken(Map<String, Object> map);
	
}
