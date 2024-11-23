<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/table.css">
</head>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url,username,password;
url = "jdbc:mysql://localhost:3306/zby?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
username = "root";
password = "123456";
String[] title = {"学号","姓名","性别","出生日期","专业","年级","联系电话"};
String[] field = {"no","name","sex","birthday","major","grade","phone"};
Connection conn;
Statement stmt;
ResultSet rs;
String sql;
conn = DriverManager.getConnection(url,username,password);
stmt = conn.createStatement();
sql="select * from stu";
rs = stmt.executeQuery(sql);

out.println("<table border=1 align=center width=800>");
out.println("<tr>");
//out.println("<th>学号</th><th>姓名</th><th>性别</th><th>出生日期</th>");
//out.println("<th>专业</th><th>年级</th><th>联系电话</th>");
for(int j = 0; j < title.length; j++){
	out.println("<th>"+title[j]+"</th>");
}
out.println("</tr>");
while(rs.next()){
	out.println("<tr>");
	/*
	out.println("<td>"+rs.getString("no")+"</td>");
	out.println("<td>"+rs.getString("name")+"</td>");
	out.println("<td>"+rs.getString("sex")+"</td>");
	out.println("<td>"+rs.getString("birthday")+"</td>");
	out.println("<td>"+rs.getString("major")+"</td>");
	out.println("<td>"+rs.getString("grade")+"</td>");
	out.println("<td>"+rs.getString("phone")+"</td>");	
	*/
	//for(int j = 2; j <9; j++ ){
		//out.println("<td>"+rs.getString(j)+"</td>");
	//}
	for(int j = 0; j < field.length; j++){
		out.println("<td>"+rs.getString(field[j])+"</td>");
	}
	out.println("</tr>");
}
out.println("</table>");
rs.close();
stmt.close();
conn.close();

%>

</body>
</html>