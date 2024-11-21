<%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/10/31
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.*" %>

<%
    String action = request.getParameter("action");

    // 连接数据库
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee", "root", "123456");

        if ("add".equals(action)) {
            // 添加记录
            String no = request.getParameter("no");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String birthday = request.getParameter("birthday");
            String grade = request.getParameter("grade");
            String major = request.getParameter("major");
            String phone = request.getParameter("phone");

            String sql = "INSERT INTO students (no, name, sex, birthday, grade, major, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);
            pstmt.setString(2, name);
            pstmt.setString(3, sex);
            pstmt.setDate(4, Date.valueOf(birthday));
            pstmt.setString(5, grade);
            pstmt.setString(6, major);
            pstmt.setString(7, phone);
            pstmt.executeUpdate();
        } else if ("query".equals(action)) {
            // 查询记录
            String sql = "SELECT * FROM students";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                out.println("Name: " + rs.getString("name") + "<br>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
