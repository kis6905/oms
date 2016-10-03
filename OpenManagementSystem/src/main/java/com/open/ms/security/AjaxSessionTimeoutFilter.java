package com.open.ms.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;

/**
 * Ajax 요청 시 Session check
 * 
 * @author iskwon
 */
public class AjaxSessionTimeoutFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(AjaxSessionTimeoutFilter.class);
	
	private String ajaxHaeder = "AJAX";
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        if (isAjaxRequest(req)) {
        	logger.info("-> [This is Ajax]");
            try {
            	HttpSession session = req.getSession(false);
            	if (session == null)
            		throw new AccessDeniedException("Session null");
            	
            	if (session.getAttribute("MEMBER") == null)
            		throw new AccessDeniedException("Session null");
            	
            	chain.doFilter(req, res);
            	logger.info("<- [Status = {}]", HttpServletResponse.SC_OK);
            } catch (AccessDeniedException e) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                logger.info("<- [Status = {}]", HttpServletResponse.SC_FORBIDDEN);
            } catch (AuthenticationException e) {
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                logger.info("<- [Status = {}]", HttpServletResponse.SC_UNAUTHORIZED);
            }
        }
        else {
        	chain.doFilter(req, res);
        }
	}

	@Override
	public void destroy() {
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
		return req.getHeader(ajaxHaeder) != null && req.getHeader(ajaxHaeder).equals(Boolean.TRUE.toString());
	}
	
	public void setAjaxHaeder(String ajaxHeader) {
		this.ajaxHaeder = ajaxHeader;
	}

}
