<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        body{
            background:url(./images/3.jpg) top left;
            background-size:100%;
        }
    </style>

    <link href="login_css.css" type="text/css" rel="stylesheet">
</head>
<body>
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
    //以上为每个模块的公操作
    /*    try{
          Connection conn = DriverManager.getConnection(url , "root","root" ) ;
          System.out.println("111！");
     }catch(SQLException se){
          System.out.println("数据库连接失败！");
          se.printStackTrace() ;
     }*/
%>
<%
    Connection conn = DriverManager.getConnection(url , "root","root" ) ;
    String sql="Insert into info(id,username,userpwd,userbirthday,sex,otherinfo) values(?,?,?,?,?,?)";
    PreparedStatement  pstmt= conn.prepareStatement(sql);

    request.setCharacterEncoding("UTF-8");//设置字符编码，避免出现乱码

    int id=Integer.parseInt(request.getParameter("id"));
    String username=request.getParameter("username").trim();
    String userpwd=request.getParameter("userpwd").trim();
    String sex=request.getParameter("sex").trim();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");//日期格式可以在这里改
    String aa=request.getParameter("userbirthday").trim();

    Date utilDate=df.parse((aa));
    java.sql.Date userbirthday = new java.sql.Date(utilDate.getTime());

    String otherinfo=request.getParameter("info").trim();

    pstmt.setInt(1,id);
    pstmt.setString(2,username);
    pstmt.setString(3,userpwd);
    pstmt.setDate(4,userbirthday);
    pstmt.setString(5,sex);
    pstmt.setString(6,otherinfo);

    try{
        int n=pstmt.executeUpdate();
        if(n==1){
//            System.out.println("111！");
%>
<script language="javascript">
    alert("注册成功请重新登录");
    location.href="login.jsp";
</script>

<%--跳转登录register--%>
<%}
else{%>
<script language="javascript">
    alert("插入失败");
</script>
<%}
}catch(Exception e){%>
更新过程出现异常错误！<br>
<%=e.getMessage()%>
<%;
}
    if(pstmt!=null){
        pstmt.close();
    }
    if(conn!=null){
        conn.close();
    }
%>
</body>
</html>