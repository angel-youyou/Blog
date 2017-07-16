<?xml version="1.0" encoding="utf-8" ?>
<%@page import="com.manager.bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="page-header">
	<div class="header-in">
		<div class="logo"></div>
		<nav>
			<a href="index">首页</a>
			<a href="index">最新的文章</a>
		</nav>
		
		<span class="nav-btns">
		<%
			User userHead =new User();
			userHead=(User)session.getAttribute("user");//用户
			if(userHead==null  ){
		%>
			<a href="login">登录</a>
			<%}else{ %>
				<%if(userHead.getNickName()==null ||userHead.getNickName().isEmpty() ) {%>
				<span style="color:#fff;"><%=userHead.getAccount() %></span>
				<%} else{%>
					<span style="color:#fff;"><%=userHead.getNickName() %></span>
				<%} %>
			<a href="logout">退出</a> 
			<%} %>
		</span>
		<form class="search" action="search">
			<input type="search" class="search" name="search">
			<button class="btn-search"><i class="icon icon-search"></i></button>
		</form>
	</div>
</header>