<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/28
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        body{
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>
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
    Connection conn = DriverManager.getConnection(url , "root","root" ) ;
    request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码
    //以上为每个模块的公操作
%>
<%
    request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码
    String sql="update info set username=?,userbirthday=?,sex=?,otherinfo=? where id=?";
    PreparedStatement pstmt= conn.prepareStatement(sql);

    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");//日期格式可以在这里改
    String aa=request.getParameter("userbirthday").trim();
    Date utilDate=df.parse((aa));
    java.sql.Date userbirthday = new java.sql.Date(utilDate.getTime());

    String info=request.getParameter("info").trim();
    String name=request.getParameter("username").trim();
    String sex=request.getParameter("sex").trim();
    int id=(int) session.getAttribute("key");
    pstmt.setString(1,name);
    pstmt.setDate(2,userbirthday);
    pstmt.setString(3,sex);
    pstmt.setString(4,info);
    pstmt.setInt(5,id);
    try{
        int n=pstmt.executeUpdate();
        if(n>=1){%>
<script language="javascript">
    alert("信息修改成功！");
    location.href="personalcenter.jsp";
</script>
<%}
else{%>
<script language="javascript">
    alert("信息修改失败！");
</script>
<%}
}catch(Exception e){%>
重写过程出现异常错误！<br>
<%=e.getMessage()%>
<%
    }
    if(pstmt!=null){ pstmt.close(); }
    if(conn!=null){ conn.close(); }
%>
</body>
</html>
