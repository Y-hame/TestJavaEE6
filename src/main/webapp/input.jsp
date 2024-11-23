<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>请输入学生基本信息:</h2>
<form action="add.jsp" method="get">  
<p>学号：<input type="text" name="no"/>
<p>姓名：<input type="text" name="name"/> 
<p>性别：男<input type="radio" name="sex" value="m" checked/>
       女<input type="radio" name="sex" value="f"/>
<p>出生日期：<input type="text" name="birthday"/>
<p>专业：<input type="text" name="major"/>   
<p>年级：<input type="text" name="grade"/>  
<p>电话号码：<input type="text" name="phone"/>
<p>
   <input type="submit" value="提交"/>
   <input type="reset" value="重写"/>
</form>

</body>
</html>