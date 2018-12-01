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
	
	private static String DB_URL = "jdbc:mysql://localhost:3306/cs485_lab?useUnicode=true&useJDBCCompliantTimezoneShift="
			+ "true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static String DB_USER = "root";
	private static String DB_PASSWORD = "Diomary-8";
	
	public static Connection getConnection() throws SQLException {
		Connection connection = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		System.err.println("The connection is successfully obtained");
		return connection;
	}
	

}
