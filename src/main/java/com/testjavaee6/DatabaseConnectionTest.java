 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionTest {
    private static final String URL = "jdbc:mysql://localhost:3306/javaee";
    private static final String USER = "root"; // 数据库用户名
    private static final String PASSWORD = "123456"; // 数据库密码

    public static void main(String[] args) {
        Connection conn = null;
        try {
            // 加载 MySQL JDBC 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 尝试连接到数据库
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("数据库连接成功！");

        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC 驱动未找到。");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("数据库连接失败： " + e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭连接
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
