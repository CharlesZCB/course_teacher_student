package com.cn.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Classroom;
import com.cn.bean.User;
import com.cn.mapping.UserMapping;
import com.cn.service.UserService;
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
public class UserServiceImp implements UserService{

	@Autowired
	UserMapping usermapping;
	
	@Override
	public List<User> getList() {
		
		return usermapping.list();
	}

	@Override
	public void delete(int id) {
		
		usermapping.delete(id);
	}

	



	@Override
	public User getItemById(int id) {
		//System.out.println(usermapping.getItem(id));
	//	System.out.println("id是"+id);
		return usermapping.getItem(id);
		
	}



    @Override
	public void insertone(String name, String password, String email,Date birth,String headaddress,String filename,
			String s_county,String s_province,String s_city,String scode,int bannum,String jibie,
			String enge,String sex,String ident) {
		usermapping.insertUser(name,password,email,birth,headaddress,filename,s_county,s_province,s_city,scode,
				bannum,jibie,enge,sex,ident);
	}

	@Override
	public void Update(int id,String name,String banming,int banhao,String jibie ,String email) {
		usermapping.Update(id,name,banming,banhao,jibie,email);
		
	}

	@Override
	public List<Classroom> getClassRooms() {
		// TODO Auto-generated method stub
		return usermapping.getAllclassroom();
	}

	@Override
	public List<User> getListByid(int id) {
		return usermapping.getAllByclassId(id);
	}

	@Override
	public List<User> getListBycode(int banhao) {
		return usermapping.getAllByclassId(banhao);
	}

	@Override
	public String getNameById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getNameById(binder);
	}

	@Override
	public String getScodeById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getScodeByID(binder);
	}

	@Override
	public String getEmailById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getEmailById(binder);
	}

	@Override
	public String getVirthById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getBirthById(binder);
	}

	@Override
	public String getBanmingById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getBanmingById(binder);
	}

	@Override
	public String getNianjiById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getNianjiByID(binder);
	}

	@Override
	public int getBanhaoById(int binder) {
		// TODO Auto-generated method stub
		return usermapping.getBanhaoById(binder);
	}

	@Override
	public String getNameBycode(String uid) {
		// TODO Auto-generated method stub
		return usermapping.getNameByCodeu(uid) ;
	}

	@Override
	public String getNameBycode(String scode, String password) {
		// TODO Auto-generated method stub
		return usermapping.getNameByCodeAndPass(scode,password);
	}

	@Override
	public Integer getIdByNameAndPass(String scode, String password) {
		// TODO Auto-generated method stub
		return usermapping.getIdByNameAndpass(scode,password);
	}

	@Override
	public String getSexById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getSexById(id);
	}

	@Override
	public String getPassswordById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getPasswordById(id);
	}

	@Override
	public String getImageById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getImageById(id);
	}

	@Override
	public String getProvinceById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getProvinceById(id);
	}

	@Override
	public String getCountyById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getCountyById(id);
	}

	@Override
	public String getCity(int id) {
		// TODO Auto-generated method stub
		return usermapping.getCityById(id);
	}

	@Override
	public Date getSBirthById(int id) {
		// TODO Auto-generated method stub
		return usermapping.getBirthsById(id);
	}

	@Override
	public void UpdatePassById(int id, String newpass) {
		// TODO Auto-generated method stub
		usermapping.UpdatePassById(id,newpass);
	}

	@Override
	public List<User> getStuByBanhao(int banhao) {
		//System.out.println("Imp里面的banhao:"+banhao);
		return usermapping.getStuBybanhao(banhao);
	}

	@Override
	public int getSubcode(String banhao) {
		// TODO Auto-generated method stub
		return usermapping.getSubCode(banhao);
	}

	@Override
	public int getSnumBybcode(Integer integer) {
		// TODO Auto-generated method stub
		return usermapping.getSnumBybcode(integer);
	}

	@Override
	public String getJibieByuid(Integer stuid) {
		// TODO Auto-generated method stub
		return usermapping.getJIbieByUid(stuid);
	}

	@Override
	public List<User> getAllByBanhao(int banhao) {
		// TODO Auto-generated method stub
		return usermapping.getAllByBanhao(banhao);
	}

	@Override
	public int getIdByscode(String scode) {
		return usermapping.getIdByscode(scode);
	}

	@Override
	public Integer getIdByscodeIdent(String ident, String scode) {
		// TODO Auto-generated method stub
		return usermapping.getIdByscodeIdent(ident,scode);
	}

	









}
