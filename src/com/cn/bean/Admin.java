package com.cn.bean;

import java.io.Serializable;

/**
 * 管理员类
 * @作者  张昌北
 * @创建时间 2018年2月6日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class Admin implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Admin() {
		super();
	}
	public Admin(String password, String name, int id) {
		super();
		this.password = password;
		this.name = name;
		this.id = id;
	}
	private String password;
	private String name;
	private int id;
	private String head;
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
