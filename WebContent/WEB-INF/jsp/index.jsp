<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.manager.bean.Article"%>
<%@page import="com.manager.bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mine-article.css">	
</head>
<body>
	<div class="wrap">
		<%@ include file="header.jsp"%>
			<%
			  String message=(String)request.getAttribute("message");
			  List<Article> articleItem=new ArrayList<Article>();
			  articleItem=(List)request.getAttribute("articleItemForIndex");//文章list
			  List<User> userItem=new ArrayList<User>();//作者list
			  userItem=(List)request.getAttribute("userIdexItem");
			  Article article=new Article();
			  User user = new User();
			  int size=articleItem.size();
			  if(size>15){
				size=15;
			  }
		   %>
		<div class="main">
		<h1>最新的文章</h1>
		
		<ul>
		<%
		 for(int i=0 ;i<size;i++ ){
			article=articleItem.get(i);
	    %>
		<li class="article">
		 <div class="top">
			<div class="top-right">
			  <div class="nickname">
				<%
					for(int j = 0;j<userItem.size();j++ ){
									user=userItem.get(j);
				%>
				<%	break;} %>
			  </div>
			  <div class="time"><%=article.getUpdateTime().substring(0, 19) %></div>
			</div>
		</div>
		<h2 class="title"><a href="articleViewForVisitor?id=<%=article.getId() %>"><%=article.getContent() %></a></h2>
	 </li>
	 <%} %>	
	 </ul>
   </div>
  </div>
</body>
</html>