package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * 数据库的工具类
 * @author am
 * 
 */

public class DBUtil {

	
	//eshop为数据库名称，db_user为数据库用户名，db_password为数据库秘密
	public static String db_url="jdbc:sqlserver://localhost:1433; DatabaseName=technology";
	public static String db_user="sa";
	public static String db_password="123";
	
	public static Connection getConn(){//用于连接数据库
		Connection conn=null;
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=DriverManager.getConnection(db_url,db_user,db_password);	//建立连接
			//System.out.println("连接成功！");
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("连接失败！");

		}
		return conn;
	}
	
	
	//关闭状态和连接
	public static void close(Statement state,Connection conn){
		if(state!=null){
			try{
				state.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	//关闭结果集，状态和连接
	public static void close(ResultSet rs,Statement state,Connection conn){
		if(rs!=null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(state!=null){
			try{
				state.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}	
}









