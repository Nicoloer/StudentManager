<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/29
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style type="text/css">
        body
        {
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>
    <link href="login_css.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="11.js" charset="utf-8"></script>
</head>

<body>

<h2 align="center">用户登录</h2><br>
<form action="logincheck.jsp"  method="post">
<table align="center" bgcolor="#d3d3d3">

    <tr><td ><b>账号： </b></td><td><input type="text" name="login_id" /></td></tr>
    <tr><td ><b>密码： </b></td><td><input type="password" name="login_userpwd"  /></td></tr>
    <tr><td align="center"  colspan=3><input type="button"   value="登录" onclick="form_submit()"></td></tr>
    <tr><td align="center" colspan="3" ><input type="button" value="还没有账号去注册" onclick="window.location.href='register.jsp'"></td></tr>
</table>
</form>
<!--连接数据库查询该账号是否存在，若不存在跳转注册（alert&&跳转login_2），若存在跳转个人主页-->


</body>

</html>