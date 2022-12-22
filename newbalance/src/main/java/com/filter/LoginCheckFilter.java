package com.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/days10/board/*" })
public class LoginCheckFilter implements Filter {


    public LoginCheckFilter() {
       
    }

	public void destroy() {

	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter() 호출됨.");
		
		HttpServletRequest jrequest = (HttpServletRequest) request;
		HttpServletResponse jresponse= (HttpServletResponse) response;
		
		String logonID = null; //세션 저장된 로그인한 ID를 저장할 변수.
		boolean isLogon = false; //인증 받았는지 여부 저정할 변수
		
		HttpSession session = jrequest.getSession(false);
		if(session != null) {
			logonID = (String) session.getAttribute("member");
			if(logonID != null) isLogon = true;
		}
		
		if(isLogon) { //인증O
			chain.doFilter(request,  response);
		}else { //인증X
			
			//세션에 원래 요청 URL 저장
			String referer = jrequest.getRequestURI();
			session.setAttribute("referer", referer);
			
			//로그인 페이지로 이동.
			String location = "/newbalance/customer/loginForm.jsp";
			jresponse.sendRedirect(location);
		}
		
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
