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
