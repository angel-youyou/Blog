package com.manager.dao;

import java.util.List;
import com.manager.bean.User;
public interface UserMapper {
     public List<User> findAll();
     public List<User> selectOneUser(String account);
     public User selectOneUserById(int id);
}
