<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script language="JavaScript" src="register_check.js" charset="utf-8"></script>
    <meta charset="UTF-8">
    <title>注册界面2</title>

    <style type="text/css">
        body{
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>
    <link href="login_css.css" type="text/css" rel="stylesheet">


</head>

<body>
<h1 align="center">信息注册</h1>
<br>
<form action="insert.jsp" method="post">

    <table align="center" bgcolor="#d3d3d3">

        <tr>
            <td class="i"><b>账号： </b></td>
            <td align="left"><input type="text" name="id" /></td>
            <td class="tip">账号为数字 8~16位</td>
        </tr>

        <tr>
            <td class="i"><b>姓   名： </b></td>
            <td align="left"><input type="text" name="username" /></td>
            <td class="tip">请输入中文姓名</td>
        </tr>


        <tr>
            <td class="i"><b>性   别： </b></td>
            <td>
                <input type="radio" name="sex" value="male"/>男
                <input type="radio" name="sex" value="female"/>女
            </td>
        </tr>

        <tr>
            <td class="i"><b>出生日期：</b></td>
            <td ><input type="text" name="userbirthday" /></td>
            <td class="tip">(如格式：2000-01-01)</td>
        </tr>

        <tr>
            <td class="i"><b>个人介绍：</b></td>
            <td colspan="2"><textarea name="info" rows="4" cols="30"></textarea></td>
        </tr>

        <tr class="i"><td ><b>设置密码： </b></td>
            <td><input type="password" placeholder="请输入密码"  name="userpwd" id="pwd1" /></td>
            <td class="tip">设置密码 中英混合 至少六位</td>
        </tr>

        <tr class="i"><td ><b>再次输入： </b></td>
            <td><input type="password" placeholder="请再次输入密码" name="userpwd1"  id="pwd2" /></td>
            <td class="tip">请确保两次输入一致</td>
        </tr>

        <!-- id作为唯一标识 -->
        <!-- placeholder设置默认提示 --输入字段预期值的提示信息-->

        <tr></tr>
        <tr></tr>

        <tr><td colspan="3" align="center"><input type="checkbox" name="accept" value="yes"  />
            我已经仔细阅读并同意接受用户使用协议</td></tr>

        <!-- 在提交按钮增加点击事件 -->

        <tr ><td align="center" colspan="3" ><input type="button" value="登录" onclick="functi()"></td></tr>
        <tr ><td align="center" colspan="3"><input type="reset"  name="reset"   value="取消"/></td></tr>

    </table>
</form>
</body>
</html>















