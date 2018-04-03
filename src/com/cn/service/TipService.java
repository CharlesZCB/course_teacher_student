package com.cn.service;

import java.util.List;

import com.cn.bean.Tip;

public interface TipService {

	void insertMessage(int tid, String cname, int banhao, String banming, int i);

	List<Tip> getMessageBytid(int tid);

	void UpdateStatuesById(int id);

	void deleteByid(int id);

}
