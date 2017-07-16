<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>博客 - 登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" >
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

    <!--[if lte IE 9]>
        <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/custom.modernizr.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script>
    $(function(){
    	 $(".submit").click(function(){
        	 $.ajax({
                 type: "POST",
                 url: "/Blog/loginAction",
                 data: {
                	account:$("#account").val(),
         	    	passWord:$("#passWord").val()
                 },
                 dataType: "json",
                 success: function(data){  
                	 if(data.loginMessage=="正确"){
                		 //重定向
                		 window.location.href="index";
                	 }else{
                		 alert(data.loginMessage);
                		 console.log(data); 
                	 }                	 
                 }
              });
        	});	      	 
    	});
   
    </script>
    
</head>
<body>
    <div class="wrap">
    <%@ include file="header.jsp"%>
    
    <div class="content">
        <div class="content-box">
            <h1>登录</h1>
            <form id="login" >
                <input class="text" type="text" id="account" name="account" placeholder="用户账号" required>
                <input class="text" type="password" id="passWord" name="passWord" placeholder="用户密码" required>
                <input type="hidden" name="eMail" value="142544">
                <input type="button" class="submit" value="登录">
                <p class="help-text"></p>
            </form>
        </div>
    </div>
    </div>
</body>
</html>