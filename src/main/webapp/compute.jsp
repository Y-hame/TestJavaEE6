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
  // ��ȡ�� number.jsp ���ݹ���������ֵ
  String numberStr = request.getParameter("number");
  int number = 0, temp = 1;

  try {
    // ��������ַ���ת��Ϊ����
    number = Integer.parseInt(numberStr);

    // ����׳�
    if (number > 0) {
      for (int i = 1; i <= number; i++) {
        temp *= i;
      }
      out.print("���������Ľ׳�Ϊ: " + temp);
    } else {
      out.print("������һ������0��������!");
    }
  } catch (NumberFormatException e) {
    out.print("������Ч��������һ����Ч������!");
  }
%>
</body>
</html>
