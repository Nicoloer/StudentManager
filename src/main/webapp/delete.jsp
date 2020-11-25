<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/28
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    //以上为每个模块的公操作
    Connection conn=DriverManager.getConnection(url,"root","root");
    Statement stmt=conn.createStatement();
    request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码
%>
<%
    //查询账号为XX的用户信息
    int reflectid= (int) session.getAttribute("key");
    System.out.println(session.getAttribute("key"));
    String sql="delete from info where id=?";
    PreparedStatement  pstmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    pstmt.setInt(1,reflectid);
    try{
        int n=pstmt.executeUpdate();
        if(n>=1){%>
数据删除操作成功！<br>
<%}
else{%>
数据删除操作失败！<br>
<%}
}catch(Exception e){%>
删除更新过程出现异常错误！<br>
<%=e.getMessage()%>
<%
    }
    if(stmt!=null){ stmt.close(); }
    if(conn!=null){ conn.close(); }
%>
</body>
</html>
