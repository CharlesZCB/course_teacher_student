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
import java.util.List;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.handlers.message_rfc822;
import com.sun.mail.util.MailSSLSocketFactory;

import org.apache.commons.mail.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Classroom;
import com.cn.bean.ScoreAdmin;
import com.cn.bean.User;
import com.cn.bean.Usercourse;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.ScoreAdminService;
import com.cn.service.UserService;
import com.cn.service.UsercourseService;
import com.cn.utils.EmailUtil;
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
@RequestMapping("/users")
public class UserController {
	
	private static String UPLOAD_DIRECTORY ="/images/";
	@Autowired
    UserService userService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	UsercourseService userCourseService;
	@Autowired
	CourseService courseService;
	@Autowired
	ScoreAdminService scoreAdminService;
	@RequestMapping("/stus")
	public String getAll(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,
			HttpServletRequest request) {
		//每页7页條記錄传入第pn页
	    PageHelper.startPage(pn, 5);
		List<User> list=userService.getList();
		//分页查询
		PageInfo<User> pageInfo=new PageInfo<User>(list,6);//使用pageInfo包装查询的结果,连续显示6个
		//只需要将PageInfo交给页面就行了  
		model.addAttribute("pageInfo", pageInfo);
		//到数据库查找所有班级
		List<Classroom> classroomlist=classroomService.getAll();
		request.setAttribute("listroom", classroomlist);
		return "/student/list" ;
	}
	

	@ResponseBody
	@RequestMapping("/stu_del")//调用这个方法
	public void DeleteOne(int id){
		userService.delete(id);//
	}
	@RequestMapping("/stu_del2")
	public ModelAndView Delete(HttpServletRequest request){
		String idString=request.getParameter("id");//学生的id
		String idString2=request.getParameter("pn");
		String idString3=request.getParameter("classid");
		int classid=Integer.parseInt(idString3);
		int pagenum=Integer.parseInt(idString2);//页码
		int id=Integer.parseInt(idString);//id学生的！！
		userService.delete(id);
		ModelAndView modelAndView=new ModelAndView("redirect:/classroom/detailroom?id="+classid+"&pagenum="+pagenum);
		return modelAndView;
	}
	
	@RequestMapping("/add")
	public String Redirect(HttpServletRequest request){
		//List<Classroom> classrooms= userService.getClassRoomsNoDistinct();
		List<Classroom> classrooms=classroomService.getJibieNoDistinct();//查询教室级别不重复的
		request.setAttribute("listjibie", classrooms);
		return "/student/add_stu";
	}
	

