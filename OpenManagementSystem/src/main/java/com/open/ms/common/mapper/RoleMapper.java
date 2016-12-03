package com.open.ms.common.mapper;

import java.util.List;
import java.util.Map;

import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.Role;

/**
 * @author iskwon
 */
public interface RoleMapper {
	
	List<Role> getRoleList();
	List<Role> getRoleListOfMemberId(Member member);
	
	int insertRoleMemberMap(Map<String, List<Map<String, Object>>> map);
	int deleteRoleMemberMapOfMember(String memberId);
	
}
