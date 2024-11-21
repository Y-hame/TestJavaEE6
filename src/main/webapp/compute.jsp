<%--
  Created by IntelliJ IDEA.
  User: Hame
  Date: 2024/11/18
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
  <title>Compute N!</title>
</head>
<body>
<%
  // 获取从 number.jsp 传递过来的输入值
  String numberStr = request.getParameter("number");
  int number = 0, temp = 1;

  try {
    // 将输入的字符串转换为整数
    number = Integer.parseInt(numberStr);

    // 计算阶乘
    if (number > 0) {
      for (int i = 1; i <= number; i++) {
        temp *= i;
      }
      out.print("您输入数的阶乘为: " + temp);
    } else {
      out.print("请输入一个大于0的正整数!");
    }
  } catch (NumberFormatException e) {
    out.print("输入无效，请输入一个有效的整数!");
  }
%>
</body>
</html>
