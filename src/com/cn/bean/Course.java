package com.cn.bean;

import java.io.Serializable;

/**
 * 课程java类
 * @作者  张昌北
 * @创建时间 2018年1月28日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Course implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Teacher teacher;
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	private int cid;//课程id
	private int ccode;//课程代码
	private String cname;//课程名字
	private String ctime;//课时
	private int cscore;//学分
	private String cintroduce;
	private String jibie;//给那个级别上的课
	private String xueqi;//哪个学期
	private String year;//哪一年开的课（比如这是2008年需要上的课）
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getJibie() {
		return jibie;
	}
	public void setJibie(String jibie) {
		this.jibie = jibie;
	}
	public String getXueqi() {
		return xueqi;
	}
	public void setXueqi(String xueqi) {
		this.xueqi = xueqi;
	}
	
	public String getCintroduce() {
		return cintroduce;
	}
	public void setCintroduce(String cintroduce) {
		this.cintroduce = cintroduce;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public int getCscore() {
		return cscore;
	}
	public void setCscore(int cscore) {
		this.cscore = cscore;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", ccode=" + ccode + ", cname=" + cname + ", ctime=" + ctime + ", cscore="
				+ cscore + "]";
	}
	public Course(int cid, int ccode, String cname, String ctime, int cscore) {
		super();
		this.cid = cid;
		this.ccode = ccode;
		this.cname = cname;
		this.ctime = ctime;
		this.cscore = cscore;
	}
	public Course() {
		super();
	}
	
}
