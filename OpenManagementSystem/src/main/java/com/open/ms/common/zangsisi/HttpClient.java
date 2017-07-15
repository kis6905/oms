package com.open.ms.common.zangsisi;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;


public class HttpClient {
	
	static final TrustManager tm = new X509TrustManager() { // 접속시 인증 확인해주는 Manager
		public void checkClientTrusted(X509Certificate[] chain, String authType) {
		}

		public void checkServerTrusted(X509Certificate[] chain, String authType) {
		}

		public X509Certificate[] getAcceptedIssuers() {
			return null;
		}
	};
	
	static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() { 
		@Override
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	};
	
	public static HttpURLConnection request(String address) {
		
		SSLContext sslCtx = null;
		try {
			sslCtx = SSLContext.getInstance("TLS");
			sslCtx.init(null, new TrustManager[] { tm }, new java.security.SecureRandom()); // TrustManager를 사용하도록 초기화
			HttpsURLConnection.setDefaultSSLSocketFactory(sslCtx.getSocketFactory());

			URL url = new URL(address);
			HttpURLConnection conn;
			if (url.getProtocol().toLowerCase().equals("https")) {
				HttpsURLConnection https = (HttpsURLConnection)url.openConnection(); 
				https.setHostnameVerifier(DO_NOT_VERIFY);
				conn = https; 
			} else {
				conn = (HttpURLConnection)url.openConnection();
			}

			conn.setRequestMethod("GET");
			conn.setDoOutput(false);
			
			int responseCode = conn.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK)
				return conn;
			else
				System.out.println("Error!! (" + responseCode + ")");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String requestText(String address) throws Exception {
		
		HttpURLConnection conn = request(address);
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String line = "";
		StringBuffer resultBuffer = new StringBuffer();
		while ((line = reader.readLine()) != null)
			resultBuffer.append(line);
		
		reader.close();
		
		return resultBuffer.toString();
	}
	
	public static List<File> downloadImageList(List<String> imageUrlList) throws Exception {
		List<File> imageList = new ArrayList<File>();
		
		for (int inx = 0; inx < imageUrlList.size(); inx++) {
			String url = imageUrlList.get(inx);
			String inxStr = Integer.toString(inx);
			
			if (inxStr.length() == 1)
				inxStr = "00" + inxStr;
			else if (inxStr.length() == 2)
				inxStr = "0" + inxStr;
			
			String fileName = inxStr + url.substring(url.lastIndexOf("."));
			
			HttpURLConnection conn = HttpClient.request(url);
			
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			
			File file = new File(fileName);
			FileOutputStream fw = new FileOutputStream(file);
			
			byte[] buff = new byte[conn.getContentLength()];
			int len = -1;
			while ((len = bis.read(buff)) != -1)
				fw.write(buff, 0, len);
			bis.close();
			fw.close();
			
			imageList.add(file);
		}
		return imageList;
	}
	
}
