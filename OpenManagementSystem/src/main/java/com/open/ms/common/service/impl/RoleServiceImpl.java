package com.open.ms.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.common.mapper.RoleMapper;
import com.open.ms.common.service.RoleService;
import com.open.ms.common.vo.Role;

/**
 * @author iskwon
 */
@Service(value = "roleServiceImpl")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	/**
	 * Role 리스트 리턴
	 */
	@Override
	public List<Role> getRoleList() {
		return roleMapper.getRoleList();
	}
	
}
