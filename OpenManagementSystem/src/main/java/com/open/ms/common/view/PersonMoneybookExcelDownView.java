package com.open.ms.common.view;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

import com.open.ms.service.vo.PersonMoneybook;
import com.open.ms.service.vo.PersonMoneybookApproval;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * 지출결의서 엑셀 파일 다운로드 View
 * 
 * @author iskwon
 */
public class PersonMoneybookExcelDownView extends AbstractExcelView {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonMoneybookExcelDownView.class);
	
	@SuppressWarnings({ "unchecked" })
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
		
		// 영수증 이미지 넣기
		HttpSession session = request.getSession(false);
		String realPath = session.getServletContext().getRealPath("");

		File file = null;
		FileInputStream fis = null;
		byte[] receiptBytes = null;
		PersonMoneybook moneybook = null;
		
		List<PersonMoneybook> moneybookList = (List<PersonMoneybook>) beans.get("personMoneybookList");
		
		int receiptIdx = 0;
		Sheet recepitSheet = workbook.getSheetAt(1);
		Drawing recepitDrawing = recepitSheet.createDrawingPatriarch();
		ClientAnchor receiptAnchor = null;
		
		int leftCol = 1;
		int rightCol = 8;
		int topRow = 1;
		int bottomCol = 16;
		
		boolean addRow = false;
		
		for (int inx = 0; inx < moneybookList.size(); inx++) {
			moneybook = moneybookList.get(inx);
			
			if (moneybook.getReceiptPath() == null || moneybook.getReceiptPath().isEmpty())
				continue;
			
			// 이미지 파일을 읽는 도중 에러가 발생하면 무시하고 다음으로 넘긴다.
			try {
				file = new File(realPath + moneybook.getReceiptPath());
				fis = new FileInputStream(file);
				receiptBytes = new byte[(int) file.length()];
				fis.read(receiptBytes);
				fis.close();				
			} catch (Exception e) {
				continue;
			}
			
			if (inx != 0) {
				// Row가 추가될 때
				if (addRow) {
					addRow = false;
					
					leftCol = 1;
					rightCol = 8;
					topRow += 16;
					bottomCol += 16;
				}
				// 같은 Row에 이미지만 추가할 때
				else if (!addRow) {
					addRow = true;
					
					leftCol = 9;
					rightCol = 16;
				}
			}
			
			receiptIdx = workbook.addPicture(receiptBytes, Workbook.PICTURE_TYPE_PNG);
			receiptAnchor = helper.createClientAnchor();
			receiptAnchor.setCol1(leftCol);
			receiptAnchor.setRow1(topRow);
			receiptAnchor.setCol2(rightCol);
			receiptAnchor.setRow2(bottomCol);
			recepitDrawing.createPicture(receiptAnchor, receiptIdx);
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
