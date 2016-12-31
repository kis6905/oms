package com.open.ms.common.view;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.open.ms.service.vo.PersonMoneybookApproval;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * 지출결의서 엑셀 파일 다운로드 View
 * 
 * @author iskwon
 */
public class PersonMoneybookExcelDownView extends AbstractExcelView {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonMoneybookExcelDownView.class);
	
	@Override
	protected void buildExcelDocument(
			Map<String, Object> beans,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("-> []");
		
		String templateFileName = (String) beans.get("templateFileName");
		String destFileName = (String) beans.get("destFileName");
		
		XLSTransformer transformer = new XLSTransformer();
		workbook = (HSSFWorkbook) transformer.transformXLS(new FileInputStream(templateFileName), beans);
		
		// 서명 이미지 넣기
		PersonMoneybookApproval approval = (PersonMoneybookApproval) beans.get("approval");
		String sentMemberSign = approval.getSentMemberSign();
		String receivedMemberSign = approval.getReceivedMemberSign();
		
		Sheet sheet = workbook.getSheetAt(0);
		CreationHelper helper = workbook.getCreationHelper();
		Drawing drawing = sheet.createDrawingPatriarch();
		
		// 작성자 서명
		if (sentMemberSign != null) {
			byte[] sentSignBytes = DatatypeConverter.parseBase64Binary(sentMemberSign.replaceAll("data:image/.+;base64,", ""));
			int sentSignIdx = workbook.addPicture(sentSignBytes, Workbook.PICTURE_TYPE_PNG);
			ClientAnchor sentAnchor = helper.createClientAnchor();
			sentAnchor.setCol1(13); // Column N
			sentAnchor.setRow1(6); // Row 7
			sentAnchor.setCol2(16); // Column P
			sentAnchor.setRow2(9); // Row 10
			drawing.createPicture(sentAnchor, sentSignIdx);
		}
		
		// 팀장 서명
		if (receivedMemberSign != null) {
			byte[] receivedSignBytes = DatatypeConverter.parseBase64Binary(receivedMemberSign.replaceAll("data:image/.+;base64,", ""));
			int receivedSignIdx = workbook.addPicture(receivedSignBytes, Workbook.PICTURE_TYPE_PNG);
			ClientAnchor receivedAnchor = helper.createClientAnchor();
			receivedAnchor.setCol1(16); // Column Q
			receivedAnchor.setRow1(6); // Row 7
			receivedAnchor.setCol2(19); // Column S
			receivedAnchor.setRow2(9); // Row 10
			drawing.createPicture(receivedAnchor, receivedSignIdx);
		}
		
		ByteArrayOutputStream xlsOutput = new ByteArrayOutputStream();
        try {
			workbook.write(xlsOutput);
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        byte[] downloadBytes = xlsOutput.toByteArray();

        response.setContentType("application/vnd.ms-excel");
        try {
			response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(destFileName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		try {
			OutputStream downloadOutput = response.getOutputStream();
	        downloadOutput.write(downloadBytes);
	        downloadOutput.flush();
	        downloadOutput.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		logger.info("<- []");
	}
	
}
