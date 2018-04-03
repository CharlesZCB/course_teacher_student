package com.cn.controller;



import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.cn.bean.Course;
import com.cn.bean.Teacher;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.TeacherService;
import com.cn.service.UsercourseService;
import com.cn.utils.CodeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月13日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 * @说明：课程类
 *
 */
@Controller
public class CourseController {
	@Autowired
	CourseService courseService;
	@Autowired
	CourseteacherService courseteacherService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	ClassRoomService classRoomService;
	@Autowired
	UsercourseService usercourseService;
	
	
	@RequestMapping("/course/list")
	public String  InforShow(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		PageHelper.startPage(pn,6);
		List<Course> list=courseService.getAll();
		PageInfo<Course> pageInfo=new PageInfo<Course>(list,6);
		model.addAttribute("pageInfo", pageInfo);
		return "course/courselist";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/course/delete")
	public ModelAndView Delete(HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView("redirect:/course/list");
		String ids=request.getParameter("cid");
		int id=Integer.parseInt(ids);
		courseteacherService.deletecourseByCid(id);
		usercourseService.deleteBycid(id);
		courseService.delete(id);
		return modelAndView;
	}
	
	
	/**
	 * 查看详情跳转
	 */
	@RequestMapping("/course/detailcourse")
	public String  DetailCourse(HttpServletRequest request){
		String cids=request.getParameter("cid");
		int ids=Integer.parseInt(cids);
		List<Integer> list=courseteacherService.getTeacherById(ids);//根据传过来的这门课的id去拿这门课的老师们的code
		//List<Teacher> list2=null;
		List<Teacher> list2=new ArrayList<Teacher>();
		for(int i=0;i<list.size();i++){
			//System.out.println(",,,,,,,,,,,,,,,,,,,,,");
			list2.add(teacherService.getTeacherById(list.get(i)));
			//System.out.println(",,,,,,,,,,,,,,,,,,");
		}
		

		Course course=courseService.getCourseById(ids);
		String cname=course.getCname();
		String ctime=course.getCtime();
		int cscore=course.getCscore();
		String cintroduce=course.getCintroduce();
		int ccode=course.getCcode();
		request.setAttribute("cname", cname);
		request.setAttribute("ctime", ctime);
		request.setAttribute("cscore", cscore);
		request.setAttribute("cintroduce", cintroduce);
		request.setAttribute("ccode", ccode);
		request.setAttribute("teachers", list2);
		return "/course/detail";
		
	}
	
	
	/**
	 * 添加课程的实现
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/course/addcourses")
	public ModelAndView AddReal(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		ModelAndView modelAndView=new ModelAndView("redirect:/course/list");
		String cname=request.getParameter("cname");
		String ctime=request.getParameter("ctime");
		String xueqi=request.getParameter("xueqi");
		String jibie=request.getParameter("jibie");
		String year=request.getParameter("year");
		int ctim=Integer.parseInt(ctime);
		String cscore=request.getParameter("cscore");
		int csco=Integer.parseInt(cscore);
		String cintroduce=request.getParameter("cintroduce");
		//生成课程的代码
		CodeUtil codeUtil=new CodeUtil();
		String codes=codeUtil.getRandom6();
		int ccode=Integer.parseInt(codes);
		courseService.addOne(cname,ctim,csco,ccode,cintroduce,xueqi,jibie,year);
		return modelAndView;
	}
	
	/**
	 * 跳转到添加授课老师的界面
	 */
	@RequestMapping("/course/addteachercourse")
	public String AddTeacher(HttpServletRequest request,HttpSession session){
		
		int cid=Integer.parseInt(request.getParameter("cid"));//得到查看的课程的id
		List<Teacher> teacherlist=new ArrayList<Teacher>();
		/*
		 * 根据指定的课程的id 查找教师的List id
		 */
		List<Integer> teachersId=courseteacherService.getTeacherById(cid);
		
		for(int i=0;i<teachersId.size();i++)
			teacherlist.add(teacherService.getTeacherById(teachersId.get(i)));
		request.setAttribute("teacherlist", teacherlist);//将得到的list teacher传给前台
		session.setAttribute("cid", cid);	
		String pages=request.getParameter("page");
		int pas=Integer.parseInt(pages);
		//System.out.println(pas);
		session.setAttribute("pas", pas);
		Course course=courseService.getCourseById(cid);
		request.setAttribute("course", course);
		List<Teacher> list=teacherService.getList();
		int number=list.size();
		request.setAttribute("num", number);//教师数量
		request.setAttribute("teachers", list);
		//得到一系列的教室
		String jibie=request.getParameter("jibie");
		List<Classroom> list3 = classRoomService.getAllByJibie(jibie);
		request.setAttribute("classroom", list3);
		return "/course/addteach";
		
	}
	
	@RequestMapping("/course/backpages")
	public ModelAndView GoBack(HttpServletRequest request){
		String idString=request.getParameter("pn");
		int pn=Integer.parseInt(idString);
		ModelAndView modelAndView=new ModelAndView("redirect:list?pn="+pn);
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value="/course/sureaddteach",produces="text/html;charset=utf-8")
	public String  Adddsure(HttpServletRequest request){
		//int pn=Integer.parseInt(request.getParameter("pn"));//拿到页码
		int cid=Integer.parseInt(request.getParameter("cc"));//课程id
        int tc= Integer.parseInt(request.getParameter("teach"));//拿到teacher的id
        int ban1=Integer.parseInt(request.getParameter("s1"));//获得班级的id）-----——班号
     
        String week=request.getParameter("week");
        String jie=request.getParameter("jie");
        
        int ctime=courseService.getCtimeByCid(cid);//得到课程的学时
        String cname=courseService.getCoursenameById(cid);
        String tname=teacherService.getNameById(tc);
        /*String name1=classRoomService.getNameByBanhao(ban1);
        String jibie1=classRoomService.getJibieByBanhao(ban1);*/
        String  message=null;
        //根据banhao获取班级的名字 
        String banming=classRoomService.getNameByBanhao(ban1);
       //判断该week 该jie是否有课
       Integer integer= courseteacherService.getIdByWeekAndJie(week, jie ,ban1);
    
       //判断数据库中是否改名老师的该week 的下的该jie是否有课
    	Integer idfalse=courseteacherService.getIdByWeekAndJieTc(week,jie,tc);
    	if(idfalse==null){
    		if(integer==null){
    			courseteacherService.insertOne(tc,cid,ban1,ctime,tname,cname,week,jie,banming);
      		    message ="";
      		    return message;
    		}
    		else if(integer!=null){
    			message="该班级该时间段已经有课程！请重新选择！";
    			return message;
    		}
    		  
    	  }
    	else{
    		  message="该老师授课冲突！,重新选择";
    		  return message;
    	  }
		return message;
    
	}


}
