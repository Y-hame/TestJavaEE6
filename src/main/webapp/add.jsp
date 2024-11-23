<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String no,name,sex,birthday,major,grade,phone;
no = request.getParameter("no")==null?"":request.getParameter("no");
name = request.getParameter("name")==null?"":request.getParameter("name");
sex = request.getParameter("sex")==null?"":request.getParameter("sex");
birthday = request.getParameter("birthday")==null?"":request.getParameter("birthday");
major = request.getParameter("major")==null?"":request.getParameter("major");
grade = request.getParameter("grade")==null?"":request.getParameter("grade");
phone = request.getParameter("phone")==null?"":request.getParameter("phone");

//out.println(no+" "+name+" "+sex+" "+birthday+" "+major+" "+grade+" "+phone);

Class.forName("com.mysql.cj.jdbc.Driver");
String url,username,password;
url = "jdbc:mysql://localhost:3306/zby?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
username = "root";
password = "123456";
Connection conn;
//Statement stmt;
String sql;
conn = DriverManager.getConnection(url,username,password);
/*
stmt = conn.createStatement();
sql="insert into stu(no,name,sex,birthday,major,grade,phone) ";
sql+="values('"+no+"','"+name+"','"+sex+"','"+birthday+"','";
sql += major + "','"+ grade + "','" + phone+ "')";

stmt.executeUpdate(sql);
*/
PreparedStatement stmt;
sql="insert into stu(no,name,sex,birthday,major,grade,phone) ";
sql+="values(?,?,?,?,?,?,?)";
stmt = conn.prepareStatement(sql);
stmt.setString(1,no);
stmt.setString(2,name);
stmt.setString(3,sex);
stmt.setString(4,birthday);
stmt.setString(5,major);
stmt.setString(6,grade);
stmt.setString(7,phone);
stmt.executeUpdate();

out.println("数据已经成功添加到数据库中。");


%>

</body>
</html>