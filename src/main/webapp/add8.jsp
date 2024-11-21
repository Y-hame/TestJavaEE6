<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/21
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String no,name,sex,bithday,grade,major,phone;
    no = request.getParameter("no")==null ?"" : request.getParameter("no");
    name = request.getParameter("name")==null ?"" : request.getParameter("name");
    sex = request.getParameter("sex")==null ?"" : request.getParameter("sex");
    bithday = request.getParameter("birthday")==null ?"" : request.getParameter("birthday");
    grade = request.getParameter("grade")==null ?"" : request.getParameter("grade");
    major = request.getParameter("major")==null ?"" : request.getParameter("major");
    phone = request.getParameter("phone")==null ?"" : request.getParameter("phone");

    //数据库的驱动
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    //
    String url ="jdbc:mysql://locallhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String username ="root";
    String password ="123456";
    //建立数据库连接
    Connection connection;

    try {
        connection=DriverManager.getConnection(url,username,password);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }


    String sql ="insert  into student(no,name,sex,bithday,grade,major,phone) values(?,?,?,?,?,?,?)";
    //创建SQL运行的对象
    PreparedStatement ps;
    //执行sql
    try {
        ps = connection.prepareStatement(sql);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    try {
        ps.setString(1,no);

    ps.setString(2,name);
    ps.setString(3,sex);
    ps.setString(4,bithday);
    ps.setString(5,grade);
    ps.setString(6,major);
    ps.setString(7,phone);
    //更新数据
    ps.executeUpdate();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    out.println("数据库添加成功");
%>

</body>
</html>
