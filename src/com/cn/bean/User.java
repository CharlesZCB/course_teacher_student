package com.cn.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生
 * @作者  张昌北
 * @创建时间 2018年1月11日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */


public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ident;//身份证
	public String getIdent() {
		return ident;
	}
	public void setIdent(String ident) {
		this.ident = ident;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String filename;//头像文件地址
	private int id;	//个人id
	private String sex;//性别
	private String name;//姓名
	private String password;//密码
	private String email;//邮箱
	private Date   birth;//生日
	private String head;//头像名
	private String scode;//学生生成号
	private int banhao;//班号
	private Classroom classroom;//生成的班级对象
	private String s_county;//所在省市区
	private String s_city;//所在省市区
	private String s_province;//所在省市区
	private String banming;
	private String nianji;
	public String getBanming() {
		return banming;
	}
	public void setBanming(String banming) {
		this.banming = banming;
	}
	public String getNianji() {
		return nianji;
	}
	public void setNianji(String nianji) {
		this.nianji = nianji;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Classroom getClassroom() {
		return classroom;
	}
	public void setClassroom(Classroom classroom) {
		this.classroom = classroom;
	}
	
	
	
	
	public User() {
		super();
	}
	public User(int id, String name, String password, String email, Date birth,String head,
			String filename,String s_county,String s_province,String s_city) {
		super();
		this.s_county=s_county;
		this.s_province=s_province;
		this.s_city=s_city;
		this.filename=filename;
		this.head=head;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "User [ident=" + ident + ", filename=" + filename + ", id=" + id + ", sex=" + sex + ", name=" + name
				+ ", password=" + password + ", email=" + email + ", birth=" + birth + ", head=" + head + ", scode="
				+ scode + ", banhao=" + banhao + ", classroom=" + classroom + ", s_county=" + s_county + ", s_city="
				+ s_city + ", s_province=" + s_province + ", banming=" + banming + ", nianji=" + nianji + "]";
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getS_county() {
		return s_county;
	}
	public void setS_county(String s_county) {
		this.s_county = s_county;
	}
	public String getS_province() {
		return s_province;
	}
	public void setS_province(String s_province) {
		this.s_province = s_province;
	}
	public String getS_city() {
		return s_city;
	}
	public void setS_city(String s_city) {
		this.s_city = s_city;
	}
	
	public int getBanhao() {
		return banhao;
	}
	public void setBanhao(int banhao) {
		this.banhao = banhao;
	}

	
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	
}
