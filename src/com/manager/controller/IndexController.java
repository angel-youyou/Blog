package com.manager.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.services.simpleemail.model.Message;
import com.manager.bean.Article;
import com.manager.bean.MyMessage;
import com.manager.bean.User;
import com.manager.service.ArticleService;
import com.manager.service.UserService;



@Controller
public class IndexController {
	@Resource
	public UserService userService;
	
	@Resource
	public ArticleService articleService;
	
	/*
	 * 首页，最新推送
	 * */
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpSession session){	
			List<Article> articleItemForIndex=new ArrayList<Article>();
			articleItemForIndex=articleService.searchBlogByForIndex();
			List<User> userIdexItem = new ArrayList<User>();//首页文章的作者list
			Article articel = new Article();
			for(int i =0 ;i<articleItemForIndex.size();i++ ){
				articel=articleItemForIndex.get(i);
				userIdexItem.add(i, userService.selectOneUserById(articel.getAuthor_id()));
			}
			request.setAttribute("userIdexItem", userIdexItem);
			request.setAttribute("articleItemForIndex", articleItemForIndex);
			User user =(User)session.getAttribute("user");
			if(user==null){
				return "login";
			}else{
				request.setAttribute("message", "index");
				return "index";
				}
	}
	
	
	@RequestMapping("login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("loginAction")
	public  @ResponseBody MyMessage loginAction(HttpServletRequest request,String account, String passWord,HttpSession session) {
		System.out.println(account);
		List<User> user=new ArrayList<User>();
		user=userService.selectOneUser(account);
		MyMessage message =new MyMessage();
		String s="账号密码错误";
		message.setLoginMessage(s);
		if(user.isEmpty()){
			System.out.println(message);
			return message;
		}
		else{
			User liveUser=user.get(0);
			if( liveUser.getPassWord().equals(passWord) ){
				session.setAttribute("user", user);
				message.setLoginMessage("正确");
				session.setAttribute("user", liveUser);
//			 String url = "";
//		         url = request.getScheme() +"://" + request.getServerName()  
//		                         + ":" +request.getServerPort() 
//
//		                         + request.getServletPath();
//		         if (request.getQueryString() != null){
//		             url += "?" + request.getQueryString();
//		         }	
				return message;
			}
		}
		return message;
	}
	
	/*
	 * 注销
	 * */
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index";
	}
}
