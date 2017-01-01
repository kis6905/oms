package com.open.ms.service.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(PersonMoneybookServiceImpl.class);
	
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
	public boolean insertPersonMoneybook(PersonMoneybook personMoneybook, String receipt, String realPath) throws Exception {
		if (receipt != null && !receipt.isEmpty())
			saveReceiptImage(realPath + personMoneybook.getReceiptPath(), receipt);
		
		return personMoneybookMapper.insertPersonMoneybook(personMoneybook) > 0;
	}

	/**
	 * 개인 지출 내역 수정
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean updatePersonMoneybook(PersonMoneybook personMoneybook, String receipt, String realPath) throws Exception {
		if (receipt != null && !receipt.isEmpty()) {
			// 수정 시 이전 영수증은 삭제한다.
			PersonMoneybook oldMoneybook = personMoneybookMapper.getPersonMoneybookOfSeq(personMoneybook.getSeq());
			logger.info("~~ [removeReceipt = {}]", removeReceiptImage(realPath + oldMoneybook.getReceiptPath()));
			saveReceiptImage(realPath + personMoneybook.getReceiptPath(), receipt);
		}
		return personMoneybookMapper.updatePersonMoneybook(personMoneybook) > 0;
	}

	/**
	 * 개인 지출 내역 삭제
	 * 
	 * @return 성공 = true, 실패 = false
	 */
	@Override
	public boolean deletePersonMoneybook(PersonMoneybook personMoneybook, String realPath) throws Exception {
		// 삭제 시 영수증도 삭제한다.
		PersonMoneybook oldMoneybook = personMoneybookMapper.getPersonMoneybookOfSeq(personMoneybook.getSeq());
		logger.info("~~ [removeReceipt = {}]", removeReceiptImage(realPath + oldMoneybook.getReceiptPath()));
		return personMoneybookMapper.deletePersonMoneybook(personMoneybook) > 0;
	}
	
	/**
	 * 영수증 이미지 저장
	 * 
	 * @param path
	 * @param receipt
	 * @throws Exception
	 */
	private void saveReceiptImage(String path, String receipt) throws Exception {
		FileOutputStream fos = null;
		try {
			File file = new File(path);
			fos = new FileOutputStream(file);
			byte[] receiptBytes = DatatypeConverter.parseBase64Binary(receipt.replaceAll("data:image/.+;base64,", ""));
			fos.write(receiptBytes);
			fos.flush();
		} catch (Exception e) {
			logger.error("~~ [Error occurred!]", e);
		} finally {
			if (fos != null)
				fos.close();
		}
	}
	
	/**
	 * 영수증 이미지 삭제
	 * 
	 * @param path
	 * @return
	 */
	private boolean removeReceiptImage(String path) {
		return new File(path).delete();
	}
}
