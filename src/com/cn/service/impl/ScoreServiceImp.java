package com.cn.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Score;
import com.cn.mapping.ScoreMapping;
import com.cn.service.ScoreService;
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
public class ScoreServiceImp implements ScoreService{

	@Autowired
	ScoreMapping scoreMapping;


}
