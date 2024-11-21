<%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/18
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType ="text/html;charset=UTF-8" import="com.testjavaee6.Counter" language="java" %>
<html>
<head>
    <title> logon page</title>
</head>
<body>
    <jsp:useBean id="counter" class="com.testjavaee6.Counter" scope="application"/>
    <%
        out.println("你是第" + counter.getCount(session)+"来访者" );
    %>


</body>
</html>
