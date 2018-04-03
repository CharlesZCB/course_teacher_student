package com.cn.bean;

import java.io.Serializable;

/**
 * 学生和课程之间的练习Bean
 * @作者  张昌北
 * @创建时间 2018年2月3日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Usercourse implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3423502591334561621L;
	private String nian;
	private String xueqi;
	private int ctime;
	private int bid;
	public String getNian() {
		return nian;
	}
	public void setNian(String nian) {
		this.nian = nian;
	}
	public String getXueqi() {
		return xueqi;
	}
	public void setXueqi(String xueqi) {
		this.xueqi = xueqi;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getCtime() {
		return ctime;
	}
	public void setCtime(int ctime) {
		this.ctime = ctime;
	}
	private String cname;//课程名字
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	private String uname;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	private int cid;//课程id
	private String uid;//学生id
	private int score;//学生的该门课程成绩
	private int id;//一条信息的id
	private String dateup;//得到成绩的时间（哪一年）
	private Course course;
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getDateup() {
		return dateup;
	}
	public void setDateup(String dateup) {
		this.dateup = dateup;
	}
	public Usercourse() {
		super();
	}
	public Usercourse(int cid, String uid, int score, int id) {
		super();
		this.cid = cid;
		this.uid = uid;
		this.score = score;
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
