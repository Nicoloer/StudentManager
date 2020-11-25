<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/28
  Time: 22:07
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
<%    try{//加载MySql的驱动类
    Class.forName("com.mysql.jdbc.Driver") ;
}catch(ClassNotFoundException e){
    System.out.println("找不到驱动程序类 ，加载驱动失败！");
    e.printStackTrace() ;
}     %>
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
    //String sex=request.getParameter("sex");
    int nowid=Integer.parseInt(request.getParameter("nowid"));
    String sql="select id from info where id==? ";
    PreparedStatement  pstmt= conn.prepareStatement(sql);
    pstmt.setInt(1,nowid);
    ResultSet rs=pstmt.executeQuery();//得到查询集合
%>
<table border="2" bgcolor= "ccceee" width="650" align="center">
    <tr bgcolor="CCCCCC" align="center">
        <td>记录条数</td> <td>账号</td> <td>姓名</td> <td>性别</td> <td>出生日期</td> <td>其他</td>
    </tr>
    <% rs.beforeFirst(); //移至第一条记录之前
        while(rs.next()){
    %>   <tr align="center">
    <td><%= rs.getRow()%></td>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("sex") %></td>
    <td><%= rs.getDate("userbirthday") %></td>
    <td><%= rs.getString("otherinfo") %></td>

</tr>
    <% }%>
</table>
</center>
<%if(rs!=null){ rs.close(); }
    if(pstmt!=null){ pstmt.close(); }
    if(conn!=null){ conn.close(); }
%>
</body>
</html>
