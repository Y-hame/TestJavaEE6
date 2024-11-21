<%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/10/31
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.testjavaee6.DbUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    List<String> students = new ArrayList<>();
    try {
        Connection conn = DbUtil.getConnection();
        System.out.println("Database is connected.");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM student WHERE name LIKE '张%' AND sex = 'M'");

        while (rs.next()) {
            students.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>查询出错: " + e.getMessage() + "</h3>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>姓张的男同学</title>
</head>
<body>
<h2>姓张的男同学：</h2>
<ul>
    <% for (String student : students) { %>
    <li><%= student %></li>
    <% } %>
</ul>
</body>
</html>
