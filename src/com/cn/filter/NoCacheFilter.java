package com.cn.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class NoCacheFilter implements Filter {

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request2=(HttpServletRequest)request;
		HttpServletResponse response2=(HttpServletResponse)response;
		response2.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP消息头，控制网页的缓存
		response2.setHeader("Pragma", "no-cache");//禁止浏览器从缓存中调阅页面内容
		response2.setDateHeader("Expires", -1);  //指定网页在缓存中的过期时间
		filterChain.doFilter(request2, response2);//doFilter就是告诉浏览器不要使用本地缓存
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

}
