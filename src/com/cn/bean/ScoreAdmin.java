package com.cn.bean;

import java.io.Serializable;
import java.util.Date;


/**
 * 授权录入分数
 * @作者  张昌北
 * @创建时间 2018年2月17日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public class ScoreAdmin implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3637533068565659336L;
	private Date outtime;//授权录入分数的发布时间
	private int id;//编号
	private String year;//学年
	private String xueqi;//学期
	private Date time;//截止时间
	private int flag;//判断是否已经超时的标志
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public ScoreAdmin() {
		super();
	}
	public ScoreAdmin(int id, String year, String xueqi, Date time, Date outtime) {
		super();
		this.outtime=outtime;
		this.id = id;
		this.year = year;
		this.xueqi = xueqi;
		this.time = time;
	}
	

	public Date getOuttime() {
		return outtime;
	}
	public void setOuttime(Date outtime) {
		this.outtime = outtime;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getXueqi() {
		return xueqi;
	}
	public void setXueqi(String xueqi) {
		this.xueqi = xueqi;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}
