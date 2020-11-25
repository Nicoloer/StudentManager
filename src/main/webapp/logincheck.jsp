<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/10/29
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>logincheck</title>
</head>
<body>
<!--连接数据库查询该账号是否存在，若不存在跳转注册（alert&&跳转register），若存在跳转个人主页-->
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
    int nowid=Integer.parseInt(request.getParameter("login_id"));
    String sql="select id,userpwd from info where id=?";
    PreparedStatement  pstmt= conn.prepareStatement(sql);
    pstmt.setInt(1,nowid);
    ResultSet rs=pstmt.executeQuery();//得到查询集合
%>
    <%--判断账号是否存在 若存在则判断密码 若不存在空 则注册--%>
    <%
//        try{
            //不存在则注册
        if(!rs.next()){
            System.out.println("111！");
        %>
            <script language="javascript">
                alert("该账号尚未注册请先注册!");
            <%--    <jsp:forward page="register.jsp" />--%>
                location.href="register.jsp";
            </script>
         <%}
            else {
                String pwd=request.getParameter("login_userpwd");
                if(pwd.equals(rs.getString("userpwd"))){
                    session.setAttribute("key",nowid);
         %>
                    <script language="javascript">
                        alert("正在跳转到个人中心...");
                        location.href="personalcenter.jsp";
                    </script>
                    <%}
                else{%>
                <script language="javascript">
                    alert("密码错误请重新登录！");
                    location.href="login.jsp";
                </script>
                <%System.out.println("密码不一致重新登录");}
                }
                %>
//        }
//        catch(Exception e){%>
<%--//        登录过程出现异常错误！<br>--%>
<%--//        <%=e.getMessage()%>--%>
<%--//        <%}--%>

   <%
    if(rs!=null)   { rs.close(); }
    if(pstmt!=null){ pstmt.close(); }
    if(conn!=null){ conn.close(); }

   %>

</body>
</html>
