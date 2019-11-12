package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class loginFilter
 */
@WebFilter("/view/*")

public class loginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public loginFilter() {
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
//		System.out.println(((HttpServletRequest)request).getSession().getAttribute("user_id"));
//		if (((HttpServletRequest)request).getRequestURI().equals("/WebCSDL/view/") 
//				|| ((HttpServletRequest)request).getRequestURI().equals("/WebCSDL/view/index-register.jsp")
//				|| ((HttpServletRequest)request).getRequestURI().equals("/WebCSDL/view/AjaxEmail")
//				|| ((HttpServletRequest)request).getRequestURI().equals("/WebCSDL/view/register")
//				|| ((HttpServletRequest)request).getRequestURI().equals("/WebCSDL/view/login")
//		   ){
//			System.out.println( 1 + ((HttpServletRequest)request).getContextPath());
//			chain.doFilter(request, response);
//		}
//		else if ( ((HttpServletRequest)request).getSession().getAttribute("user_id") != null) {
//			System.out.println( 2 + ((HttpServletRequest)request).getContextPath());
//			chain.doFilter(request, response);
//		}else {
//			System.out.println( 3 + ((HttpServletRequest)request).getContextPath());
//			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath() + "/view/");
//		}
		
		// Set all request data pass through any servlet keep origin data( UTF-8 Format )
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
