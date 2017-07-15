package com.open.ms.common.zangsisi;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.open.ms.common.vo.Content;


public class ZangsisiParser {
	
	/**
	 * 완결 목록
	 */
	public static List<Content> getCompleteContentList(String data) {
		data = data.split("<h2>완결만화 목록</h2>")[1].split("<p>&nbsp;</p>")[1];
		
		String[] contents = data.split("<p><span style\\=\"font-size: 18pt\\;\"><a class\\=\"tx-link\" style\\=\"line-height\\: 1.5\\;\" href\\=\"http\\:\\/\\/zangsisi.net\\/\\?p\\=");
		String[] contents2 = new String[contents.length - 1];
		
		for (int index = 0; index < contents2.length; index++)
			contents2[index] = contents[index + 1];
		
		return Stream.of(contents2)
				 .map((s) -> {
					 if (s.isEmpty())
						 return null;
					 return new Content(getCompleteTitle(s), getPageId(s), true);
				 })
				 .collect(Collectors.toList());
	}
	
	/**
	 * 연재 목록
	 */
	public static List<Content> getSerialingContentList(String data) {
		data = data.split("id=\"manga-list\">")[1].split("</div>")[0];
		
		String[] contents = data.split("<a href\\=\"http\\:\\/\\/zangsisi.net\\/\\?page_id\\=");
		String[] contents2 = new String[contents.length - 1];
		
		for (int index = 0; index < contents2.length; index++)
			contents2[index] = contents[index + 1];
		
		return Stream.of(contents2)
				 .map((s) -> {
					 if (s.isEmpty())
						 return null;
					 return new Content(getSerialingTitle(s), getPageId(s), false);
				 })
				 .collect(Collectors.toList());
		
	}
	
	/**
	 * 상세 목록(권, 화)
	 */
	public static List<Content> getSubContentList(String data) {
		data = data.split("<div id=\"post\">")[1].split("<div class=\"contents\">")[1].split("</div>")[0];
		
		String[] contents = data.split("href\\=\"http\\:\\/\\/zangsisi.net\\/\\?p\\=");
		String[] contents2 = new String[contents.length - 1];
		
		for (int index = 0; index < contents2.length; index++)
			contents2[index] = contents[index + 1];
		
		return Stream.of(contents2)
				 .map((s) -> {
					 if (s.isEmpty())
						 return null;
					 return new Content(getSubTitle(s), getPageId(s), true);
				 })
				 .collect(Collectors.toList());
	}
	
	/**
	 * 이미지 URL 목록
	 */
	public static List<String> getImageUrlList(String data) {
		data = data.split("<div id=\"post\">")[1].split("<div class=\"contents\">")[1].split("</div></div>")[0];
		
		String[] contents = data.split("src=\"");
		List<String> imageUrlList = new ArrayList<String>();
		
		for (int index = 1; index < contents.length; index++)
			imageUrlList.add(getImageUrl(contents[index]));
		
		return imageUrlList;
	}
	
	public static String getImageUrl(String data) {
		return data.substring(0, data.indexOf("\""));
	}
	
	public static String getSubTitle(String data) {
		data = data.split(">")[1];
		return data.substring(0, data.indexOf("<"));
	}
	
	public static String getSerialingTitle(String data) {
		data = data.split("data-title=\"")[1];
		return data.substring(0, data.indexOf("\""));
	}
	
	public static String getCompleteTitle(String data) {
		data = data.split("target=\"_blank\">")[1];
		return data.substring(0, data.indexOf("</a>"));
	}
	
	public static String getPageId(String data) {
		return data.substring(0, data.indexOf("\""));
	}
	
	public static Content findContent(List<Content> list1, List<Content> list2, String id) {
		Content content = findContent(list1, id);
		return content == null ? findContent(list2, id) : content;
	}
	
	public static Content findContent(List<Content> list, String id) {
		return list.stream()
				.filter((e) -> e.getPageId().equals(id))
				.findFirst()
				.orElse(null);
	}
}
