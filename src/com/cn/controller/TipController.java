package com.cn.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Tip;
import com.cn.service.ClassRoomService;
import com.cn.service.TeacherService;
import com.cn.service.TipService;

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
public class TipController {
	@Autowired
	TipService tipservice;
	@Autowired
	TeacherService teacherService;
	@Autowired
	ClassRoomService classroomService;
	
	
	@RequestMapping("/score/message")
	public String MessageLook( HttpServletRequest request){
		int tid=Integer.parseInt(request.getParameter("tid"));
		//根据tid 进行消息的查找
		List<Tip> listmessage = tipservice.getMessageBytid(tid);
		request.setAttribute("message", listmessage);
		request.setAttribute("tid", tid);
		return "/teacher/message";
	}
	
	@RequestMapping("/message/oksure")
	public ModelAndView MessageSure(HttpServletRequest request){
		int tid=Integer.parseInt(request.getParameter("tid"));
		String tcode=teacherService.getCodeById(tid);
		ModelAndView modelAndView=new ModelAndView("redirect:/teacher/teacherhome?tcode="+tcode);
		int id=Integer.parseInt(request.getParameter("id"));
		tipservice.UpdateStatuesById(id);
		return modelAndView;
	}
	
	
	
}
