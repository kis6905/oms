package com.open.ms.service.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.ms.common.vo.Content;
import com.open.ms.common.zangsisi.HttpClient;
import com.open.ms.common.zangsisi.ZangsisiParser;

@Controller
@RequestMapping(value = "/zangsisi/**")
public class ZangsisiController {
	
	private static final Logger logger = LoggerFactory.getLogger(ZangsisiController.class);
	
	public static final String ZANGSISI_MAIN_URL = "http://zangsisi.net";
	public static final String PARAM_NAME_ID = "?page_id=";
	public static final String PARAM_NAME_P = "?p=";
	
	/**
	 * 페이지 리턴
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getPage() {
		
		logger.info("-> []");
		
		logger.info("<- []");
		return "main/zangsisi";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cartoon/list", method = RequestMethod.POST)
	@ResponseBody
	public String cartoonList() {
		
		logger.info("-> []");
		
		JSONObject jsonResult = new JSONObject();
		
		try {
			String contentListData = HttpClient.requestText(ZANGSISI_MAIN_URL);
			List<Content> serialingList = ZangsisiParser.getSerialingContentList(contentListData);
			List<Content> completeList = ZangsisiParser.getCompleteContentList(contentListData);
			
			JSONArray serialingJsonArray = new JSONArray();
			JSONArray completeJsonArray = new JSONArray();
			
			for (Content content : serialingList)
				serialingJsonArray.add(content.toJSONObject());
			
			for (Content content : completeList)
				completeJsonArray.add(content.toJSONObject());
			
			jsonResult.put("resultCode", 0000);
			jsonResult.put("serialingList", serialingJsonArray);
			jsonResult.put("completeList", completeJsonArray);
			
		} catch(Exception e) {
			logger.error("Error Occurred!", e);
			jsonResult.put("resultCode", 9999);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sub/list", method = RequestMethod.POST)
	@ResponseBody
	public String subList(
			@RequestParam(value = "pageId", defaultValue = "") String pageId,
			@RequestParam(value = "complete", defaultValue = "") String complete) {
		
		logger.info("-> [pageId = {}], [complete = {}]", pageId, complete);
		
		JSONObject jsonResult = new JSONObject();
		
		if (pageId.isEmpty() || complete.isEmpty())
			jsonResult.put("resultCode", 9001);
		
		try {
			String contentParam = Boolean.parseBoolean(complete) ? PARAM_NAME_P + pageId : PARAM_NAME_ID + pageId;
			String contentData = HttpClient.requestText(ZANGSISI_MAIN_URL + contentParam);
			
			List<Content> subList = ZangsisiParser.getSubContentList(contentData);
			JSONArray subJsonArray = new JSONArray();
			
			for (Content content : subList)
				subJsonArray.add(content.toJSONObject());
			
			jsonResult.put("resultCode", 0000);
			jsonResult.put("subList", subJsonArray);
			
		} catch(Exception e) {
			logger.error("Error Occurred!", e);
			jsonResult.put("resultCode", 9999);
		}
		
		logger.info("<- [jsonResult = {}]", jsonResult.toString());
		return jsonResult.toString();
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public void download(
			HttpServletResponse response,
			@RequestParam(value = "pageId", defaultValue = "") String pageId,
			@RequestParam(value = "title", defaultValue = "") String title) {
		
		logger.info("-> [pageId = {}], [title = {}]", pageId, title);
		
		try {
			String imageContentData = HttpClient.requestText(ZANGSISI_MAIN_URL + PARAM_NAME_P + pageId);
			List<String> imageUrlList = ZangsisiParser.getImageUrlList(imageContentData);
			
			List<File> imageList = HttpClient.downloadImageList(imageUrlList);
			
			File zipFile = zip(imageList, title + ".zip");
			
			String fileName = java.net.URLEncoder.encode(zipFile.getName(), "UTF-8");
			
			response.setContentLength((int) zipFile.length());
			response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			
			try {
				fis = new FileInputStream(zipFile);
				FileCopyUtils.copy(fis, out);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (fis != null) {
					try {
						fis.close();
					} catch (Exception e2) { }
				}
			}
			out.flush();
			
		} catch (Exception e) {
			logger.error("Error Occurred!", e);
		}
		
		logger.info("<- []");
	}
	
	private File zip(List<File> files, String filename) {
		File zipfile = new File(filename);
		byte[] buf = new byte[1024];
		try {
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipfile));
			
			for (int i = 0; i < files.size(); i++) {
				FileInputStream in = new FileInputStream(files.get(i).getCanonicalPath());
				out.putNextEntry(new ZipEntry(files.get(i).getName()));
				
				int len;
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
				out.closeEntry();
				in.close();
			}
			out.close();
			return zipfile;
		} catch (IOException e) {
			logger.error("Error Occurred!", e);
		}
		return null;
	}
	
}
