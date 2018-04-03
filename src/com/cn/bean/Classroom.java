package com.cn.bean;

import java.io.Serializable;

/**
 * 班级类
 * @作者  张昌北
 * @创建时间 2018年1月25日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Classroom implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;//班级名字
	private String t_name;//班主任名
	private String tcode;//班主代码
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	private String jibie;//级别
	private int id;//班级id
	private int banhao;
	private int snum;//本班级的学生的数目

	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	private Teacher teacher;
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Classroom(int id, String name, String t_name, String jibie) {
		super();
		this.id = id;
		this.name = name;
		this.t_name = t_name;
		this.jibie = jibie;
	}
	public Classroom(int id, int banhao, String name, String t_name, String jibie) {
		super();
		this.id = id;
		this.banhao = banhao;
		this.name = name;
		this.t_name = t_name;
		this.jibie = jibie;
	}
	
	public int getBanhao() {
		return banhao;
	}
	public void setBanhao(int banhao) {
		this.banhao = banhao;
	}
	
	public String getJibie() {
		return jibie;
	}
	public void setJibie(String jibie) {
		this.jibie = jibie;
	}
	@Override
	public String toString() {
		return "Classroom [name=" + name + ", t_name=" + t_name + ", jibie=" + jibie + ", id=" + id + ", banhao="
				+ banhao + ", teacher=" + teacher + "]";
	}
	public Classroom(){
		super();
	}
	public Classroom(int id, String name, String t_name) {
		super();
		this.id = id;
		this.name = name;
		this.t_name = t_name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
}
