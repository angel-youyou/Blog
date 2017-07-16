package com.manager.service;

import java.util.List;

import com.manager.bean.User;


public interface UserService {
	public List<User> listAllUser();
	public List<User> selectOneUser(String account);
	public User selectOneUserById(int id);
}
