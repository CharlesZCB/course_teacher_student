package com.cn.bean;

import java.util.Date;

public class Tip {

	private int id;//消息记录id
	private int tid;
	private String cname;//
	private String banming;//
	private int banhao;
	private int biaoji;//标志是否已经读取
	private Date time;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Tip() {
		super();
	}
	public Tip(int id, int tid, String cname, String banming, int banhao, int biaoji) {
		super();
		this.id = id;
		this.tid = tid;
		this.cname = cname;
		this.banming = banming;
		this.banhao = banhao;
		this.biaoji = biaoji;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getBanming() {
		return banming;
	}
	public void setBanming(String banming) {
		this.banming = banming;
	}
	public int getBanhao() {
		return banhao;
	}
	public void setBanhao(int banhao) {
		this.banhao = banhao;
	}
	public int getBiaoji() {
		return biaoji;
	}
	public void setBiaoji(int biaoji) {
		this.biaoji = biaoji;
	}
	
}
