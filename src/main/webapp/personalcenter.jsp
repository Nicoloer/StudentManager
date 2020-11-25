<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息界面</title>
    <style type="text/css">
        body{
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>
    <script language="javascript">
        function leave() {
            alert("您已安全退出！");
            location.href = "login.jsp";
        }
        function del() {
            alert("您已注销！");
            location.href = "delete.jsp";
        }
    </script>
    }
</head>
<body>
<%
    String driverName = "com.mysql.jdbc.Driver";         //驱动程序名
    String userName = "root";                            //数据库用户名
    String userPwd = "root";                             //密码
    String dbName = "loginfo";                          //数据库名
    //形成数据库连接字
    String  url1="jdbc:mysql://localhost:3306/"+dbName+"?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String url2="&user="+userName+"&password="+userPwd;
    String url=url1+url2;
    Class.forName(driverName);//加载并注册驱动程序
    Connection conn = DriverManager.getConnection(url , "root","root" ) ;
    request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码
    //以上为每个模块的公操作
%>
<%
    //查询账号为XX的用户信息
    int reflectid= (int) session.getAttribute("key");
    System.out.println(session.getAttribute("key"));
    String sql="select id,username,sex,userbirthday,otherinfo from info where id=?";
    PreparedStatement  pstmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    pstmt.setInt(1,reflectid);
    ResultSet rs=pstmt.executeQuery();//得到查询集合
%>

<h1 align="center">个人中心</h1>
<table BGCOLOR="#d3d3d3" width="650" align="center">
<%--    <tr bgcolor="CCCCCC" align="center">--%>
        <% rs.beforeFirst(); //移至第一条记录之前
            while(rs.next()){
                session.setAttribute("currentname",rs.getString("username"));
                session.setAttribute("currentsex",rs.getString("sex"));
                session.setAttribute("currentbirthday",rs.getDate("userbirthday"));
                session.setAttribute("currentinfo",rs.getString("oTherinfo"));
        %>
    <tr>  <td>账号</td> <td><%= rs.getInt("id") %></td> </tr>
    <tr>  <td>姓名</td> <td><%= rs.getString("username") %></td> </tr>
    <tr>  <td>性别</td> <td><%= rs.getString("sex") %></td> </tr>
    <tr>  <td>出生日期</td>    <td><%= rs.getDate("userbirthday") %></td> </tr>
    <tr>  <td>其他</td><td><%= rs.getString("otherinfo") %></td> </tr>

    <tr ><td align="right" colspan="2" ><input type="button" value="修改个人资料" onclick="window.location.href='alter.jsp'"></td></tr>
    <tr>
        <td><input type="button" value="注销账户"  onclick="del()"></td>
        <td><input type="button"  name="submit"   value="安全退出" onclick="leave()">
        </td>

    </tr>
    <% }%>
</table>


<%  if(rs!=null){ rs.close(); }
    if(pstmt!=null){ pstmt.close(); }
    if(conn!=null){ conn.close(); }
%>

</body>
</html>