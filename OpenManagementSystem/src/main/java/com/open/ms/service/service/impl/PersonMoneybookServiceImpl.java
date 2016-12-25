package com.open.ms.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.ms.service.mapper.PersonMoneybookMapper;
import com.open.ms.service.service.PersonMoneybookService;
import com.open.ms.service.vo.PersonMoneybook;

/**
 * @author iskwon
 */
@Service(value = "personMoneybookServiceImpl")
public class PersonMoneybookServiceImpl implements PersonMoneybookService {

	@Autowired
	private PersonMoneybookMapper personMoneybookMapper;
	
	/**
	 * 개인 지출 내역 목록 리턴
	 */
	@Override
	public List<PersonMoneybook> getPersonMoneybookList(
			String memberId, String startDate, String endDate,
			long offset, long limit, String sort, String order)  throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("start", offset + 1);
		map.put("end", offset + limit);
		map.put("sort", sort);
		map.put("order", order);
		return personMoneybookMapper.getPersonMoneybookList(map);
	}
	
	/**
	 * 개인 지출 내역 목록 Count 리턴
	 */
	@Override
	public Map<String, Object> getPersonMoneybookListTotalCntAndPrice(String memberId, String startDate, String endDate) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return personMoneybookMapper.getPersonMoneybookListTotalCntAndPrice(map);
	}
	
	/**
	 * 개인 지출 내역 등록
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean insertPersonMoneybook(PersonMoneybook personMoneybook) throws Exception {
		return personMoneybookMapper.insertPersonMoneybook(personMoneybook) > 0;
	}

	/**
	 * 개인 지출 내역 수정
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updatePersonMoneybook(PersonMoneybook personMoneybook) throws Exception {
		return personMoneybookMapper.updatePersonMoneybook(personMoneybook) > 0;
	}

	/**
	 * 개인 지출 내역 삭제
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean deletePersonMoneybook(PersonMoneybook personMoneybook) throws Exception {
		return personMoneybookMapper.deletePersonMoneybook(personMoneybook) > 0;
	}
	
}
