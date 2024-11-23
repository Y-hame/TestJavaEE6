以下是该实验的 `README.md` 文件内容：

```markdown
# 学生信息管理实验
   jsp 分别为input8.jsp, add.jsp, out.jsp 内容有待添加  ，可能会以MVC的模式实现相应的Manager System
            其中input.jsp, add.jsp 和out.jsp 也有相同的实现功能
## 实验目的

- 掌握在 JSP 中访问数据库的方法。
- 学会通过表单提交数据到后台，并将数据存储到数据库中。
- 熟悉如何通过 JSP 输出数据库中的数据。

## 实验内容

本实验实现了一个简单的学生信息管理系统，用户可以通过表单输入学生的基本信息，然后将这些信息存储到 MySQL 数据库中。之后，用户可以查看所有存储在数据库中的学生信息。

## 文件结构

```
/input8.jsp        // 输入学生信息的表单页面
/add8.jsp          // 处理表单数据并插入到数据库的 JSP 页面
/out8.jsp          // 从数据库中查询学生信息并输出的页面
```

## 1. 输入学生信息的表单 (input8.jsp)

该页面展示一个学生信息表单，用户可以输入学生的学号、姓名、性别、出生日期、年级、专业和联系电话等信息。数据通过 POST 方法提交到 `add8.jsp` 页面。

```jsp
<form action="add8.jsp" method="post">
    <p>学号：<input type="text" name="no" ></p>
    <p>姓名：<input type="text" name="name" ></p>
    <p>性别：<input type="radio" name="sex" value="男" >男 <input type="radio" name="sex" value="女" >女 </p>
    <p>出生日期：<input type="date" name="birthday"></p>
    <p>年级：<input type="text" name="grade"></p>
    <p>专业：<input type="text" name="major"></p>
    <p>电话：<input type="text" name="phone"></p>
    <input type="submit" value="提交">
    <input type="reset" value="重置">
</form>
```

## 2. 数据处理与插入 (add8.jsp)

该页面从表单接收数据并将其插入到数据库中的 `student` 表。使用 `PreparedStatement` 防止 SQL 注入攻击。

```jsp
String sql = "INSERT INTO student(no, name, sex, birthday, grade, major, phone) VALUES(?,?,?,?,?,?,?)";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setString(1, no);
ps.setString(2, name);
ps.setString(3, sex);
ps.setDate(4, Date.valueOf(birthday)); // 将 String 转换为 Date
ps.setString(5, grade);
ps.setString(6, major);
ps.setString(7, phone);
int rows = ps.executeUpdate();
if (rows > 0) {
    response.sendRedirect("out8.jsp"); // 数据插入成功，跳转到查询页面
}
```

## 3. 查询并输出学生信息 (out8.jsp)

该页面从数据库查询所有学生的信息，并通过动态生成的 HTML 表格将查询结果输出。

```jsp
ResultSet rs = st.executeQuery("SELECT * FROM student");
while (rs.next()) {
    out.println("<tr>");
    out.println("<td>" + rs.getString("no") + "</td>");
    out.println("<td>" + rs.getString("name") + "</td>");
    out.println("<td>" + rs.getString("sex") + "</td>");
    out.println("<td>" + rs.getDate("birthday") + "</td>");
    out.println("<td>" + rs.getString("major") + "</td>");
    out.println("<td>" + rs.getString("grade") + "</td>");
    out.println("<td>" + rs.getString("phone") + "</td>");
    out.println("</tr>");
}
```

## 实验结果与分析

1. **输入页面 (`input8.jsp`)**
    - 该页面成功地展示了一个学生信息表单，用户可以输入学生的学号、姓名、性别、出生日期、年级、专业和电话等信息。
    - 提交表单后，数据通过 POST 方法传送到 `add8.jsp` 页面。

2. **数据处理与插入页面 (`add8.jsp`)**
    - 输入的数据成功地插入到数据库中的 `student` 表。
    - 通过 `PreparedStatement` 防止了 SQL 注入问题。
    - 数据插入后，页面通过 `response.sendRedirect("out8.jsp");` 跳转到输出页面。

3. **输出页面 (`out8.jsp`)**
    - 从数据库中查询所有学生的信息，并通过动态生成的 HTML 表格展示。
    - 查询的每一行数据都对应一个学生的详细信息，包括学号、姓名、性别、出生日期、年级、专业和电话。

## 遇到的问题与解决方案

1. **问题**：在 `add8.jsp` 页面插入数据时，如果日期格式不正确，可能会导致插入失败。  
   **解决方案**：确保日期字段使用 `Date.valueOf(birthday)` 方法正确转换。

2. **问题**：表单提交后，输入的数据可能包含空值或特殊字符。  
   **解决方案**：对用户输入进行验证，确保所有必填字段都有值，并对输入进行过滤或转义。

## 实验总结

1. **实验收获**
    - 通过本次实验，我掌握了如何在 JSP 页面中连接数据库，执行 SQL 插入操作以及如何展示查询结果。
    - 理解了 `PreparedStatement` 在防止 SQL 注入方面的作用。
    - 学会了如何通过表单接收用户输入并将其保存到数据库中。

2. **不足与改进**
    - 本实验中的数据验证和错误处理较为简单，实际应用中应加强用户输入的校验与异常处理。
    - 可以进一步学习如何通过 MVC 模式进行代码的组织，分离数据库操作与页面逻辑。

3. **未来展望**
    - 在今后的学习中，我将继续深入理解数据库操作的优化方法，并学习如何在更复杂的 Web 应用中管理数据库连接，提升代码的可维护性。

---

## 参考资料

- [JSP and JDBC](https://docs.oracle.com/javaee/7/tutorial/jdbc.htm)
- [MySQL JDBC Driver](https://dev.mysql.com/downloads/connector/j/)

```

这个 `README.md` 文件包含了该实验的详细内容，包括实验目的、步骤、代码示例、实验结果与总结等信息，适合作为实验文档或者项目的说明文档。