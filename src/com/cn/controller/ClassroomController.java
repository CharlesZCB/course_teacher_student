package com.cn.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Classroom;
import com.cn.bean.Courseteacher;
import com.cn.bean.Teacher;
import com.cn.bean.User;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.TeacherService;
import com.cn.service.UserService;
import com.cn.utils.CodeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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
public class ClassroomController {
	@Autowired
	ClassRoomService classRoomService;
	@Autowired
	UserService userService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	CourseteacherService courseTeacherService;
	@Autowired
	CourseService courseService;
	
	
	@RequestMapping("/classroom/classroomlist")
	public String  RoomShow(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model,HttpSession session){
		
		
		//获取各班的班级人数 
		@SuppressWarnings("rawtypes")
		List snums=classRoomService.getCNum();
		//获取所有班号 并按照班号排列
		@SuppressWarnings("rawtypes")
		List banhaos=classRoomService.getAllbanhao();
				//插进班级表中(按照banhao)
				for(int i=0;i<snums.size();i++){
				  classRoomService.insertNumBybanhao( Integer.parseInt(String.valueOf(snums.get(i))),
						  Integer.parseInt(String.valueOf(banhaos.get(i))));	
				  }
				PageHelper.startPage(pn, 6);
		List<Classroom> list=classRoomService.getAll();
		PageInfo<Classroom> pageInfo=new PageInfo<Classroom>(list,6);
		model.addAttribute("pageInfo",pageInfo);
		
		return "/classroom/classroomlist";
	}
	
	@RequestMapping("/classroom/room_del")
	public String  Delete(HttpServletRequest request){
		//ModelAndView modelAndView=new ModelAndView("redirect:classroomlist");
		String idString=request.getParameter("id");
		int id=Integer.parseInt(idString);
		classRoomService.delete(id);
		String message="删除成功!";
		return message;
	}
	
	@RequestMapping("/classroom/addroom")
	public String AddRedirect(HttpServletRequest request){
		List<Teacher> list=teacherService.getList();
		request.setAttribute("list", list);
		return "/classroom/addroom";
	}
	
	@RequestMapping("/classroom/addclass")//开班级
	public ModelAndView AddclassRoom(HttpServletRequest request) throws UnsupportedEncodingException{
		request. setCharacterEncoding("UTF-8");
		ModelAndView modelAndView=new ModelAndView("redirect:classroomlist");
		String jibie=request.getParameter("jibie");
		String tcode=request.getParameter("daoyuan");
		String daoyuan=teacherService.getNameBycodes(tcode);
		String classname=request.getParameter("classname");
		
		//System.out.println(tcode);
		CodeUtil codeUtil=new CodeUtil();
		
		int num=codeUtil.getnerate1();
		
		classRoomService.insertclass(jibie,classname,daoyuan,num,tcode);
		return modelAndView;
	}
	
	@RequestMapping("/classroom/roomedit")
	public String Edit(HttpServletRequest request){
		int pages=Integer.parseInt(request.getParameter("pagenum"));//页码
		String idString=request.getParameter("id");//班级的Id
		int id=Integer.parseInt(idString);//班级的Id
	/*	System.out.println(id);*/
		String te=classRoomService.getJibieById(id);//获取班级级别
		String banjiName=classRoomService.getClassNameById(id);
		//获取班级序列号
		int ccode=classRoomService.getClassCodeById(id);
		/*System.out.println(banjiName);*/
		request.setAttribute("pages", pages);
		request.setAttribute("banming", banjiName);
		request.setAttribute("jibie", te);
		request.setAttribute("banhao", ccode);
	    List<Teacher>teachers=teacherService.getList();
	    request.setAttribute("lists", teachers);
		return "/classroom/roomedit";//添加班级
		
	}
	
