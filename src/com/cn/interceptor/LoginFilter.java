package com.cn.interceptor;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;

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

public class LoginFilter implements Filter {

	private String excludedPage;
	private String []excludedPages;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	/*	System.out.println("进来了！。。。。。。。。。。。。。");*/
		HttpServletRequest request2=(HttpServletRequest)request;
		HttpServletResponse response2=(HttpServletResponse) response;
		HttpSession session=request2.getSession();
		// 定义表示变量 并验证用户请求URL 是否包含不过滤路径
        boolean flag = false;
        
        for (String page:excludedPages) {
            if (request2.getContextPath().equals(page)){
                flag = true;
            }
        }

        // 验证用户登录
        if (flag){
            chain.doFilter(request2,response2);
        }{
            String userName= (String) session.getAttribute("username");
            System.out.println("username——————————》"+userName);
            if (userName != null){
               chain.doFilter(request2,response2);
            }else {
                request.getRequestDispatcher("index.jsp").forward(request2,response2);
            }
        }
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		excludedPage=filterConfig.getInitParameter("excludePages");
		if (excludedPage != null && excludedPage.length() > 0){
            excludedPages = excludedPage.split(",");
        }
		
	}

}
