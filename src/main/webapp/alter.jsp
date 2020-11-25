<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改个人资料</title>

    <style type="text/css">
        body{
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>

    <link href="login_css.css" type="text/css" rel="stylesheet">

    <script language="javascript">
        function sex() {
            var rObj = document.getElementsByName("sex");
            var rValue =<%=session.getAttribute("currentsex")%>;
            for (var i = 0; i < rObj.length; i++) {
                if (rObj[i].value === rValue) {
                    rObj[i].checked = true;
                }
            }
        }

        function functi(){
            var name=document.forms[0].username.value;
            var birthday=document.forms[0].userbirthday.value;
            var reg3=/^(((?:19|20)\d\d)-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01]))$/;
            <!--reg3生日-->
            var reg4 = /[\u4e00-\u9fa5\u4dae\uE863]/;
            if(!reg4.test(name))
                alert("姓名格式错误");

            else if(!reg3.test(birthday))
                alert("出生年月请按2000-01-01格式输入");
            else
                document.forms[0].submit();
        }
    </script>
</head>

<body>
<h1 align="center">修改个人资料</h1>
<h3 align="center"><%=session.getAttribute("key")%></h3>
<br>
<form action="update.jsp" method="post"  >

    <table align="center" bgcolor="#d3d3d3">

        <tr>
            <td class="i"><b>姓   名： </b></td>
            <td align="left"><input type="text" name="username" value="<%=session.getAttribute("currentname")%>" /></td>
        </tr>


        <tr>
            <td class="i"><b>性   别： </b></td>
            <td>
                <input type="radio" name="sex" value="male" checked/>男
                <input type="radio" name="sex" value="female"/>女
            </td>

        </tr>

        <tr>
            <td class="i"><b>出生日期：</b></td>
            <td ><input type="text" name="userbirthday" value="<%=session.getAttribute("currentbirthday")%>"/></td>
            <td class="tip">(如格式：2000-01-01)</td>
        </tr>

        <tr>
            <td class="i"><b>个人介绍：</b></td>
            <td colspan="2">

                <textarea cols="30" name="info" rows="4"><%=session.getAttribute("currentinfo")%></textarea></td>
    </tr>

    <%--        <tr class="i"><td><b>设置密码： </b></td>--%>
<%--            <td><input type="password" placeholder="请输入密码" name="userpwd" id="pwd1"/></td>--%>
<%--            <td class="tip">设置密码，至少六位</td>--%>
<%--        </tr>--%>

<%--        <tr class="i"><td><b>再次输入： </b></td>--%>
<%--            <td><input type="password" placeholder="请再次输入密码" name="userpwd1" id="pwd2"/></td>--%>
<%--            <td class="tip">请确保两次输入一致</td>--%>
<%--        </tr>--%>

    <!-- id作为唯一标识 -->
    <!-- placeholder设置默认提示 --输入字段预期值的提示信息-->
    <!-- 在提交按钮增加点击事件 -->

        <tr><td align="center"  colspan="3"><input type="button" value="确认" onclick="functi()" ></td></tr>
        <tr ><td align="center" colspan="3"><input type="button"  value="取消" onclick="window.location.href='personalcenter.jsp'"/></td></tr>

    </table>
</form>
</body>
</html>















