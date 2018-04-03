package com.cn.bean;

import java.io.Serializable;

/**
 * 课程老师对应的中间类
 * @作者  张昌北
 * @创建时间 2018年2月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Courseteacher implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ctime;
	public int getCtime() {
		return ctime;
	}
	public void setCtime(int ctime) {
		this.ctime = ctime;
	}
	private String cname;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	private String tname;
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	private int tid;//教师id
	private int cid;//课程的id
	private int id;//这一条记录的id
	private int bid;//对应的班级的id
	private String classname;
	
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}

	private String week;
	private String jie;
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getJie() {
		return jie;
	}
	public void setJie(String jie) {
		this.jie = jie;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public Courseteacher() {
		super();
	}
	public Courseteacher(int tid, int cid, int id) {
		super();
		this.tid = tid;
		this.cid = cid;
		this.id = id;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
