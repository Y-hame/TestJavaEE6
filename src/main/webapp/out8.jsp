<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/21
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输出</title>
</head>
<body>

<%
    //注册驱动
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");


    String url ="jdbc:mysql://localhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String username ="root";
    String password ="123456";
    //建立数据库连接
    Connection connection = DriverManager.getConnection(url,username,password);
        //创建SQL执行对象
    Statement st = connection.createStatement();
    String sql ="SELECT  *  from  student";
    //执行SQL
    ResultSet rs =st.executeQuery(sql);

    //创建一个数组存放 学生属性
    String [] title ={ "学号","姓名","性别","出生日期","专业","年级","联系电话"};
    String [] feild ={ "no","name","sex","birthday","major","grade","phone" };

    //显示数据库数据
    out.println("<table border =1 >");

    out.println("<tr>");
    //输出表头
    for(int i = 0; i < title.length;i++){
        out.println("<th>"+title[i] +"</th>");
        }
    out.println("</tr>");

        // 输出数据库的内容
        while (rs.next()) {
            out.println("<tr>");
            for (int j = 0; j < feild.length; j++) {
                out.println("<td>" + rs.getString(feild[j]) + "</td>");
            }
            out.println("</tr>");
        }
    out.println("</table>");

            rs.close();
            st.close();
            connection.close();

    } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
    }
%>

</body>
</html>
