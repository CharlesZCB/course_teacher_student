package com.cn.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bean.Classroom;
import com.cn.bean.Course;
import com.cn.bean.Courseteacher;
import com.cn.bean.Score;
import com.cn.bean.ScoreAdmin;
import com.cn.bean.User;
import com.cn.bean.Usercourse;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.ScoreAdminService;
import com.cn.service.ScoreService;
import com.cn.service.TeacherService;
import com.cn.service.UserService;
import com.cn.service.UsercourseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import it.sauronsoftware.jave.Encoder;


/**
 * 
 * @作者  张昌北
 * @创建时间 2018年2月28日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Controller
public class ScoreController {
	@Autowired
	UsercourseService userCourseService;
	@Autowired
	ScoreAdminService scoreAdminService;
	@Autowired
	UserService userService;
	@Autowired
	ScoreService scoreService;
	@Autowired
	ClassRoomService classRoomService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	CourseteacherService  courseteacherService;
	
	@Autowired
	CourseService courseService;
	
	
	@RequestMapping("/score/listscore")
	public String ListShow(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model,HttpSession session,HttpServletRequest request){
		PageHelper.startPage(pn,8);
		List<ScoreAdmin> list=scoreAdminService.getAll();
		//查找年度
		List<String> listyear=courseService.getDistinctYear();
		
		//查找是否已经超时
		for(int i=0;i<list.size();i++){
			Date date=new Date();
			if(date.compareTo(list.get(i).getTime())>0){//如果当前时间大于截止时间(即已经超时)	//则已经超时  flag  制为1
				list.get(i).setFlag(1);
			}
		}
		
		PageInfo<ScoreAdmin> pageInfo=new PageInfo<ScoreAdmin>(list,6);
		model.addAttribute("pageInfo",pageInfo);
		request.setAttribute("years", listyear);
		return "/score/listscore";
	}

	  /**
     * 获取自己所代班级的列表
     * @return
     */
    @RequestMapping("/scores/classroom")
    public String GetListScore(HttpSession session,HttpServletRequest request){
    	int id= Integer.parseInt( String.valueOf(session.getAttribute("tid")) );
    	String tcode=teacherService.getCodeById(id);
    	//根据tcode获取所有涉及到自己的班级信息
    	List<Classroom> list=classRoomService.getClassByTcode(tcode);//还是 clarrom 中的需要更改依据user表更改snum
    	
    	//更改snum（根据banhao）
    	//依据tcode查到banhao (可能带好多班级)一系列班号
    	List<Integer> listbanhao=classRoomService.getBanhaoByTcode(tcode);
    	
    	//根据bcode到user表中查找该班级的总人数
    	
    	for(int i=0;i<listbanhao.size();i++){
    		//System.out.println(listbanhao.get(i));
    		/*依据班号统计人数*/
    		list.get(i).setSnum(userService.getSnumBybcode(listbanhao.get(i)));
    		//跟新classroom中snum  int snum, String banhao
    		classRoomService.updateStuNumBybanhao(userService.getSnumBybcode(listbanhao.get(i)),String.valueOf(listbanhao.get(i)));
    	}
    	request.setAttribute("classroomlist", list);
    	return "/teacher/scoreclass";
    }
    @RequestMapping("/scores/score")
    public String ScoreRegist(HttpServletRequest request,HttpSession session){
    	int id=Integer.parseInt(String.valueOf(session.getAttribute("tid")));
    	
    	
    	
    	
    //	System.out.println(id);
    	/**
    	 * 获得学期
    	 */
    	
    	//System.out.println("1."+time+" "+xueqi+" "+nian);
    	List<Course> courses=new ArrayList<Course>();//存放所有教授的课程
    	List<Classroom> classrooms=new ArrayList<Classroom>();//存放所有教授的班级的信息
    	List<Integer>listcourseId=courseteacherService.getCourseIdByTId(id);//获取到所有与该老师相关的课程id
    	for(int i=0;i<listcourseId.size();i++){
    		//  int no=i;
    		  courses.add( courseService.getCourseById(listcourseId.get(i)));
    	}
    	/*
    	 * 日期格式化
    	 */
    
    	request.setAttribute("courses", courses);
    	return "/score/listbanjiscore";
    }
    @ResponseBody
    @RequestMapping("/scores/getclass")
    public List<Classroom> GetClassByCid(HttpServletRequest request,HttpSession session){
    	int cid=Integer.parseInt(request.getParameter("cid"));
    	Course course=courseService.getCourseById(cid);
    	
    	//根据id 查找到班级
    	int tid=Integer.parseInt(String.valueOf(session.getAttribute("tid")));
    	List<Integer> bcode= courseteacherService.getBanjisByTidCid(tid,cid);//得到一系列的班级的code
    	List<Classroom> listclassroom=new ArrayList<Classroom>();
        //根据bcode查找班级
    	for(int i=0;i<bcode.size();i++){
    		Classroom classroom=classRoomService.getClassBybcode(bcode.get(i));//这个是classroom表中的  需要更改其中的snum
    		listclassroom.add(classroom);
    	}
    	//根据cid  查找所有班级
    	List<String> listbanming=new ArrayList<String>();
    	List<Usercourse>listusercourse=userCourseService.getAllBycid(cid);
    	for(int i=0;i<listusercourse.size();i++){
    		listbanming.add(classRoomService.getNameByBanhao(classRoomService.getbanhaoByCid(listusercourse.get(i).getBid()))); 
    	}
    	request.setAttribute("listroom", listbanming);
    	return listclassroom;
    }
    
    @RequestMapping("/scores/lufen")
    public String Dengfen(HttpServletRequest request,HttpSession session){
    	ScoreAdmin scoreAdmin=scoreAdminService.getRec();
    	Date  time=scoreAdmin.getTime();
    	String xueqi=scoreAdmin.getXueqi();
    	String nian=scoreAdmin.getYear();
    	SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd H:m");
    	String times=sFormat.format(time);
    	request.setAttribute("xueqi", xueqi);
    	request.setAttribute("nian", nian);
    	request.setAttribute("time", times);
    //	System.out.println(times);
    	int id=Integer.parseInt(request.getParameter("id"));//班级的id
        Classroom classroom=classRoomService.getClassDetailById(id);//根据id或得到班级的细节内容
        int banhao=classRoomService.getClassCodeById(id);//班号
        List<User> users=userService.getListBycode(banhao);
        request.setAttribute("classroomperson", classroom);
        String bname=classRoomService.getNameByBanhao(banhao);//班级名字
        request.setAttribute("bname",bname);
        request.setAttribute("banhao", banhao);

        request.setAttribute("users", users);
        List<String> listScode=new ArrayList<String>();
        for(int i=0;i<users.size();i++){
        	listScode.add(users.get(i).getScode());
        }
        
        request.setAttribute("userclass", listScode);
        int cid=Integer.parseInt(request.getParameter("cid"));
        int snum=classroom.getSnum();//得到班级的人数
        request.setAttribute("snum", snum);
        request.setAttribute("cid", cid);
        request.setAttribute("bid", id);
        /**
    	 * 系统自动判断时间是否超过录入分数的指定时间 一旦超过  教师不可继续录入分数
    	 */
        int status=0;
    	Date date=new Date();//获取系统当前时间
    	Date date2=scoreAdminService.getTime(1);//根据状态是1 的提取数据时间
    	if(date2.getTime()<date.getTime()){
    		status=0;//表示超过时间
    	}
    	else {
			status=1;//未超过时间
		}
    //	System.err.println("controll:"+status);
    	request.setAttribute("status", status);
    	return "/score/personclass";
    	
    }
    
    @ResponseBody
    @RequestMapping(value="/score/batches",produces="text/html;charset=utf-8")
    public String InsertMore(HttpServletRequest request,HttpSession session) throws InvalidFormatException, IOException{
    	//ModelAndView modelAndView=new ModelAndView("redirect:/scores/score");
    	String nian=request.getParameter("nian");
    	String xueqi=request.getParameter("xueqi");
    	int  cid= Integer.parseInt(request.getParameter("cid"));
    	int bid=Integer.parseInt(request.getParameter("bid"));
    	//根据bid查找bcode
    	//根据cid  bid  到数据库查看记录数目是否和班级人数相同
    	int totalnumber=userCourseService.getNumBycidBid(cid,bid);
    	
    	String listuser=(String)request.getParameter("userclass");
    	int snuo=Integer.parseInt(request.getParameter("snum"));//获取班级的人数
    
    	String newScode1=listuser.replace("[", "");
    	String newScode=newScode1.replace("]", "");
    	String newcodes=newScode.replace(" ", "");
    	String[] listcode=newcodes.split(",");//获得学号的数组
    	String filename1=request.getParameter("filename");
    	int start = filename1.lastIndexOf("\\");
    	String filename= filename1.substring(start+1);

    	String file="C:/Users/Administrator/Desktop/"+filename;
		File filetext=new File(file);
		String message=null;
		
		//判断文件是否存在 如果存在
		if(filetext.exists()){
			if(filename.endsWith("xlsx")||filename.endsWith("xls")){
				 InputStream inputStream=new FileInputStream(file);
		         Workbook workbook=WorkbookFactory.create(inputStream);
		         Sheet sheet=workbook.getSheetAt(0);
		       if(snuo!=sheet.getLastRowNum()){
		        	 message="人数匹配出错！请重新检查！";
		        	 return message;
		         }
		         else{
		        	 
		        	 int flag=0;//用于判断是否插入数据成功的标志
		        	 //System.out.println("走到这了。。。1");
		        	 
		        	 
		        	 
		        	 for(int i=0;i<sheet.getLastRowNum();i++){
		        		 
		        		// System.out.println("走到这了。。。2");
		        		 Row row=sheet.getRow(i+1);
			        	 for(int t=0;t<sheet.getLastRowNum();t++){//循环判断序列对应是否正确
			        		//	System.out.println("走到这了。。。3");
			        			Row row1=sheet.getRow(t+1);
			        			row1.getCell(0).setCellType(1);//设置成字符串
			        			String scode1=listcode[t];
			        			String scode2 = row1.getCell(0).getStringCellValue().trim();
			        			int score=(int) row1.getCell(1).getNumericCellValue();
			        			
			        			//System.out.println("比较code："+scode1+" "+scode2);
			        			if(!scode1.equals(scode2)){
			        				message="学号顺序或学号出错,请重新检查！";
			        				return message;
			        			}
			        			if (score>100||score<0) {
									message="您的表中有数据不合法，请重新检查";
									return message;
								}
			        			
		        	 }//判断学号对应是否正确结束
			        row.getCell(1).setCellType(0);
			        String uid=listcode[i];//获得学号
			        String uname=userService.getNameBycode(uid);
					int courseid=Integer.parseInt(request.getParameter("cid"));
					int ctime=courseService.getCtimeByCid(courseid);
					String cname=courseService.getCoursenameById(courseid);
					int score=(int)row.getCell(1).getNumericCellValue();
				//	System.out.println(snuo+","+flag);
					
					 if(totalnumber==snuo){
			    		 message="此班级该年度该门课程成绩已经录入过，您无法再次录入成绩！";
			    		 return message;
			    	 }
					/* if(score>100||score<0){
						 message="表中有成绩无效，请重新检查";
						 return message;
					 }*/
					userCourseService.insertScore(courseid, uid, score,uname,cname,ctime,bid,nian,xueqi);
					flag++;
				
		         }
		           if (flag!=0) {
		        	   message="成绩批量插入成功！";
						 return message; 
				}
		         }
			}//判断文件存在的情形结束
			else {
				message="文件格式出错！文件类型-xlsx和xls文件";
				 return message; 
			}
		}
		//如果不存在
		else {
			 message="指定位置文件找不到请重新确认!";
			 return message; 
		}
		return message;
    }
    
    
    /**
     * 教师课表
     * @param request
     * @param 
     * @return
     * @throws UnsupportedEncodingException 
     */
    @ResponseBody
    @RequestMapping(value="/scores/table1",produces="text/html;charset=utf-8")
    public String Table1(HttpServletRequest request) throws UnsupportedEncodingException{
    	int tid=Integer.parseInt(request.getParameter("id"));
    	String year2=request.getParameter("year");
    	String year1=URLDecoder.decode(year2, "UTF-8");
    	System.out.println("table1中的year:"+year1);
    	String[] strings=year1.split("-");
    	
    //	System.out.println("进入table1");
    	//根据year查到一些列的cid　　再到teachercourse根据tid cid查到课程的信息
    	List<Integer> listcid=courseService.getCourseIdByYear(strings[0],strings[1]);
    	String message=null;
    	List<Courseteacher> list=new ArrayList<Courseteacher>();
    	
    	//根据cid tid能偶查到一系列id
    	List<List<Integer>> listInteger=new ArrayList<List<Integer>>();
    	//List<List<Integer>>listInteger=new ArrayList<List<Integer>>();
    	for(int i=0;i<listcid.size();i++){
        	List<Integer>listId=courseteacherService.getIdByTidCid(tid, listcid.get(i));
        	listInteger.add(listId);
    	}

        List<List<Integer>>listArry=new ArrayList<List<Integer>>();
        for(int i=0;i<listInteger.size();i++){
        	listArry.add(listInteger.get(i));
        }
       // System.out.println("listArry的长度："+listArry.size());
        for(int i=0;i<listArry.size();i++){
        	//
        	for(int t=0;t<listArry.get(i).size();t++){
        		list.add(courseteacherService.getAllById(listArry.get(i).get(t))); 
        	}
        }
        
    	if(!list.isEmpty()){
 	       message="yes";
    	   return message;
		}
		else {
			message="no";
			return message;
		}
    }
    

    @RequestMapping(value="/scores/table",produces="text/html;charset=utf-8")
    public String Table(HttpServletRequest request) throws UnsupportedEncodingException{
    	int tid=Integer.parseInt(request.getParameter("id"));
    	String year2=request.getParameter("year");
    	//System.out.println("table 中year2："+year2);
    	String year1=URLDecoder.decode(year2,"UTF-8");
    	//System.out.println("转换完后是："+year1);
    	String[] year=year1.split("-");
    	
    	//根据year查到一些列的cid　　再到teachercourse根据tid cid查到课程的信息
    	List<Integer> listcid=courseService.getCourseIdByYear(year[0],year[1]);
    	
    	List<List<Courseteacher>> list=new ArrayList<List<Courseteacher>>();
    	for(int i=0;i<listcid.size();i++){
    		int cident=listcid.get(i);
    		list.add(courseteacherService.getAllByTidCid(tid,cident)) ;
    	}
    	
    	//List<Courseteacher> list=courseteacherService.getAllByTid(tid);
    	
    	List<Courseteacher> listrow1=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow1.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow2=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow2.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow3=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow3.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow4=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow4.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow5=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow5.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow6=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow6.add(i,new Courseteacher());
		}

    	for(int i=0;i<list.size();i++){
    		for(int t=0;t<list.get(i).size();t++){
    			if(list.get(i).get(t).getJie().equals("第一节")){
        			if(list.get(i).get(t).getWeek().equals("周一")){
        				listrow1.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow1.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow1.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow1.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow1.set(4, list.get(i).get(t));
        			}
        			
        		}
        		if(list.get(i).get(t).getJie().equals("第二节")){
        			if(list.get(i).get(t).getWeek().equals("周一")){
        				listrow2.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow2.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow2.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow2.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow2.set(4, list.get(i).get(t));
        			}
        		}
        		
        		if(list.get(i).get(t).getJie().equals("第三节")){
        			if(list.get(i).get(t).getWeek().equals("周一")){
        				listrow3.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow3.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow3.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow3.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow3.set(4, list.get(i).get(t));
        			}
        		}
        		
        		if(list.get(i).get(t).getJie().equals("第四节")){
        			
        			if(list.get(i).get(t).getWeek().equals("周一")){
        				listrow4.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow4.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow4.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow4.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow4.set(4, list.get(i).get(t));
        			}
        		}
        		
        		if(list.get(i).get(t).getJie().equals("第五节")){
        			if(list.get(i).get(t).getWeek().equals("周一")){
        				listrow5.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow5.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow5.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow5.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow5.set(4, list.get(i).get(t));
        			}
        		}
        		if(list.get(i).get(t).getJie().equals("第六节")){
        			if(list.get(i).get(t).getWeek().equals("周一") ){
        				listrow6.set(0, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周二")){
        				listrow6.set(1, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周三")){
        				listrow6.set(2, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周四")){
        				listrow6.set(3, list.get(i).get(t));
        			}
        			if(list.get(i).get(t).getWeek().equals("周五")){
        				listrow6.set(4, list.get(i).get(t));
        			}
        		}
    		}
    		
    	}
    	request.setAttribute("listrow1", listrow1);
    	request.setAttribute("listrow2", listrow2);
    	request.setAttribute("listrow3", listrow3);
    	request.setAttribute("listrow4", listrow4);
    	request.setAttribute("listrow5", listrow5);
    	request.setAttribute("listrow6", listrow6);
    	request.setAttribute("year", year1);
    	List<Course>listcourse=courseService.getAllDistinct();
    	request.setAttribute("listcourse", listcourse);
    	return "/teacher/table";
    }
    
    @RequestMapping("/scores/tableMain")
    public String Maintable(HttpServletRequest request){
    	int tid=Integer.parseInt(request.getParameter("id"));
    	//查找所有的年度
    	List<Course>listcourse=courseService.getAllDistinct();
    	request.setAttribute("listcourse", listcourse);
    	request.setAttribute("tid", tid);
    	List<Courseteacher> listrow1=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow1.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow2=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow2.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow3=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow3.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow4=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow4.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow5=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow5.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow6=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow6.add(i,new Courseteacher());
		}
		request.setAttribute("listrow1", listrow1);
    	request.setAttribute("listrow2", listrow2);
    	request.setAttribute("listrow3", listrow3);
    	request.setAttribute("listrow4", listrow4);
    	request.setAttribute("listrow5", listrow5);
    	request.setAttribute("listrow6", listrow6);
    	return "/teacher/table";
    }
    
    
}
