package com.cn.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.bean.Classroom;
import com.cn.bean.Course;
import com.cn.bean.Inform;
import com.cn.bean.News;
import com.cn.bean.Tip;
import com.cn.bean.Video;
import com.cn.service.AdminService;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.IPAddService;
import com.cn.service.InformService;
import com.cn.service.NewsService;
import com.cn.service.TeacherService;
import com.cn.service.TipService;
import com.cn.service.UserService;
import com.cn.service.VideoService;
import com.cn.utils.IPaddressUtil;
import com.cn.utils.MD5Util;
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
public class PageController  {
	@Autowired
	UserService userService;
	@Autowired
	NewsService newsService;
	@Autowired
	InformService informService;
	@Autowired
	ClassRoomService classRoomService;
	@Autowired
	CourseService courseService;
	@Autowired
	AdminService adminService;
	@Autowired
	CourseteacherService courseteacherService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	VideoService videoService;
	@Autowired
	IPAddService ipAddService;
	@Autowired
	TipService tipService;
	
	
	private static int number;
	/**
	 * 学生登录
	 * @return
	 */
	@RequestMapping("/front/loginstudent")
	public String Redircts(){
		return "/preshow/loginstudent";
	}
	
	/**
	 * 教师登录
	 * @return
	 */
	
	@RequestMapping("/front/loginteacher")
	public String Redircts2(){
		return "/preshow/loginteacher";
	}
	
	/**
	 * 管理员登录
	 * @return
	 */
	@RequestMapping("/front/loginadmin")
	public String Redircts3(){
		return "/preshow/loginadmin";
	}
	/**
	 * 视频添加
	 * @return
	 */
	@RequestMapping("/video/addone")
	public String Addone(){
		return "/video/videoadd";
	}
	
	
	/**
	 * 添加课程跳转
	 */
	@RequestMapping("/course/addcourse")
	public String Addcourse(HttpServletRequest request){
		 List<Classroom> listjibie=classroomService.getJibieNoDistinct();
		 request.setAttribute("jibie", listjibie);
		return "/course/addcourse";
	}
	
	@RequestMapping("/student/edit")
	public String RedirectStudent(HttpServletRequest request) throws ParseException{
		int binder=Integer.parseInt(request.getParameter("id"));
		//System.out.println(binder);
		List<Classroom> classrooms=classroomService.getJibieNoDistinct();//查询教室级别不重复的
		request.setAttribute("listjibie", classrooms);
		String name=userService.getNameById(binder);
		String scode=userService.getScodeById(binder);
		String email=userService.getEmailById(binder);
		String birth=userService.getVirthById(binder);
		String banmig=userService.getBanmingById(binder);
		String nianji=userService.getNianjiById(binder);
		int banhao=userService.getBanhaoById(binder);
		//System.out.println(banhao+" "+nianji+" "+banmig);
		
		int pn=Integer.parseInt(request.getParameter("pn"));
		request.setAttribute("pn", pn);
		request.setAttribute("banming",banmig );
		request.setAttribute("banhao", banhao);
		request.setAttribute("nianji", nianji);
		request.setAttribute("name", name);
		request.setAttribute("scode", scode);
		request.setAttribute("email", email);
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		Date births=format1.parse(birth);
		request.setAttribute("birth", births);
		request.setAttribute("id", binder);
		
		
		return"/student/update_stu";
	}
	
	/**
	 * 添加教师跳转
	 */
	@RequestMapping("/teacher/addteacher")
	public String Addteacher(){
		return "/teacher/add_teacher";
	}
	
