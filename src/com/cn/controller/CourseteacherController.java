package com.cn.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cn.bean.Classroom;
import com.cn.bean.Course;
import com.cn.bean.ScoreAdmin;
import com.cn.bean.Usercourse;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.ScoreAdminService;
import com.cn.service.UsercourseService;

import net.sf.jsqlparser.statement.select.FromItem;
import sun.security.action.GetBooleanAction;
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
public class CourseteacherController {
	@Autowired
	UsercourseService usercourseservice;
	@Autowired
	ScoreAdminService scoreAdminService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	CourseService courseService;
	
	@RequestMapping("/score/ownclasscore")
	public String GetOwnclassScore(HttpServletRequest request,HttpSession session){
		int classid=Integer.parseInt(request.getParameter("classroomid"));
	    /*
	     * 获取数据库中的 年  学期  
	     */	    
	    List<ScoreAdmin> scorelist=scoreAdminService.getAll();
	    request.setAttribute("timelist", scorelist);
	    request.setAttribute("classident", classid);
	    return "/teacher/ownclassscore";
	}
	
	/**
	 * 查询年度成绩
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	
	@ResponseBody
	@RequestMapping(value="/score/shaixuan",produces="text/html;charset=utf-8")
	public String Shaixuann(HttpServletRequest request) throws UnsupportedEncodingException{
		int classid=Integer.parseInt(request.getParameter("classident"));
		
		//System.out.println(classid+"班级的id");
		String xueqi1=request.getParameter("xueqi");
		//System.out.println(xueqi1);
		String xueqi=URLDecoder.decode(xueqi1,"UTF-8");
		/*System.out.println(xueqi);*/
		String xueqies[]=xueqi.split("-");
	    List<LinkedHashMap>scores=usercourseservice.GetScoresByBidAndXueqi(classid,xueqies[0],xueqies[1]);
	    
