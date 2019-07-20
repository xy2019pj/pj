package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTools {

	public static void update(String sql,Object ...objects ) {
		Connection connection = null;
		PreparedStatement preparedStatement=null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(sql);

			for(int i=0;i<objects.length;i++) {
				preparedStatement.setObject(i+1, objects[i]);

			}

			preparedStatement.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//5.关闭数据库资源
			releaseDBD(null, preparedStatement, connection);
		}


	}


	/**
	 * 执行sql的方法
	 * @param sql:insert,update,delete
	 */
	public static void update(String sql) {
		Connection connection = null;
		Statement statement = null;

		try {
			//1.获取数据库连接
			connection = getConnection();

			//2.调用Connection对象的createStatement
			statement = connection.createStatement();

			//4.发送执行SQL语句
			statement.execute(sql);


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//5.关闭数据库资源
			releaseDBD(null, statement, connection);
		}
	}

	//释放资源
	public static void releaseDBD(ResultSet resultSet,Statement statement,Connection connection) {
		if(resultSet != null) {
			try {
				resultSet.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(statement != null) {
			try {
				statement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
	//获取连接
	public static Connection getConnection() throws IOException, SQLException, ClassNotFoundException {
		//0.读取属性文件
		Properties properties = new Properties();
		InputStream inStream = JDBCTools.class.getClassLoader().getResourceAsStream("jdbc.properties");
		properties.load(inStream);

		//1.获取连接的4个字符串
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String jdbcUrl = properties.getProperty("jdbcUrl");
		String driverClass = properties.getProperty("driverClass");

		// 2.加载驱动
		Class.forName(driverClass);

		// 3.调用DriverMan 获取数据库连接
		Connection connection = DriverManager.getConnection(jdbcUrl, user, password);
		return connection;
	}

}
