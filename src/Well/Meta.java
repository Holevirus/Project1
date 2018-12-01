package Well;

import java.sql.*;
import java.util.*;

public class Meta {

	
	static Statement stmt=null;
	static Connection connection = null;
	static DatabaseMetaData metadata = null;
	
	// Static block for initialization
	public Meta() {
	connection = DBconnection.newConnection();
	
	try {
		metadata = connection.getMetaData();
	} catch (SQLException e) {
		System.err.println("There was an error getting the meta data: " + e.getMessage());
	}
	}

	
	public void printGeneralMetadata() throws SQLException {
		
		System.out.println("Database Product Name: "
				+ metadata.getDatabaseProductName());
		System.out.println("Logged User: "
				+ metadata.getUserName());
		System.out.println("JDBC Driver: " 
				+ metadata.getDriverName());
		System.out.println("\n");
		
	}
	public ArrayList<String> valuePull(String t, String c) throws SQLException{
		
		ResultSet rs2 = null;
		String table = t;
		String column = c;
		ArrayList<String> returnValues = new ArrayList<String>();
		
		
		try {
			stmt = connection.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			rs2 = stmt.executeQuery("SELECT * FROM " + table);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		while (rs2.next()) {
			returnValues.add((String) rs2.getObject(column));
			
		}
		
		
		
		
		return returnValues;
		
	}
	
	public  ArrayList<ArrayList> getTableMetadata() throws SQLException  {
		String table[] = {"TABLE"};
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<ArrayList> tables = null;
		ArrayList<String> columns = null;
		ArrayList<String> temp = null;

		// recieve the Type of the object in a String array.
		rs = metadata.getTables(null, null, "%", table);
		
		
		tables = new ArrayList<ArrayList>();
		
		
		String word = null;
		
		while(rs.next()) {
			temp = new ArrayList<String>();
			temp.add(rs.getString("TABLE_NAME"));
			tables.add(temp);
			word = rs.getString("TABLE_NAME");
			stmt = connection.createStatement();
			rs2 = stmt.executeQuery("SELECT * FROM " + word);
			ResultSetMetaData md = rs2.getMetaData();
			int count = md.getColumnCount();
		
	
			columns = new ArrayList<String>();
			System.out.println(word);
			for (int i=1; i<=count; i++) {
				columns.add(md.getColumnName(i));
			}
			tables.add(columns);
			
		}
		return tables;
		
		
	}
	
	
	/*
	 * returns arraylist with the table's name
	 */
	
	
	
	
	
}
