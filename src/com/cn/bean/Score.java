package com.cn.bean;

import java.io.Serializable;

/**
 * 成绩类
 * @作者  张昌北
 * @创建时间 2018年1月29日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */

public class Score implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5514389649657298025L;
	private int cid;//课程的id
	private int sid;//学生的id
	private int score;//对应的分数
	public Score() {
		super();
	}
	public Score(int cid, int sid, int score) {
		super();
		this.cid = cid;
		this.sid = sid;
		this.score = score;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
}
