package com.open.ms.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.open.ms.common.Codes;
import com.open.ms.common.Utility;
import com.open.ms.common.mapper.MemberMapper;
import com.open.ms.common.service.MemberService;
import com.open.ms.common.vo.Member;

@Service(value = "memberServiceImpl")
@Transactional(rollbackFor = { Exception.class })
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	/**
	 * ID 중복 확인
	 * 
	 * @param memberId
	 * @return true = 사용가능, false = 중복
	 */
	@Override
	public boolean checkId(String memberId) {
		return memberMapper.getMemberOfId(memberId) == null;
	}
	
	/**
	 * 닉네임 중복 확인
	 * 
	 * @param nickname
	 * @return true = 사용가능, false = 중복
	 */
	@Override
	public boolean checkNickname(String nickname) {
		return memberMapper.getMemberOfNickname(nickname) == null;
	}

	/**
	 * 회원 가입
	 * 
	 * @param member 입력받은 회원 정보
	 * @return true = 성공, false = 실패
	 * @throws Exception 
	 */
	@Override
	public boolean joinMember(Member member) throws Exception {
		member.setPassword(Utility.getEncryptedPassword(member.getPassword()));
		member.setGradeCodeGroup(Codes.GRADE_CODE_GROUP);
		member.setGradeCode(Codes.USER_CODE);
		return memberMapper.insertMember(member) > 0;
	}
	
	/**
	 * 자신을 제외한 멤버 리스트 리턴
	 * 
	 * @param search
	 * @return
	 */
	@Override
	public List<Member> getSearchMemberList(String search, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("memberId", memberId);
		return memberMapper.getSearchMemberList(map);
	}
	
}
