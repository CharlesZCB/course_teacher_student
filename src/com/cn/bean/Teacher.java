package com.cn.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 教师
 * @作者  张昌北
 * @创建时间 2018年1月19日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Teacher implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7348861340431173688L;
	
	public String getIdent() {
		return ident;
	}
	public void setIdent(String ident) {
		this.ident = ident;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private int id;//教师id  用于唯一标识老师
	private String tsex;//教师性别
	private String tcode;//教师编号
	private String tname;//姓名
	private String telphone;//电话
	private String password;//教师用户密码
	private String workcall;//职称
	private Date birth;//生日
	private String province;//教师所在省
	private String city;//教师所在县
	private String county;//教师所在市
	private String headname;//教师头像图片名称
	private String headads;//教师头像地址路径
	private String email;//教师的邮箱
	private String ident;//身份证
	
	/**
	 * 中间类CourseTeacher
	 * @return
	 */
	private Courseteacher courseteacher;
	public Courseteacher getCourseteacher() {
		return courseteacher;
	}
	public void setCourseteacher(Courseteacher courseteacher) {
		this.courseteacher = courseteacher;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWorkcall() {
		return workcall;
	}
	public void setWorkcall(String workcall) {
		this.workcall = workcall;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getHeadname() {
		return headname;
	}
	public void setHeadname(String headname) {
		this.headname = headname;
	}
	public Teacher() {
		super();
	}
	public Teacher(int id, String tname, String telphone, String workcall, Date birth, String province, String city,
			String county, String email) {
		super();
		this.id = id;
		this.tname = tname;
		this.telphone = telphone;
		this.workcall = workcall;
		this.birth = birth;
		this.province = province;
		this.city = city;
		this.county = county;
		this.email = email;
	}
	public String getHeadads() {
		return headads;
	}
	public void setHeadads(String headads) {
		this.headads = headads;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}
