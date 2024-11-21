package com.testjavaee6;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DatabaseTest {
    private static final String URL = "jdbc:mysql://localhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root"; // 数据库用户名
    private static final String PASSWORD = "123456"; // 数据库密码

    public static void main(String[] args) {
        DatabaseTest dbTest = new DatabaseTest();

        // 查询所有姓张的男同学
        List<String> studentsWithZhang = dbTest.queryStudentsByNameAndSex("张", "M");
        System.out.println("姓张的男同学: " + studentsWithZhang);

        // 查询所有姓张的学生
        List<String> allStudentsWithZhang = dbTest.queryStudentsByName("张");
        System.out.println("所有姓张的学生: " + allStudentsWithZhang);

        // 查询特定年级的所有男同学
        List<String> sophomoreBoys = dbTest.queryStudentsByGradeAndSex("大二", "M");
        System.out.println("大二男同学: " + sophomoreBoys);

        // 其他查询示例可以在这里添加
    }

    // 查询所有姓特定字的特定性别学生
    public List<String> queryStudentsByNameAndSex(String namePrefix, String sex) {
        List<String> students = new ArrayList<>();
        String sql = "SELECT * FROM students WHERE name LIKE ? AND sex = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, namePrefix + "%");
            pstmt.setString(2, sex);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                students.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // 查询所有姓特定字的学生
    public List<String> queryStudentsByName(String namePrefix) {
        List<String> students = new ArrayList<>();
        String sql = "SELECT * FROM students WHERE name LIKE ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, namePrefix + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                students.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // 查询特定年级和性别的学生
    public List<String> queryStudentsByGradeAndSex(String grade, String sex) {
        List<String> students = new ArrayList<>();
        String sql = "SELECT * FROM students WHERE grade = ? AND sex = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, grade);
            pstmt.setString(2, sex);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                students.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // 其他查询方法可以在这里添加
}
