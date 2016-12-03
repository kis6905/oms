package com.open.ms.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.open.ms.common.Utility;
import com.open.ms.common.mapper.MemberMapper;
import com.open.ms.common.mapper.RoleMapper;
import com.open.ms.common.service.MemberService;
import com.open.ms.common.vo.Member;
import com.open.ms.common.vo.Role;

/**
 * @author iskwon
 */
@Service(value = "memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	/**
	 * 회원 목록 리턴
	 */
	@Override
	public List<Member> getMemberList(long offset, long limit, String sort, String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		
		List<Member> memberList = memberMapper.getMemberList(map);
		for (int inx = 0; inx < memberList.size(); inx++) {
			List<Role> roleList = roleMapper.getRoleListOfMemberId(memberList.get(inx));
			memberList.get(inx).setRoleList(roleList);
		}
		
		return memberList;
	}

	/**
	 * 회원 목록 Count 리턴
	 */
	@Override
	public Integer getMemberListTotalCnt() throws Exception {
		return memberMapper.getMemberListTotalCnt();
	}
	
	/**
	 * ID 중복 확인
	 * 
	 * @return true = 사용가능, false = 중복
	 */
	@Override
	public boolean checkId(String memberId) throws Exception {
		return memberMapper.getMemberOfId(memberId) == null;
	}
	
	/**
	 * 이름 중복 확인
	 * 
	 * @return true = 사용가능, false = 중복
	 */
	@Override
	public boolean checkMemberName(String memberName) throws Exception {
		return memberMapper.getMemberOfMemberName(memberName) == null;
	}

	/**
	 * 회원 등록
	 * 
	 * @return true = 성공, false = 실패
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean insertMember(Member member) throws Exception {
		member.setPassword(Utility.getEncryptedPassword(member.getPassword()));
		
		if (memberMapper.insertMember(member) > 0) {
			
			if (member.getRoleList() != null && !member.getRoleList().isEmpty()) {
				List<Map<String, Object>> roleMemberMapList = new ArrayList<>();
				Map<String, Object> roleMemberMap = null;
				
				for (Role role : member.getRoleList()) {
					roleMemberMap = new HashMap<>();
					roleMemberMap.put("roleId", role.getRoleId());
					roleMemberMap.put("memberId", member.getMemberId());
					roleMemberMapList.add(roleMemberMap);
				}
				
				Map<String, List<Map<String, Object>>> map = new HashMap<>();
				map.put("roleMemberMapList", roleMemberMapList);
				
				roleMapper.insertRoleMemberMap(map);
			}
			return true;
		}
		return false;
	}

	/**
	 * 회원 수정
	 * 
	 * @return true = 성공, false = 실패
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean updateMember(Member member) throws Exception  {
		if (member.getPassword() != null)
			member.setPassword(Utility.getEncryptedPassword(member.getPassword()));
		
		if (memberMapper.updateMember(member) > 0) {
			// roleMemberMap 삭제 후 다시 등록
			roleMapper.deleteRoleMemberMapOfMember(member.getMemberId());
			
			if (member.getRoleList() != null && !member.getRoleList().isEmpty()) {
				List<Map<String, Object>> roleMemberMapList = new ArrayList<>();
				
				Map<String, Object> roleMemberMap = null;
				for (Role role : member.getRoleList()) {
					roleMemberMap = new HashMap<>();
					roleMemberMap.put("roleId", role.getRoleId());
					roleMemberMap.put("memberId", member.getMemberId());
					roleMemberMapList.add(roleMemberMap);
				}
				
				Map<String, List<Map<String, Object>>> map = new HashMap<>();
				map.put("roleMemberMapList", roleMemberMapList);
				
				roleMapper.insertRoleMemberMap(map);
			}
			return true;
		}
		return false;
	}

	/**
	 * 회원 삭제
	 * 
	 * @return true = 성공, false = 실패
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean deleteMember(Member member) throws Exception {
		// role_member_map 테이블은 cascade 옵션으로 자동삭제 된다.
		return memberMapper.deleteMember(member) > 0;
	}
	
}
