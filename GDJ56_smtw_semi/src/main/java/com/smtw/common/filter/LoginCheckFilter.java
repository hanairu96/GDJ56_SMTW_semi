package com.smtw.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.smtw.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(servletNames= {
		"firstDiary", "myCountry"
})
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//요청한 사용자에 대한 정보(로그인여부)를 확인 후 처리
		HttpSession session=((HttpServletRequest)request).getSession(false);
	      Member logInMember=(Member)session.getAttribute("logInMember");
	      if(logInMember!=null) { //로그인을 했다면
	    	  chain.doFilter(request, response); // 화면 보여줌
	      }
	      else {
	    	  request.setAttribute("msg", "로그인 시 이용할 수 있는 서비스 입니다 :(");
	    	  request.setAttribute("loc", "/");
	    	  request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	      }
	}
			
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
