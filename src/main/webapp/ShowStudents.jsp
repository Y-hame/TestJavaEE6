<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/7
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示学生表的数据</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 加载 MySQL 驱动
        String url = "jdbc:mysql://localhost:3306/javaee?characterEncoding=UTF-8&serverTimezone=GMT%2B8";
        String username = "root";  // 数据库用户名
        String password = "123456";  // 数据库密码

        // 获取数据库连接
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        //SQL查询语句
        String sql = "SELECT * FROM student";
        Statement statement = null;
        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        //输出表格的表头
    out.println("<table width ='800' boder = '1' align ='center'>");
    out.println("<tr>");
    out.println("<td>学号</td>");
    out.println("<td>姓名</td>");
    out.println("<td>性别</td>");
    out.println("<td>生日</td>");
    out.println("<td>年级</td>");
    out.println("<td>专业</td>");
    out.println("<td>电话</td>");
    out.println("</tr>");
    while (true){
        try {
            if (!resultSet.next()) break;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        out.println("<tr>");
        try {
            out.println("<td>"+resultSet.getString("no") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("name") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("sex") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("birthday") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("grade") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("major") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            out.println("<td>"+resultSet.getString("phone") + "</td>");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        out.println("</tr>");

    }
    out.println("</table>");

    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

//
//    （2）
//    DriverManager.getConnection(“URL”, ”Username”, ”Password”);
//    （3）创建Statement 对象
//    <Connection 对象>.createStatement();
//    （4）执行SQL语句
//    <Statement 对象>.executeQuery(“查询语句”);
//    <Statement 对象>.executeUpdate(“修改语句”);
//    （5）处理返回数据
//    （6）释放对象和数据库连接
%>

</body>
</html>
