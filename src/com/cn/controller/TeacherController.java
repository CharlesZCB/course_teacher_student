package com.cn.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Course;
import com.cn.bean.Teacher;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.TeacherService;
import com.cn.utils.CodeTeacherUtil;
import com.cn.utils.EmailUtil;
import com.cn.utils.EmailUtilTeacher;
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
@RequestMapping("/teaches")
public class TeacherController {

	 private static String UPLOAD_DIRECTORY ="/images/";
	 @Autowired
	 TeacherService teacherService;
	 @Autowired
	 CourseteacherService courseteacherService;
	 @Autowired
	 ClassRoomService classroomService;
	 @Autowired
	 CourseService courseService;
	 
	 @RequestMapping("/allteacher")
	 public String getAllTeacher(@RequestParam
				(value="pn",defaultValue="1")Integer pn,Model model,HttpServletRequest request) throws UnsupportedEncodingException{
		 request.setCharacterEncoding("UTF-8");
		 PageHelper.startPage(pn, 7);
		 List<Teacher> list=teacherService.getList();
		 //System.out.println(list.get(0).getTname());
//		 System.out.println("教师是："+list);
		 PageInfo<Teacher> pageInfo=new PageInfo<Teacher>(list,6);
		 model.addAttribute("pageInfo",pageInfo);
		
		
		 return "/teacher/teacher_list";
	 }
	 