	/**
	 * 修改教师跳转
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/teacher/updateteacher")
	public String RedirctTeacherchange(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int id=Integer.parseInt(request.getParameter("id"));
		String password=teacherService.getpasswordByid(id);//获得密码
		  String img=teacherService.getheadById(id);//获得头像图片的名称
		  String province=teacherService.getProvince(id);//获取省份
		  String county=teacherService.getCountyById(id);//获得县
		  String city=teacherService.getCity(id);//获取教师所在的市
		  String email=teacherService.getEmailById(id);//邮箱
		  String telephone=teacherService.getTelphoneById(id);//电话
		  String workcall=teacherService.getWorkcallById(id);//获得职称
		  Date birth=teacherService.getBirthById(id);
		  String sex=teacherService.getSexByid(id);
		  String name=teacherService.getNameById(id);
		  String code=teacherService.getCodeById(id);
		  request.setAttribute("headImg", img);
		  request.setAttribute("sex", sex);
		  request.setAttribute("password", password);
		  request.setAttribute("province", province);
		  request.setAttribute("county", county);
		  request.setAttribute("city", city);
		  request.setAttribute("birth", birth);
		  request.setAttribute("email", email);
		  request.setAttribute("telephone", telephone);
		  request.setAttribute("workcall", workcall);
		  request.setAttribute("id", id);
		  request.setAttribute("code", code);
		  request.setAttribute("name", name);
		  return "/teacher/update_teacher";
	}
	
	/*
	 * 通知添加跳转
	 */
	@RequestMapping("/inform/re")
	public String Addinform(){
		return "/inform/informadd";
	}
	/**
	 * 通知修改跳转
	 * @return
	 */
	@RequestMapping("/front/edit")
	public String Inform(){
		return "/inform/informedit";
	}
	

	/**
	 * 新闻添加跳转
	 * @return
	 */
	@RequestMapping("news/addnews")
	public String Redirect(){
		return "/news/addnews";
	}
	

	/**
	 * 从数据库拿数据到前台显示
	 * @return
	 * @throws UnknownHostException 
	 */
	@RequestMapping("/front/home")
	public String HomeShow(HttpServletRequest request,HttpSession session) throws UnknownHostException{
		//ModelAndView modelAndView=new ModelAndView("redirect:preshow/index");
		List<News> list=newsService.getNewsFiveByTime();//拿到前五个变动的新闻
		request.setAttribute("NewsPic", list);
		List<News> list2=newsService.getAll();
		request.setAttribute("newsAll", list2);
		//拿教务通知信息
		List<Inform> list3=informService.getAll();
		request.setAttribute("informs", list3);

		Video lisvideo=videoService.getOneBytime();
		request.setAttribute("video", lisvideo);
		
		/**
		 * 获取IP地址 判断并统计历史访问人数
		 */
		IPaddressUtil ipaddress=new IPaddressUtil();
		String address=ipaddress.GetAddress(request);
		Integer id=ipAddService.getIdByaddress(address);
		if(id==null)
			ipAddService.insertone(address);
		int total=ipAddService.getMaxId();
		session.setAttribute("total", total);
		//System.out.println("传进来的值："+address+"  id："+id);
		//那新闻
		return "/preshow/home";
	}
	
