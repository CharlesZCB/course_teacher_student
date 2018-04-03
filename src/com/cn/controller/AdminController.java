package com.cn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.service.AdminService;
import com.cn.service.TeacherService;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	TeacherService teacherService;

	@ResponseBody
	@RequestMapping(value= "/login/admin",produces="text/html;charset=utf-8")
	public String LoginAdmin(HttpServletRequest request,HttpSession session){
		String name=request.getParameter("admin");
		String pass=request.getParameter("pass");
		Integer id=adminService.Check(name,pass);
		String head=adminService.getHeadByid(id);
		String message=null;
		if(id==null){
			message="账号或者密码出错！请重新确认";
			return message;
		}
		else{
			message="登陆成功！";
			session.setAttribute("headimg", head);
			session.setAttribute("username", name);
			return message;
		}
	}
	

}