	@RequestMapping("/room/editroom")
	public ModelAndView EditRoom(HttpServletRequest request){
		int pn=Integer.parseInt(request.getParameter("pn"));
		String daoyuan=request.getParameter("daoyuan");//获得的是老师的序列号
		String tname=teacherService.getNameBycodes(daoyuan);
		//int tid=teacherService.getIdBycode(daoyuan);
		
		String banhao1=request.getParameter("banhao");//班级序列号
		
		int cnum=Integer.parseInt(banhao1);
		
		classRoomService.UpdateRoomByDaoyuan(daoyuan,cnum,tname);//更新班级导员的联系

		ModelAndView modelAndView=new ModelAndView("redirect:/classroom/classroomlist?pn="+pn);
		return modelAndView;
		
	}
	
	@RequestMapping("/classroom/detailroom")
	public String ShowEachDetail(HttpServletRequest request,HttpSession session){
		String idString=request.getParameter("id");//获取班级的id
		int page=Integer.parseInt(request.getParameter("pagenum"));//页码
		int banhao=Integer.parseInt(request.getParameter("bcode"));
		/* System.out.println("班级的code是："+banhao);*/
		 //依据班号查找课程和任课老师
		List<Courseteacher>listcourseteacher=courseTeacherService.getAllBybanhao(banhao);
		// List<Courseteacher>list=new ArrayList<Courseteacher>();
		 
	     
		int id=Integer.parseInt(idString);//班级id
		
		/**
		 * 
		 */
		int id1=classRoomService.getClassCodeById(id);
		Classroom classroom=classRoomService.getClassDetailById(id);
		List<User> list=userService.getListByid(id1);
		//System.out.println(list);
		request.setAttribute("users", list);
		request.setAttribute("classdetail", classroom);
		request.setAttribute("classid", id);
		session.setAttribute("pagenum", page);
		request.setAttribute("listcourseteacher", listcourseteacher);
		return "/classroom/detailroom";
	}
	
	@ResponseBody
	@RequestMapping("/classroom/searchban")
	public String SearchBan(HttpServletRequest request){
		String message=null;
		int banhao=Integer.parseInt(request.getParameter("banhao"));
		//到数据库中查找班号是banhao的所有的学生
		List<User> listuser =userService.getAllByBanhao(banhao);
		//request.setAttribute("listuser", listuser);
		if(listuser.isEmpty()){
			message="no";
			return message;
		}
		else {
			message="yes";
			return message;
		}
		
	}
	
	
	@RequestMapping("/classroom/searchban1")
	public String SearchBan1(HttpServletRequest request){
		int banhao=Integer.parseInt(request.getParameter("banhao"));
		System.out.println(banhao);
		//到数据库中查找班号是banhao的所有的学生
		List<User> listuser =userService.getAllByBanhao(banhao);
		request.setAttribute("listuser", listuser);
		List<Classroom> list=classRoomService.getAll();
		request.setAttribute("listroom", list);
		/*for(int i=0;i<listuser.size();i++){
			System.out.println(listuser.get(i).getBanming());
		}*/
		return "/student/search";
		
	}
	@ResponseBody
	@RequestMapping("/classroom/searchroom")
	public String searchroom(HttpServletRequest request){
		System.out.println(request.getParameter("xulie"));
		int banhao=Integer.parseInt(request.getParameter("xulie"));
		
		Classroom classroom=classRoomService.getClassBybcode(banhao);
		String message=null;
		if (classroom==null) {
			message="a";
		}
		else{
			message="b";
		}
		return message;
	}
	
	//@ResponseBody
	@RequestMapping("/classroom/getRoomBycode")
	public String GetRoom(HttpServletRequest request){
		int bcode=Integer.parseInt(request.getParameter("bcode"));
		int page=Integer.parseInt(request.getParameter("pagenum"));
		
		Classroom classroom=classRoomService.getClassBybcode(bcode);
		request.setAttribute("room", classroom);
		
		request.setAttribute("pagenum", page);
		return"/classroom/searchroom";
	}
}

