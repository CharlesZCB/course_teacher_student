package com.cn.bean;

import java.util.Date;

/**
 * 保存用户IP的类
 * @作者  张昌北
 * @创建时间 2018年3月6日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class IpAdd {

	private Date time;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private int id;
	private String ipaddress;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public IpAdd(int id, String ipaddress) {
		super();
		this.id = id;
		this.ipaddress = ipaddress;
	}
	public IpAdd() {
		super();
	}
	
}
