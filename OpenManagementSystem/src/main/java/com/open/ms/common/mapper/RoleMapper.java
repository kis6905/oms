package com.open.ms.common.mapper;

import java.util.List;

import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.Role;

public interface RoleMapper {
	
	public List<Role> getRoleListOfMemberId(Member member);
	
}
