package com.cn.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Tip;
import com.cn.mapping.TipMapping;
import com.cn.service.TipService;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Service
public class TipServiceImp implements TipService {

	@Autowired
	TipMapping tipMapping;
	@Override
	public void insertMessage(int tid, String cname, int banhao, String banming,int i) {
		tipMapping.insertOne(tid,cname,banhao,banming,i);
	}
	@Override
	public List<Tip> getMessageBytid(int tid) {
		// TODO Auto-generated method stub
		return tipMapping.getMessageByTid(tid);
	}
	@Override
	public void UpdateStatuesById(int id) {
		// TODO Auto-generated method stub
		tipMapping.updateStatueByid(id);
	}
	@Override
	public void deleteByid(int id) {
		tipMapping.delete(id);
	}
	


}
