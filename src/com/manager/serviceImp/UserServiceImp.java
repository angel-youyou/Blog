package com.manager.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.manager.bean.User;
import com.manager.service.UserService;
import com.manager.dao.UserMapper;
@Service
@Transactional
public class UserServiceImp implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	
	
	@Override
	public List<User> listAllUser() {
		// TODO Auto-generated method stub
		
		return userMapper.findAll();
	}
	
	@Override
	public List<User> selectOneUser(String account){
		return userMapper.selectOneUser(account);
	}
	
	@Override
	  public User selectOneUserById(int id){
		return userMapper.selectOneUserById(id);
	}
}
