/**
 * 
 */
package Well;

import java.sql.*;
import java.util.*;



/**
 * @author ci5170oy
 *
 */
public class DBconnection {
	
	
	
	static DBconnection instance = new DBconnection();
	static Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	

	
	//change URL to your database server as needed
	static String dbPath="jdbc:mysql://localhost:3306/wellness?useUnicode=true&useJDBCCompliantTimezoneShift="
			+ "true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	public static DBconnection getInstance() {
		if (instance==null) {
			instance = new DBconnection();
		}
		return instance;
	}
	
	
	
	public static Connection newConnection() {
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//Class.forName("com.mysql.jbdc.Driver").newInstance();
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","toor");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				System.out.println(s.getMessage());}
		}
		catch (Exception err){
			System.out.println(err.getMessage());
		}
		return null;
	}
}