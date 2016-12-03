package com.open.ms.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.common.Utility;
import com.open.ms.common.mapper.MemberMapper;
import com.open.ms.common.vo.Member;
import com.open.ms.mypage.service.MyInfoService;

@Service(value = "myInfoServiceImpl")
public class MyInfoServiceImpl implements MyInfoService {

	@Autowired
	private MemberMapper memberMapper;
	
	/**
	 * 내 정보 수정
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updateMyInfo(Member member) throws Exception {
		if (member.getPassword() != null)
			member.setPassword(Utility.getEncryptedPassword(member.getPassword()));
		
		return memberMapper.updateMember(member) > 0 ? true : false;
	}

}
