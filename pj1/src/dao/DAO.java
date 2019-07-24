package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

public class DAO {

	/**
	 * Insert、delete、update都包含
	 * @param sql
	 * @param objects
	 */
	void update(String sql,Object ...objects ) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection= JDBCTools.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			for(int i=0;i<objects.length;i++) {
				preparedStatement.setObject(i+1,objects[i]);
			}

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTools.releaseDBD(null, preparedStatement, connection);
		}
	}

	/**
	 * 查询一条记录，返回对应的对象
	 * @param <T>
	 * @param clazz
	 * @param sql
	 * @param objects
	 * @return
	 */
	<T> T get(Class<T> clazz,String sql,Object ...objects) {
		T entity = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			//1.获取connection
			connection = JDBCTools.getConnection();

			//2.获取prepareStatement
			preparedStatement=connection.prepareStatement(sql);

			//3.填充占位符
			for(int i=0;i<objects.length;i++) {
				preparedStatement.setObject(i+1, objects[i]);//从1开始
			}

			//4.进行查询，得到resultSet
			resultSet = preparedStatement.executeQuery();

			//5.若有记录，准备一个Map<String ,Object>  键：存放列的别名    值：存放列的值
			if(resultSet.next()) {
				Map<String,Object> values = new HashMap<String, Object>();

				//6.得到ResultSetMeteData对象
				ResultSetMetaData rsmd = resultSet.getMetaData();

				//7.处理ResultSet，把指针向下移动一个单位

				//8.由ResultSetMeteData 对象得到结果中有多少列
				int columnCount = rsmd.getColumnCount();

				//9.由ResultSetMeteData 对象得到每一列的别名，由ResultSet得到具体每一列的值
				for(int i=0;i<columnCount;i++) {
					String columnLabel = rsmd.getColumnLabel(i+1);
					Object columnValue = resultSet.getObject(i+1);

					//10.填充Map对象
					values.put(columnLabel, columnValue);
				}

				//11.用反射创建class 对应的对象
				entity = clazz.newInstance();

				//12.遍历 Map对象,用反射填充对象的属性值：属性名为KEY,属性值为VALUE
				for(Map.Entry<String, Object> entry:values.entrySet()) {
					String propertyName = entry.getKey();
					Object value = entry.getValue();

//					com.atguigu.jdbc.ReflectionUtils.setFieldValue(entity, propertyName,value);
					BeanUtils.setProperty(entity, propertyName, value);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTools.releaseDBD(resultSet, preparedStatement, connection);
		}

		return entity;
	}

	/**
	 * 查询多条记录，返回对象的集合
	 * @param <T>
	 * @param clazz
	 * @param sql
	 * @param objects
	 * @return
	 */
	<T> List<T> getForList(Class<T> clazz,String sql,Object ...objects){

		List<T> list = new ArrayList<T>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = JDBCTools.getConnection();
			preparedStatement=connection.prepareStatement(sql);

			for(int i=0;i<objects.length;i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}

			resultSet = preparedStatement.executeQuery();

			//5.准备一个List<Map<String ,Object>>  键：存放列的别名    值：存放列的值
			List<Map<String , Object>> values = new ArrayList<Map<String,Object>>();

			ResultSetMetaData rsmd = resultSet.getMetaData();
			Map<String,Object> map = null;

			//7.处理ResultSet，while循环
			while(resultSet.next()) {
				map = new HashMap<String, Object>();

				for(int i=0;i<rsmd.getColumnCount();i++) {
					String columnLabel = rsmd.getColumnLabel(i+1);
					Object columnValue = resultSet.getObject(i+1);

					map.put(columnLabel, columnValue);
				}

				//11.map放入list中
				values.add(map);
			}

			T bean = null;

			//12.判断list是否为空，若不为空则遍历，得到一个个map对象，再把map转为object对象
			if(values.size()>0) {
				for(Map<String, Object>m:values) {
					bean = clazz.newInstance();
					for(Map.Entry<String, Object> entry:m.entrySet()) {
						String propertyName = entry.getKey();
						Object value = entry.getValue();

						BeanUtils.setProperty(bean, propertyName, value);
					}
					//13.把object放到list中
					list.add(bean);
				}
			}



		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTools.releaseDBD(resultSet, preparedStatement, connection);
		}


		return list;
	}

	/**
	 * 返回某条记录的某一个字段的值，或一个统计的值（一共有多少条记录等）
	 * @param sql
	 * @param objects
	 * @return
	 */
	List<String> getForValue(String sql,Object ...objects) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<String> eList=new ArrayList<>();
		try {
			connection = JDBCTools.getConnection();
			preparedStatement=connection.prepareStatement(sql);

			for(int i=0;i<objects.length;i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}

			resultSet = preparedStatement.executeQuery();


			while(resultSet.next()) {
				eList.add ((String) resultSet.getString(1));
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTools.releaseDBD(resultSet, preparedStatement, connection);
		}
		//2.取得结果集的

		return eList;
	}

}