	/**
	 * 前端跳回登录页面
	 */
	@RequestMapping("/home/login")
	public String Login(){
		return "/preshow/login";
	}
	
	 
	 @RequestMapping("/teacher/person")
	 public String PersonTeacher(HttpSession session,HttpServletRequest request) 
			 throws UnsupportedEncodingException{
    	  int id=Integer.parseInt(String.valueOf(session.getAttribute("tid")));//个人id
    	//  System.out.println(id);
		//  String tname=request.getParameter("tname");//姓名
		  
		  String sex=teacherService.getSexByid(id);//获得教师的sex
		 // System.out.println(sex);
          
		  String password=teacherService.getpasswordByid(id);//获得密码
		  String img=teacherService.getheadById(id);//获得头像图片的名称
		  String province=teacherService.getProvince(id);//获取省份
		  String county=teacherService.getCountyById(id);//获得县
		  String city=teacherService.getCity(id);//获取教师所在的市
		  java.util.Date birth=teacherService.getBirthById(id);//获取教师的生日
		  String email=teacherService.getEmailById(id);//邮箱
		  String telephone=teacherService.getTelphoneById(id);//电话
		  String workcall=teacherService.getWorkcallById(id);//获得职称
		  String tcode=teacherService.getCodeById(id);
		  List<Course> listcourse=new ArrayList<Course>();
		  List<Integer> listcourseId =courseteacherService.getCourseIdByTId(id);
		  for(int i=0;i<listcourseId.size();i++){
			listcourse.add(courseService.getCourseById(listcourseId.get(i)));
		  }//根据课程id查找到所有的课程
		  List<Classroom> listroom=classRoomService.getClassByTcode(tcode);
		  
		  
		
		  request.setAttribute("id", id);
		  request.setAttribute("headImg", img);
		  request.setAttribute("sex", sex);
		  request.setAttribute("password", password);
		  request.setAttribute("province", province);
		  request.setAttribute("county", county);
		  request.setAttribute("city", city);
		  request.setAttribute("birth", birth);
		  request.setAttribute("email", email);
		  request.setAttribute("telephone", telephone);
		  request.setAttribute("workcall", workcall);
		 
		  request.setAttribute("listroom", listroom);
		//	System.out.println(listcourse.size());
	    	for(int i=0;i<listcourse.size();i++){
	    		for(int j=listcourse.size()-1;j>i;j--){
	    			if (listcourse.get(j).getCname().equals(listcourse.get(i).getCname())) {
						listcourse.remove(j);
						
					}
	    		}
	    	}
	    
	    	 request.setAttribute("listcourse", listcourse);
		  return "/teacher/person";
	 }
	    @RequestMapping("/school/invalid")
		public String SessionInvalid(HttpSession session){
			session.invalidate();
			return "redirect:/front/home";
		}
	    
	    @RequestMapping("/video/listshowvideo")
	    public String ShowAll(@RequestParam(defaultValue="1",value="pn")Integer pn,Model model){
			PageHelper.startPage(pn, 9);
			List<Video>list=videoService.getAll();
			PageInfo<Video> pageInfo=new PageInfo<Video>(list,6);
			model.addAttribute("pageInfo",pageInfo);
			return "preshow/show/listvideo";
		}
	    
	
	    @RequestMapping("/home/detailnews")
		public String Detail(HttpServletRequest request,HttpSession session){
			String Id=request.getParameter("id");
			int id=Integer.parseInt(Id);
			News news=newsService.getById(id);
			request.setAttribute("news", news);
			return "/preshow/show/newsdetail";
		}
	

	    
	    @RequestMapping("/student/stuscorehome")
	    public String RedStu(){
	    	return "/student/stuscorehome";
	    }
	    
	    @RequestMapping("/teacher/teacherhome")
	    public String RedTea(HttpServletRequest request,HttpSession session){
	    	/**
	    	 * 从数据库查看是否含有自己没有读取的消息
	    	 */
	    	String po=null;
	    	
	    	String tcode=request.getParameter("tcode");
	    	int tid=teacherService.getIdBycode(tcode);
	    	List<Tip> list = tipService.getMessageBytid(tid);
	    	
	    	for(int i=0;i<list.size();i++){
	    		if(list.get(i).getBiaoji()==0){
	    			//System.out.println("list中有0的值！");
	    			po="yes";
	    			session.setAttribute("po",po);
	    	    	return "/teacher/teacherhome";
	    		}
	    	}
	    	po="no";
	    	session.setAttribute("po",po);
	    	return "/teacher/teacherhome";
	    	
	    	
	    }
	    
	    @RequestMapping("/front/passget")
	    public String passget(HttpServletRequest request) throws Exception{
	    	MD5Util md5Util=new MD5Util();
	    	String uidstring1=request.getParameter("uid");
	    	String tidstring1=request.getParameter("tid");
	    	if(uidstring1==null){
	    		String tidstring=md5Util.convertMD5(tidstring1);
	    		String  tcode=teacherService.getCodeById(Integer.parseInt(tidstring));
	    		request.setAttribute("scode", tcode);
				return "/teacher/passget";
	    	}
	    	if(tidstring1==null){
	    		String uidstring=md5Util.convertMD5(uidstring1);
	    		String scode=userService.getScodeById(Integer.parseInt(uidstring));
		    	request.setAttribute("scode", scode);
		    	return "/student/passget";
	    	}
	    	return "";
	    	
	    }
	    
	   
	    
}
