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
    String no,name,sex,birthday,grade,major,phone;
    no = request.getParameter("no")==null ?"" : request.getParameter("no");
    name = request.getParameter("name")==null ?"" : request.getParameter("name");
    sex = request.getParameter("sex")==null ?"" : request.getParameter("sex");
    birthday = request.getParameter("birthday")==null ?"" : request.getParameter("birthday");
    grade = request.getParameter("grade")==null ?"" : request.getParameter("grade");
    major = request.getParameter("major")==null ?"" : request.getParameter("major");
    phone = request.getParameter("phone")==null ?"" : request.getParameter("phone");
    try {

    //数据库的驱动
        Class.forName("com.mysql.cj.jdbc.Driver");
    //
    String url ="jdbc:mysql://localhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String username ="root";
    String password ="123456";
    //建立数据库连接
        Connection connection= null;
            connection = DriverManager.getConnection(url,username,password);


        String sql ="insert  into student(no,name,sex,birthday,grade,major,phone) values(?,?,?,?,?,?,?)";

    //创建SQL运行的对象
        PreparedStatement ps = null;
            ps = connection.prepareStatement(sql);


        ps.setString(1,no);
        ps.setString(2,name);
        ps.setString(3,sex);
        ps.setDate(4, Date.valueOf(birthday));  //  这里使用String不行 日期格式
        ps.setString(5,grade);
        ps.setString(6,major);
        ps.setString(7,phone);


        //更新数据
        int rows = 0;   //将结果转换为int rows
            rows = ps.executeUpdate();


        if(rows > 0 ){
            //添加成功，设置成功标志
            request.setAttribute("massage","添加成功");
            //跳转到 输出界面
            response.sendRedirect("out8.jsp");
        }
        //关闭资源

        ps.close();
        connection.close();



    } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
    }
%>

</body>
</html>