	    //System.out.println(scores);
	    String message=null;
	    if(scores.isEmpty()){
	    	//message=xueqi+"数据查找失败,暂无您要的数据";
	    	//System.out.println(message);
	    	message="no";
	    	return message;
	    }
	    else{
	    	
	    	message="yes";
	    	return message;
	    }
	}
	
	@RequestMapping(value="/score/actionquery")
	public String ActionAuery(HttpServletRequest request) throws UnsupportedEncodingException{
		int classid=Integer.parseInt(request.getParameter("classident"));
		String xueqi1=request.getParameter("xueqi");
		String xueqi=URLDecoder.decode(xueqi1,"UTF-8");
		String xueqies[]=xueqi.split("-");
	    List<LinkedHashMap>scores=usercourseservice.GetScoresByBidAndXueqi(classid,xueqies[0],xueqies[1]);
	   // System.out.println(classid+" .. "+xueqies[0]+"  .."+xueqies[1]);
		 int number_title=0;
		    if(scores!=null){
		    	Iterator iterator=scores.get(0).entrySet().iterator();
	        	List titles=new ArrayList();
	    	    while(iterator.hasNext()){//只遍历一次,速度快
	            Map.Entry  e=(Map.Entry)iterator.next();
	               titles.add((String) e.getKey());
	               number_title++;
	         	}
	    	    request.setAttribute("titles", titles);
		    }
		    List detail= new ArrayList();
		    for(int i=0;i<scores.size();i++){
		    	Map list=scores.get(i);
		    	Iterator iterator=list.entrySet().iterator();
		    	while(iterator.hasNext()){
		    		Map.Entry entry=(Map.Entry)iterator.next();
		    		detail.add(entry.getValue());
		    	}
		    }
		    List<ScoreAdmin> scorelist=scoreAdminService.getAll();
		    request.setAttribute("timelist", scorelist);
		    request.setAttribute("detail", detail);
		    request.setAttribute("numbertitle", number_title);
		    request.setAttribute("classident", classid);
		    request.setAttribute("xueqichoice", xueqi);
		   // System.out.println(xueqi);
		    return  "/teacher/ownclassscore";
	}
	
	
	@RequestMapping("/score/tablescore")
	public String getScoretable(HttpServletRequest request){
		int cid=Integer.parseInt(request.getParameter("cid"));
		/*int bids=Integer.parseInt(request.getParameter("bid"));*/
		String banjis=request.getParameter("bid");//获取前台传过来的json
	    net.sf.json.JSONArray json=net.sf.json.JSONArray.fromObject(banjis);
	    net.sf.json.JSONObject jsonone;
	    //System.out.println(json.length());
	  //  System.out.println(json);
	  //  Map<String,Object> map=null;
	    int fla=0;
	    for(int i=0;i<json.length();i++){
	    	jsonone=json.getJSONObject(i);
	    	int bids=(Integer)jsonone.get("id");
	    	//System.out.println(jsonone.get("id"));
	    	String cnamepanduan=usercourseservice.getCnameByCidBid(cid, bids);
			
			if(cnamepanduan==null){
				fla=0;
				request.setAttribute("flag", fla);
				return"/score/tablescore";
			}
			else {
				fla++;
			}
			/*flags=fla+fla;*/
	    }
	    if(fla!=json.length()){
			int flag=0;
			request.setAttribute("flag", flag);
			return"/score/tablescore";
		}
		
		
		//根据cid到数据库查找所有学生课程是cid的  并且按照班级对号组成块
		//usercourse中根据cid查到所有的uid所对应的值
		List<Usercourse> listcourse= usercourseservice.getAllBycid(cid);
		//System.out.println(listcourse.size());
		List<Classroom>listroom=new ArrayList<Classroom>();//创建room对象集
		List<Integer>banhaos=new ArrayList<Integer>();
		List<String>listscore=new ArrayList<String>();
		
		for(int i=0;i<listcourse.size();i++){
			//截取uid的班号
			String  uid=listcourse.get(i).getUid();
			Integer banhao=Integer.parseInt(uid.substring(4, 8)) ;
			if (!banhaos.contains(banhao)) {
				banhaos.add(banhao);
				
			}
		}
		//System.out.println(banhaos);
		//System.out.println(banhaos.size());打印出来了
		/*for(int i=0;i<banhaos.size();i++){
			System.out.println(banhaos.get(i));
		}*/
		for(int i=0;i<banhaos.size();i++){
			int bid=classroomService.getIdBycode(banhaos.get(i));
			//根据bid，cid到usercourse中查找成绩并加到一起求平均分
			List<Usercourse>list=usercourseservice.getScoreByCidBid(bid, cid);
			int total=0;
			for(int u=0;u<list.size();u++){
				total+=list.get(u).getScore();
			//	System.out.println("分数："+list.get(u).getScore()+"list的大小："+list.size());
				double number=(double)total/list.size();
				String junfen=String.format("%.1f", number);
				
				listscore.add(i,junfen );//存储了各班级的平均分
				
			}
			
		}
		
		/*********************根据班号查到班名***************************/
		for(int i=0;i<banhaos.size();i++){
			listroom.add(classroomService.getClassBybcode(banhaos.get(i)));//存储了班级
		}
		
		//System.out.println(listroom);
		List<String> scores=new ArrayList<String>();
		for(int i=0;i<banhaos.size();i++){
			scores.add(i, listscore.get(i));
		}
		Course course=courseService.getCourseById(cid);
		request.setAttribute("course", course);
		
		String str=null;
		for(int i=0;i<listroom.size();i++){
		 str+=listroom.get(i).getName()+"("+listroom.get(i).getBanhao()+')'+",";
		}
		String scorestr=null;
		for(int i=0;i<listroom.size();i++){
			scorestr+=listscore.get(i)+",";
		}
		String score1=scorestr.substring(4);
		String score2=score1.substring(0, score1.length()-1);
		
		String room1=str.substring(4);
        String room=room1.substring(0, room1.length()-1);
        //System.out.println(room);
        request.setAttribute("data",room);
        request.setAttribute("scores",score2);
        
		return "/score/tablescore";
	}
	
}
