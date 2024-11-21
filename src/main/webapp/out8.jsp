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
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url ="jdbc:mysql://locallhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String username ="root";
    String password ="123456";
    //建立数据库连接
    Connection connection;

    try {
        connection= DriverManager.getConnection(url,username,password);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    //创建SQL执行对象
    Statement st;
    try {
        st = connection.createStatement();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    String sql ="SELECT  *  from  student";
    //执行SQL
    ResultSet rs;
    rs =st.executeQuery(sql);

    //创建一个数组存放 学生属性
    String [] title ={ "学号","姓名","性别","出生日期","专业","年级","联系电话"};
    String [] feild ={ "no","name","sex","birthday","major","grade","phone" };
    //显示数据库数据
    out.println("<table border =1>");
    out.println("<tr>");
    //输出表头
    for(int i = 2; i <=title.length;i++){
        out.println("<th>"+title[i] +"</th>");
    }
    out.println("</tr>");

    //输出数据库的内容
    while (rs.next()){
        for(int j= 1; j<=feild.length;j++){
            out.println("<td>"+feild[j]+"</td>");
        }

    }
    out.println("</table>");
    rs.close();
    st.close();

    connection.close();
%>

</body>
</html>
