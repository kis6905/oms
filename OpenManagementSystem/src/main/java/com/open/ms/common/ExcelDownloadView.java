package com.open.ms.common;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * 엑셀 파일 다운로드 시 템플릿 파일에 값을 파싱해 완료된 파일을 내려준다.
 */
public class ExcelDownloadView extends AbstractExcelView {
	
	private static final Logger logger = LoggerFactory.getLogger(ExcelDownloadView.class);
	
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
		
		// 작성자 서명 이미지 넣기
		Sheet sheet = workbook.getSheetAt(0);
		byte[] signBytes = (byte[]) beans.get("sign");
		
		int pictureIdx = workbook.addPicture(signBytes, Workbook.PICTURE_TYPE_PNG);
		workbook.addPicture(signBytes, Workbook.PICTURE_TYPE_PNG);
		
		CreationHelper helper = workbook.getCreationHelper();
		
		// Creates the top-level drawing patriarch.
		Drawing drawing = sheet.createDrawingPatriarch();
		
		// Create an anchor that is attached to the worksheet
		ClientAnchor anchor = helper.createClientAnchor();
		
		// Create an anchor with upper left cell _and_ bottom right cell
		anchor.setCol1(15); // Column P
		anchor.setRow1(4); // Row 5
		anchor.setCol2(18); // Column R
		anchor.setRow2(7); // Row 8
		
//		Picture pict = drawing.createPicture(anchor, pictureIdx);
		drawing.createPicture(anchor, pictureIdx);
		
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
