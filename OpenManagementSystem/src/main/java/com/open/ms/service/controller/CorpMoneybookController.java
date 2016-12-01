package com.open.ms.service.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.Constants;
import com.open.ms.common.Utility;
import com.open.ms.common.vo.Member;
import com.open.ms.service.service.CorpMoneybookService;
import com.open.ms.service.vo.CorpMoneybook;

@Controller
@RequestMapping(value = "/service/corp/moneybook/**")
public class CorpMoneybookController {

	private static final Logger logger = LoggerFactory.getLogger(CorpMoneybookController.class);
	
	@Autowired
	private CorpMoneybookService moneybookServiceImpl;
	
	/**
	 * 리스트 조회
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public String postList(
			@RequestBody String body,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		
		String memberId = null;
//		if (member == null) {
//			logger.info("-> Session is null!");
//			jsonResult.put("result", Constants.NOT_OK);
//		}
//		else {
			memberId = member.getMemberId();
			
			logger.info("-> [body = {}]", body);
			logger.info("-> [memberId = {}]", memberId);
			
			JSONParser jsonParser = new JSONParser();
			
			try {
				JSONObject requestJson = (JSONObject) jsonParser.parse(body);
				
				String startDate = (String) requestJson.get("startDate");
				String endDate = (String) requestJson.get("endDate");
				long offset = (long) requestJson.get("offset");
				long limit = (long) requestJson.get("limit");
				String sort = (String) requestJson.get("sort");
				String order = (String) requestJson.get("order");
				
				JSONArray rows = new JSONArray();
				
				List<CorpMoneybook> moneybookList = moneybookServiceImpl.getCorpMoneybookList(memberId, startDate, endDate, offset, limit, sort, order);
				for (CorpMoneybook vo : moneybookList)
					rows.add(vo.toJSONObject());
				
				Map<String, Object> totalMap = moneybookServiceImpl.getCorpMoneybookListTotalCntAndPrice(memberId, startDate, endDate);
				
				jsonResult.put("rows", rows);
				jsonResult.put("total", totalMap.get("totalCnt"));
				jsonResult.put("totalPrice", totalMap.get("totalPrice"));
				
				logger.info("~~ [totalCnt = {}], [totalPrice = {}], [rows = {}]", new Object[] { totalMap.get("totalCnt"), totalMap.get("totalPrice"), rows.size() });
			} catch (Exception e) {
				logger.error("~~ [An error occurred]", e);
			}
//		}
		
		logger.info("<- []");
		return jsonResult.toString();
	}
	
	/**
	 * 등록
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String postInsert(
			@RequestParam(value = "usedDate", required = true, defaultValue = "") String usedDate,
			@RequestParam(value = "category", required = true, defaultValue = "") String category,
			@RequestParam(value = "customer", required = true, defaultValue = "") String customer,
			@RequestParam(value = "usedPlace", required = true, defaultValue = "") String usedPlace,
			@RequestParam(value = "price", required = true, defaultValue = "") String price,
			@RequestParam(value = "note", required = true, defaultValue = "") String note,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = null;
		if (member == null) {
			logger.info("-> Session is null!");
			jsonResult.put("result", Constants.NOT_OK);
		}
		else {
			memberId = member.getMemberId();
			
			logger.info("-> [usedDate = {}], [category = {}], [customer = {}], [usedPlace = {}], [price = {}], [note = {}]", new Object[] { usedDate, category, customer, usedPlace, price, note });
			logger.info("-> [memberId = {}]", memberId);
			
			try {
				if (usedDate.isEmpty() || usedPlace.isEmpty() || category.isEmpty() || customer.isEmpty() ||
						price.isEmpty() || note.isEmpty() || memberId.isEmpty()) {
					jsonResult.put("result", Constants.NOT_OK);
				}
				else {
					CorpMoneybook moneybook = new CorpMoneybook();
					moneybook.setUsedDate(usedDate);
					moneybook.setCategory(category);
					moneybook.setCustomer(customer);
					moneybook.setUsedPlace(usedPlace);
					moneybook.setPrice(Integer.parseInt(price));
					moneybook.setNote(note);
					moneybook.setMemberId(member.getMemberId());
					
					boolean result = moneybookServiceImpl.insertCorpMoneybook(moneybook);
					jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
				}
			} catch (Exception e) {
				logger.error("~~ [An error occurred]", e);
				jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
			}
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 수정
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String postUpdate(
			@RequestParam(value = "seq", required = true, defaultValue = "") String seq,
			@RequestParam(value = "usedDate", required = true, defaultValue = "") String usedDate,
			@RequestParam(value = "category", required = true, defaultValue = "") String category,
			@RequestParam(value = "customer", required = true, defaultValue = "") String customer,
			@RequestParam(value = "usedPlace", required = true, defaultValue = "") String usedPlace,
			@RequestParam(value = "price", required = true, defaultValue = "") String price,
			@RequestParam(value = "note", required = true, defaultValue = "") String note,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = null;
		if (member == null) {
			logger.info("-> Session is null!");
			jsonResult.put("result", Constants.NOT_OK);
		}
		else {
			memberId = member.getMemberId();
			
			logger.info("-> [seq = {}], [usedDate = {}], [category = {}], [customer = {}], [usedPlace = {}], [price = {}], [note = {}]", new Object[] { seq, usedDate, category, customer, usedPlace, price, note });
			logger.info("-> [memberId = {}]", memberId);
			
			try {
				if (seq.isEmpty() || usedDate.isEmpty() || usedPlace.isEmpty() || price.isEmpty() || note.isEmpty() || memberId.isEmpty()) {
					jsonResult.put("result", Constants.NOT_OK);
				}
				else {
					CorpMoneybook moneybook = new CorpMoneybook();
					moneybook.setSeq(Integer.parseInt(seq));
					moneybook.setUsedDate(usedDate);
					moneybook.setCategory(category);
					moneybook.setCustomer(customer);
					moneybook.setUsedPlace(usedPlace);
					moneybook.setPrice(Integer.parseInt(price));
					moneybook.setNote(note);
					moneybook.setMemberId(member.getMemberId());
					
					boolean result = moneybookServiceImpl.updateCorpMoneybook(moneybook);
					jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
				}
			} catch (Exception e) {
				logger.error("~~ [An error occurred]", e);
				jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
			}
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 삭제
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String postDelete(
			@RequestParam(value = "seq", required = true, defaultValue = "") String seq,
			HttpServletRequest request) {
		
		JSONObject jsonResult = new JSONObject();
		
		Member member = (Member) request.getSession(false).getAttribute("MEMBER");
		String memberId = null;
		if (member == null) {
			logger.info("-> Session is null!");
			jsonResult.put("result", Constants.NOT_OK);
		}
		else {
			memberId = member.getMemberId();
			
			logger.info("-> [seq = {}]", seq);
			logger.info("-> [memberId = {}]", memberId);
			
			try {
				if (seq.isEmpty() || memberId.isEmpty()) {
					jsonResult.put("result", Constants.NOT_OK);
				}
				else {
					CorpMoneybook moneybook = new CorpMoneybook();
					moneybook.setSeq(Integer.parseInt(seq));
					moneybook.setMemberId(member.getMemberId());
					
					boolean result = moneybookServiceImpl.deleteCorpMoneybook(moneybook);
					jsonResult.put("result", result ? Constants.OK : Constants.NOT_OK);
				}
			} catch (Exception e) {
				logger.error("~~ [An error occurred]", e);
				jsonResult.put("result", Constants.COMMON_SERVER_ERROR);
			}
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	/**
	 * 사용 내역을 Excel 파일로 저장
	 */
	@RequestMapping(value = "/excel", method = RequestMethod.POST)
	public String postExcel(
			@RequestParam(value = "startDate", required = true, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = true, defaultValue = "") String endDate,
			@RequestParam(value = "sort", required = true, defaultValue = "") String sort,
			@RequestParam(value = "order", required = true, defaultValue = "") String order,
			@RequestParam(value = "sign", required = true, defaultValue = "") String sign,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap modelMap) throws IOException {
		
		int responseStatusCode = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			logger.info("-> Session is null!");
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			responseStatusCode = HttpServletResponse.SC_UNAUTHORIZED;
		}
		else {
			Member member = (Member) session.getAttribute("MEMBER");
			String memberId = null;
			
			if (member == null) {
				logger.info("-> Session is null!");
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				responseStatusCode = HttpServletResponse.SC_UNAUTHORIZED;
			}
			else {
				memberId = member.getMemberId();
				
				logger.info("-> [startDate = {}], [endDate = {}], [sort = {}], [order = {}], [sign = {}]",  new Object[] { startDate, endDate, sort, order, sign });
				logger.info("-> [memberId = {}]", memberId);
				
				if (startDate.isEmpty() || endDate.isEmpty() || sort.isEmpty() || order.isEmpty() || memberId.isEmpty() || sign.isEmpty()) {
					response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
					responseStatusCode = HttpServletResponse.SC_BAD_REQUEST;
				}
				else {
					try {
						// 화면에서 그린 이미지는 base64 인코딩한 string으로 넘어온다.
						byte[] signBytes = DatatypeConverter.parseBase64Binary(sign.replaceAll("data:image/.+;base64,", ""));
						modelMap.addAttribute("sign", signBytes);
						
						List<CorpMoneybook> moneybookList = moneybookServiceImpl.getCorpMoneybookList(memberId, startDate, endDate, 0, Integer.MAX_VALUE, sort, order);
						Map<String, Object> totalMap = moneybookServiceImpl.getCorpMoneybookListTotalCntAndPrice(memberId, startDate, endDate);
						
						int totalCnt = (int) totalMap.get("totalCnt");
						
						modelMap.addAttribute("moneybookList", moneybookList);
						modelMap.addAttribute("totalCnt", totalCnt);
						modelMap.addAttribute("totalPrice", totalMap.get("totalPrice"));
						
						// Excel 내에서 moneybookList size가 25 미만인 경우 빈 라인을 더해 25줄을 맞추려 했으나 실패...
						// moneybookList size 가 25 미만인 경우 25 - moneybookList.size() 만큼의 emptyLineList를 내려주자
						List<Object> emptyLineList = new ArrayList<Object>();
						for (int inx = 0; inx < 25 - totalCnt; inx++)
							emptyLineList.add(inx);
						modelMap.addAttribute("emptyLineList", emptyLineList);
						
						ServletContext context = session.getServletContext();
					    modelMap.addAttribute("templateFileName", context.getRealPath("/") + "resources/excel/" + "corpCardStatement.xls");
					    modelMap.addAttribute("destFileName", "법인카드_사용_내역서_" + member.getNickname() + "_" + Utility.getCurrentDateToString("yyMMddHHmm") + ".xls");
					    modelMap.addAttribute("nickname", member.getNickname());
					    
					    logger.info("<- []");
					    return "excelDown";
					} catch (Exception e) {
						logger.error("~~ [An error occurred]", e);
						responseStatusCode = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
					}
				}
			}
		}

		modelMap.put("errorCode", responseStatusCode);
		logger.info("<- [responseStatusCode = {}]", responseStatusCode);
		return "error/error";
	}
	
}