      @RequestMapping(value="/add_users",method=RequestMethod.POST)
      public ModelAndView   Addone(HttpServletRequest request,@RequestParam CommonsMultipartFile file,
    		  HttpSession session) 
    				  throws ParseException, IOException{
    	  String ident=request.getParameter("ident");
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String s_city=request.getParameter("s_city");
   String s_province=request.getParameter("s_province");
   String s_county=request.getParameter("s_county");
   String birth=request.getParameter("birth");
   String banhao=request.getParameter("banhao");
   String jibie=request.getParameter("jibie");
   String enge=request.getParameter("zhuanye");
   String sex=request.getParameter("sex");
   String password=request.getParameter("password");
   /*
    * 根据班级的级别  班名获取班号
    */
   String scode1=jibie+banhao;
   int sunb1=userService.getSubcode(banhao) ;
   int sunb=sunb1+1;
   String scode=null;
   scode=scode1+String.format("%02d", sunb);
   int snum=classroomService.getSnumBybanhao(banhao);
   snum++;
   classroomService.updateStuNumBybanhao(snum,banhao);
   
    	  int bannum=Integer.parseInt(banhao);
    	  ModelAndView mv=new ModelAndView("redirect:stus");
    	  ServletContext context = session.getServletContext(); 
    	  String path = context.getRealPath(UPLOAD_DIRECTORY);  
    	  String filename = file.getOriginalFilename();
    	//  System.out.println(filename);//文件名字
    	  //System.out.println(path+" "+filename);
    	  String realfilename=path+'\\'+filename;
    	//  System.out.println(realfilename);
    	  SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
  		  java.util.Date births=dd.parse(birth);
  		  
      	  userService.insertone(name,password, email,births,realfilename,filename,s_county
      	    		,s_province,s_city,scode,bannum,jibie,enge,sex,ident);
    	   
    	  byte[] bytes = file.getBytes();  
    	  BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
    	         new File(path + File.separator + filename)));
    	    stream.write(bytes);  
    	    stream.flush();  
    	    stream.close();  
    	    //System.out.println("====??????=============");
    	    return mv; 
      }
	  
	  @ResponseBody
	  @RequestMapping("/many_del")
	  public void batchDeletes(HttpServletRequest request) {  
	      String items = request.getParameter("delitems");// System.out.println(items);  
	      String[] strs = items.split(",");  
	      for (int i = 0; i < strs.length; i++) {  
	          try {  
	              int a = Integer.parseInt(strs[i]);  
	              userService.delete(a);  
	          } catch (Exception e) {  
	          }  
	      }  
	  }  
	  
	  

	  @ResponseBody
	  @RequestMapping("/user_edit") //修改內容 
	  public ModelAndView Update(HttpServletRequest request) {
		  //System.out.println("进入该方法");
		  int pn=Integer.parseInt(request.getParameter("pn"));
		  ModelAndView modelAndView=new ModelAndView("redirect:stus?pn="+pn);
//		  SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟 
		  //java.util.Date births=dd.parse(birth);
		  int id=Integer.parseInt(request.getParameter("id"));
		  String name=request.getParameter("name");
		  String banming=request.getParameter("zhuanye");
		  int banhao=Integer.parseInt(request.getParameter("banhao"));
		  String jibie=request.getParameter("jibie");
		  String email=request.getParameter("email");
		  userService.Update(id, name,banming,banhao,jibie , email);
		  String scode=userService.getScodeById(id);
		  userCourseService.UpdateBycode(scode,name);
		  return modelAndView;
	  }  
	  

	    @ResponseBody
		@RequestMapping("/Findjibie")//根据传过来的值获取级别下的班级名字
		public List<String> GetClassName(HttpServletRequest request,HttpServletResponse response) 
				throws IOException{
	    	
			String jibie=request.getParameter("jibie");
//			System.out.println(jibie);
			List<String> listname=classroomService.getNameJibie(jibie);
//			for(int i=0;i<listname.size();i++){
//				System.out.println(listname.get(i));
//			}
			List<String> st1=new ArrayList<String>();
			List<String> st2=new ArrayList<String>();
			
			for(int i=0;i<listname.size();i++){
			   String string="<option value='"+listname.get(i)+"'>"+listname.get(i)+"</option>";
				st1.add(string);
			}
			return st1;
			
		}
	    
	    
	    @ResponseBody
		@RequestMapping("/Getbanhao")//根据级别 班级名字 获取班级号
		public List<String> Getbanhao(HttpServletRequest request,HttpServletResponse response) 
				throws IOException{
	    	
			String jibie=request.getParameter("jibie");
			String banming1=request.getParameter("banming");
			
			String banming=URLDecoder.decode(banming1,"UTF-8");
			
			//System.out.println(jibie+"===="+banming+"====---+++");
           List<Integer> list= classroomService.getBanhaoByNameJibie(banming,jibie);
          // System.out.println(list);
           List<String> list2=new ArrayList<String>();
         //  System.out.println(list);
           for(int i=0;i<list.size();i++){
        	   String banhao="<option value='"+list.get(i)+"'>"+list.get(i)+"</option>";
        	   list2.add(banhao);
           }
			return list2;
           }
	    
	    @ResponseBody
	    @RequestMapping(value="/UGetScore", produces = "text/html;charset=UTF-8")
	    public String getScore(HttpServletRequest request,HttpSession session,HttpServletResponse response){
	    	String scode=request.getParameter("code");//获得学生的code
	    	String password=request.getParameter("password");
	    	
			String stuname=userService.getNameBycode(scode,password);//获取到名字
			Integer stuid=userService.getIdByNameAndPass(scode,password);
			
			//System.out.println(headimg);
			//String jibie=userService.getJibieByuid(stuid);
			String data=null;
			if(stuid==null){
				data="账号或者密码出错!请重新确认";
				return data;
			}
			else{
				//根据id去取头像
				String headimg=userService.getImageById(stuid);
				session.setAttribute("stuidown", stuid);
				session.setAttribute("username", stuname);
				session.setAttribute("headimg", headimg);
				data="登陆成功！";
				return data;//登陆成功
			}
	    }
	    
	    @RequestMapping("/person")
		 public String PersonStu(HttpSession session,HttpServletRequest request) 
				 throws UnsupportedEncodingException{
	    	  int id=Integer.parseInt(String.valueOf(session.getAttribute("stuidown")));//个人id

			  String nianji=userService.getNianjiById(id);
			  String banming=userService.getBanmingById(id);
			  int banhao=userService.getBanhaoById(id);
			  String sex=userService.getSexById(id);
			  String name=userService.getNameById(id);
			  String password=userService.getPassswordById(id);//获得密码
			  String img=userService.getImageById(id) ;//获得头像图片的名称
			  String province=userService.getProvinceById(id);//获取省份
			  String county=userService.getCountyById(id);//获得县
			  String city=userService.getCity(id);//
			  java.util.Date birth=userService.getSBirthById(id);//获取教师的生日
			  String email=userService.getEmailById(id);//邮箱
			  String scode=userService.getScodeById(id); 
			  request.setAttribute("nianji", nianji);
			  request.setAttribute("banming", banming);
			  request.setAttribute("banhao", banhao);
			  request.setAttribute("sname", name);
			  request.setAttribute("id", id);
			  request.setAttribute("headImg", img);
			  request.setAttribute("sex", sex);
			  request.setAttribute("password", password);
			  request.setAttribute("province", province);
			  request.setAttribute("county", county);
			  request.setAttribute("city", city);
			  request.setAttribute("birth", birth);
			  request.setAttribute("email", email);
			  request.setAttribute("scode", scode);
			  return "/student/person";
		 }
	    
	    @ResponseBody
	    @RequestMapping("/editpass")
	    public ModelAndView EditPass(HttpServletRequest request,HttpSession session){
	    	String newpass=request.getParameter("newpass");
	    	int id=Integer.parseInt(String.valueOf(session.getAttribute("stuidown")) );
	    	//System.out.println("密码："+newpass+"id:"+id);
	    	//System.out.println(id);
	    	userService.UpdatePassById(id,newpass);//更新密码操作
	    	ModelAndView modelAndView=new ModelAndView("redirect:/person");
	    	return modelAndView;
	    }
	    
	    @ResponseBody
	    @RequestMapping("/editpass2")
	    public String passget(HttpServletRequest request,HttpSession session){
	    	String newpass=request.getParameter("pass");
	    	String scode=request.getParameter("scode");
	    	int id=userService.getIdByscode(scode);
	    	//System.out.println("密码："+newpass+"id:"+id);
	    	//System.out.println(id);
	    	userService.UpdatePassById(id,newpass);//更新密码操作
	    	return "ok";
	    	//ModelAndView modelAndView=new ModelAndView("redirect:/front/loginstudent");
	    	//return modelAndView;
	    }
	    
	    
	    
	    @RequestMapping("/scoreown")
	    public String GetOwnScoreShow(HttpServletRequest request,HttpSession session){
	    	/**
	    	 * 数据库查找学期
	    	 */
	    	int sid=Integer.parseInt(request.getParameter("id"));
	        request.setAttribute("ident", sid);
	        List<ScoreAdmin> scorelist=scoreAdminService.getAll();
			 request.setAttribute("timelists", scorelist);
			 
	    	return "/student/scoreown";
	    }
	    
	    
	    
	    @ResponseBody
	    @RequestMapping(value="/shaixuan",produces="text/html;charset=utf-8")
		public String Shaixuann(HttpServletRequest request){
			String xueqi=request.getParameter("xueqi");
			int ident=Integer.parseInt(request.getParameter("ident"));
			String scode=userService.getScodeById(ident);
			List<ScoreAdmin> scorelist=scoreAdminService.getAll();
			request.setAttribute("timelists", scorelist);
			String message=null;
			/*
			 * 分割学期
			 */
			String xueqis[]=xueqi.split("-");
			String nian=xueqis[0];
			String xuedu=xueqis[1];
			/*
			 * 根据 学生的id  年  学期 来查找所有的功课和成绩
			 */
			List<Usercourse> listscore=userCourseService.getAllByuidAndXueqi(scode,nian,xuedu);
			/*
			 * 如果没有成绩
			 */
			if(listscore.isEmpty()){
				message="查找失败，暂无数据！";
				return message;
			}
			else{
				message="数据查找成功！";
				return message;
				
			}
		}
	    

	    @RequestMapping(value="/ownscorelist")
	    public String QueryScore(HttpServletRequest request) throws UnsupportedEncodingException{
	    	int totalscore=0;
			int totaltime=0;
			int avarage;
			String xueqi=request.getParameter("xueqi");
			
			int ident=Integer.parseInt(request.getParameter("ident"));
			String scode=userService.getScodeById(ident);
			String xueqi1=URLDecoder.decode(xueqi,"UTF-8");
			/*
			 * 分割学期
			 */
			String xueqis[]=xueqi1.split("-");
			String nian=xueqis[0];
			String xuedu=xueqis[1];
			
			
			
		
			List<Usercourse> listscore=userCourseService.getAllByuidAndXueqi(scode,nian,xuedu);
			for(int i=0;i<listscore.size();i++){//总分
				totalscore+=listscore.get(i).getScore();
				totaltime+=listscore.get(i).getCtime();//总学时
			}
			 List<ScoreAdmin> scorelist=scoreAdminService.getAll();
			 request.setAttribute("timelists", scorelist);
			//根据listscore获取里面有几门不及格的
			 int numberscore=0;//定义不及格数目
			 for(int i=0;i<listscore.size();i++){
				 if(listscore.get(i).getScore()<60){
					 numberscore++;
				 }
			 }
			// System.out.println(numberscore);
			 request.setAttribute("lownum", numberscore);
			 
			 
			avarage=totalscore/listscore.size();
			request.setAttribute("ident", ident);
			request.setAttribute("listscore", listscore);
			request.setAttribute("avarage", avarage);
			request.setAttribute("totaltime", totaltime);
			request.setAttribute("totalscore", totalscore);
			request.setAttribute("xueqichoice", xueqi1);
		    return "/student/scoreown";
	    }
	    
	    @RequestMapping(value="/detailstus")
	    public String detailstu(HttpServletRequest request){
	    	int uid=Integer.parseInt(request.getParameter("uid"));
	    	//System.err.println(uid);
	    	User user=userService.getItemById(uid);
	    	request.setAttribute("user", user);
	    	System.out.println(user.getName());
	    	return "/teacher/detailuser";
	    }
	    
	    @ResponseBody
	    @RequestMapping("/getscodeident")
	    public String getscodeident(HttpServletRequest request){
	    	String ident=request.getParameter("ident");
	    	String scode=request.getParameter("scode");
	    	Integer uid=userService.getIdByscodeIdent(ident,scode);
	    	String message="no";
	    	if(uid!=null){
	    		message="ok";
	    		return message;
	    	}
	    	else return message;
	    }
	    
	    
	    @ResponseBody
	    @RequestMapping("/getpassfound")
	    public String Getpassfound(HttpServletRequest request) throws Exception{
	    	String scode=request.getParameter("xuehao");
	    	//根据scode给邮箱发送信息
	    	int sid=userService.getIdByscode(scode);
	    	String email=userService.getEmailById(sid);
	    	String name=userService.getNameBycode(scode);
	    	String sex=userService.getSexById(sid);

	         String chenwei=null;
	         if(sex=="男"){
	         	chenwei="先生";
	         }
	         else {
	 			chenwei="女士";
	         }
             EmailUtil emailUtil=new EmailUtil();
            String meString= emailUtil.password(name, email, sex,sid);
            if(meString=="no"){
            	String message="no";
            	return message;
            }
            else {
            	 return "ok";
			}
	    	
	    }
}