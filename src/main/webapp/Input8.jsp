<%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/21
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息输入</title>
</head>
<body>
<form action="add8.jsp" method="post">
    <p>学号：<input type="text" name="no" ></p>
    <p>姓名：<input type="text" name="name" ></p>
    <p>性别：<input type="radio" name="sex" value="男" >男 <input type="radio" name="sex" value="女" >女  </p>
    <p>出生日期：<input type="date" name="birthday"></p>
    <p>年级：<input type="text" name="grade"></p>
    <p>专业：<input type="text" name="major"></p>
    <p>电话：<input type="text" name="phone"></p>
    <input type="submit" value="提交">
    <input type="reset" value="重置">


</form>

</body>
</html>