	 @RequestMapping(value="/teacher_add",method=RequestMethod.POST)
     public ModelAndView   Addone(@RequestParam CommonsMultipartFile file,HttpServletRequest request,HttpSession session) 
   				  throws ParseException, IOException{
		 //CodeUtil codeUtil=new CodeUtil();
		 CodeTeacherUtil codeUtil=new CodeTeacherUtil();
		 String tcode=codeUtil.generate();
	 
   	  ModelAndView mv=new ModelAndView("redirect:allteacher");
   	  String ident=request.getParameter("ident");
   	  String s_city=request.getParameter("s_city");
   	  String s_province=request.getParameter("s_province");
   	  String s_county =request.getParameter("s_county");
   	  String birth=request.getParameter("birth");
   	  String tname=request.getParameter("name");
   	  String email=request.getParameter("email");
   	  String password=request.getParameter("password");
   	  String workcall1=request.getParameter("workcall");
   	  String telphone=request.getParameter("telephone");
   	  String tsex=request.getParameter("sex");
      ServletContext context = session.getServletContext(); 
 	  String path = context.getRealPath(UPLOAD_DIRECTORY);  
 	  String headname = file.getOriginalFilename();
   	 // System.out.println(headname);//文件名字
   	    //System.out.println(path+" "+filename);
   	    String headads=path+'\\'+headname;
   	  
   	    SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
 		    java.util.Date births=dd.parse(birth);
     	    teacherService.insertone(tname, email,births,headads,headname,workcall1,s_county,
     	    		s_province,s_city,password,telphone,tcode,tsex,ident);
   	   
   	    byte[] bytes = file.getBytes();  
   	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
   	         new File(path + File.separator + headname)));
   	    stream.write(bytes);  
   	    stream.flush();  
   	    stream.close();  
   	    return mv; 
     }
	 
	    @ResponseBody
		@RequestMapping(value="/tea_del",produces="text/html;charset=utf-8")//调用这个方法
		public String Delete(HttpServletRequest request){
	        int id=Integer.parseInt(request.getParameter("id"));
	    	//删除teachercourse 与改名老师有关的课程
	        //1.看是否有这个老师和课程有关的数据
	       // System.out.println("教师id="+id);
	        List<Integer>list=courseteacherService.getbanjiIdByTId(id);
	        teacherService.delete(id);//
	        if(!list.isEmpty()){
	        	courseteacherService.deleteteacourseByTid(id);	
	        }
			String message="删除成功！";
			return message;
		}
	 
	 @ResponseBody
	 @RequestMapping("/many_del_tea")
	 public void deleteMany(HttpServletRequest request){
		 String items = request.getParameter("delitems");// System.out.println(items);  
	      String[] strs = items.split(",");  
	      for (int i = 0; i < strs.length; i++) {  
	          try {  
	              int a = Integer.parseInt(strs[i]);  
	              teacherService.delete(a);  
	          } catch (Exception e) {  
	          }  
	      }  
	 }
	 
	 
	 
	  @RequestMapping(value="/tea_edit",method=RequestMethod.POST) //修改內容 
	  public ModelAndView Update(HttpServletRequest request) throws ParseException,
	  UnsupportedEncodingException{
		  ModelAndView modelAndView=new ModelAndView("redirect:allteacher");
		  SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟 
		  int id=Integer.parseInt(request.getParameter("id"));
		  String tname=request.getParameter("name");
		  String telphone=request.getParameter("telephone");
		  String email=request.getParameter("email");
		  String birth=request.getParameter("birth");
		  String tcode=request.getParameter("tcode1");
		  java.util.Date births=dd.parse(birth);  
		  String workcall=request.getParameter("workcall");
		  classroomService.updateTname(tname,tcode);
		  teacherService.Updates(id, tname, telphone, email, births,workcall);
		  courseteacherService.UpdateTeacher(id,tname);
		  
          return modelAndView;
	  }  
	 
	 
	 
	    @ResponseBody
	    @RequestMapping(value="/login",produces="text/html;charset=utf-8")
		public String TeacherLogin(HttpServletRequest request,HttpSession session){
			String tcode=request.getParameter("tcode");
			String tpass=request.getParameter("tpass");
			//根据tcode 找到老师
			String tnames=teacherService.getNameBycode(tcode,tpass);//获取到名字
			//System.out.println(tnames);
			Integer tid=teacherService.getIdByNameAndPass(tcode,tpass);

		    String message=null;
		   // System.out.println(tid);
			if(tid==null){
				message="账号或者密码出错！请重新确认";
				return message;
			}
			else{
				//根据tid 查到img
				String headimg=teacherService.getheadById(tid);
				message="登陆成功！";
				session.setAttribute("tid", tid);
				session.setAttribute("username", tnames);
				session.setAttribute("headimg", headimg);
				return message;
			}
		}
	    
	    @ResponseBody
	    @RequestMapping("/editpass")
	    public ModelAndView EditPass(HttpServletRequest request,HttpSession session){
	    	String newpass=request.getParameter("newpass");
	    	int id=Integer.parseInt(String.valueOf(session.getAttribute("tid")) );
	    	//System.out.println("密码："+newpass+"id:"+id);
	    	teacherService.UpdatePassById(id,newpass);//更新密码操作
	    	ModelAndView modelAndView=new ModelAndView("redirect:/teacher/person");
	    	return modelAndView;
	    }
	    
	    
	    @ResponseBody
	    @RequestMapping("/editpass2")
	    public String passget(HttpServletRequest request,HttpSession session){
	    	String newpass=request.getParameter("pass");
	    	String scode=request.getParameter("scode");
	    	Integer tid=teacherService.getIdBycode(scode);
	    	teacherService.UpdatePassById(tid, newpass);
	    	return "ok";
	    }
	    
	    @ResponseBody
	    @RequestMapping(value="/query",produces="text/html;charset=utf-8")
	    public String Query(HttpServletRequest request) throws UnsupportedEncodingException{
	    	request.setCharacterEncoding("utf-8");
	    	String message=null;
	    	String content=request.getParameter("content");
	    	//System.out.println(content);
	    	List<Teacher> teacher=teacherService.getTeacherByCondition(content);
	    	//System.out.println(teacher.getEmail());
	    	if (teacher.isEmpty()) {
	    		message="b";
	    		return message;
				
			}
	    	else {
	    		message="a";
				return message;
	    	}
	    }
	   
	    
	    
	    @RequestMapping(value="/QueryByCondition",produces="text/html;charset=utf-8")
	    public String Query1(HttpServletRequest request) throws UnsupportedEncodingException{
	    	request.setCharacterEncoding("utf-8");
	    	String content=request.getParameter("content");
	    	String content1=URLDecoder.decode(content, "utf-8");
	    	//System.out.println(content);
	    	List<Teacher> teacher=teacherService.getTeacherByCondition(content1);
	    	request.setAttribute("teacher",teacher);
	    	return "/teacher/inforteacher";
	    }
	    
	    @RequestMapping("/detailteacher")
	    public String detailtea(HttpServletRequest request){
	    	int tid=Integer.parseInt(request.getParameter("tid"));
	    	Teacher teacher=teacherService.getTeacherById(tid);
	    	
	    	List<Integer>list=courseteacherService.getCourseIdByTId(tid);//根据tid找到所有的cid
	    	List<Course> list2=new ArrayList<Course>();
	    	for(int i=0;i<list.size();i++){
	    		list2.add(courseService.getCourseById(list.get(i)));
	    	}
	    	for(int i=0;i<list2.size();i++){
	    		for(int j=list2.size()-1;j>i;j--){
	    			if (list2.get(j).getCname().equals(list2.get(i).getCname())) {
						list2.remove(j);
						
					}
	    		}
	    	}
	    	request.setAttribute("teacher", teacher);
	    	request.setAttribute("course", list2);
	    	return "/teacher/detailteacher";
	    }
	    
	    @ResponseBody
	    @RequestMapping("/getpassfound")
	    public String Getpassfound(HttpServletRequest request) throws Exception{
	    	String tcode=request.getParameter("tcode");
	    	System.out.println(tcode);
	    	//根据scode给邮箱发送信息
	    	Integer tid=teacherService.getIdBycode(tcode);
	    	String email=teacherService.getEmailById(tid);
	    	String name=teacherService.getNameById(tid);
	    	String sex=teacherService.getSexByid(tid);

	         String chenwei=null;
	         if(sex=="男"){
	         	chenwei="先生";
	         }
	         else {
	 			chenwei="女士";
	         }
             EmailUtilTeacher emailUtil=new EmailUtilTeacher();
             String string=emailUtil.password(name, email, sex,tid);
             if (string=="no") {
            	 String meString="该账号在很短的时间内已经接受大量本系统的消息提示！请过段时间再尝试";
				return meString;
			}
             else{
            	 return "ok";
             }
            	 
	    }
	    
	    @ResponseBody
	    @RequestMapping("/getcodeident")
	    public String getcodeident(HttpServletRequest request){
	    	String ident=request.getParameter("ident");
	    	String scode=request.getParameter("scode");
	    	//System.out.println(ident+","+scode);
	    	Integer uid=teacherService.getIdBycodeIdent(ident,scode);
	    	System.out.println(uid);
	    	String message="no";
	    	if(uid!=null){
	    		message="ok";
	    		return message;
	    	}
	    	else return message;
	    }
	    
	    
	    
}
