package Well;

import java.sql.*;
import java.util.*;

public class Meta {

	
	static Statement stmt=null;
	static Connection connection = null;
	static DatabaseMetaData metadata = null;
	ArrayList<ArrayList> tables = null;

	
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
			returnValues.add(rs2.getObject(column).toString());
			
		}
		
		return returnValues;
		
	}
	
	public void valuePush(String t, ArrayList list) throws SQLException{
		
		String table = t;
		ArrayList values = list;
		
		
		
		try {
			stmt = connection.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			stmt.executeQuery("INSERT INTO "+table +"VALUES");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public  ArrayList<ArrayList> getTableMetadata() throws SQLException  {
		String table[] = {"TABLE"};
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<String> foreach = null;

		// recieve the Type of the object in a String array.
		rs = metadata.getTables(null, null, "%", table);
		
		
		tables = new ArrayList<ArrayList>();
		
		
		
		String word = null;
		
		while(rs.next()) {
			foreach = new ArrayList<String>();
			foreach.add(rs.getString("TABLE_NAME"));
			//tables.add(temp);
			word = rs.getString("TABLE_NAME");
			stmt = connection.createStatement();
			rs2 = stmt.executeQuery("SELECT * FROM " + word);
			ResultSetMetaData md = rs2.getMetaData();
			int count = md.getColumnCount();
		
	
			//columns = new ArrayList<String>();
			//System.out.println(word);
			for (int i=1; i<=count; i++) {
				foreach.add(md.getColumnName(i));
			}
			tables.add(foreach);
			
		}
		return tables;
		
		
	}

	public ArrayList<String> colReturn (String tName){ // column names
		ArrayList<String> returnValues = new ArrayList<String>();
		for( int r = 0; r < tables.size(); r ++){
			//System.out.println(newList.get(r).get(0));
			if (tables.get(r).get(0).toString().toLowerCase().equals(tName.toLowerCase())){
				for(int i = 1; i < tables.get(r).size(); i ++){
					returnValues.add((String) tables.get(r).get(i).toString());
				}
			}
			
		}
		
		return returnValues;
	}
	
	public ArrayList<ArrayList> blockBuilder (String tName){
		
		ArrayList<ArrayList> xBYx = new ArrayList<ArrayList>();
		ArrayList<ArrayList> results = new ArrayList<ArrayList>();

		
		
		
		for (String cName : colReturn(tName)) {
			ArrayList<String> temp = new ArrayList<String>();
			try {
				for(String value : valuePull(tName,cName)) {
					temp.add(value.toString());
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			xBYx.add(temp);
			
		}
		int listSize = xBYx.size();
		ArrayList<String> temp = null;
		
		int check = 0;
		int counter = 0;
		
		while(check == 0){
			try{
				temp = new ArrayList<String>();
				for(int i = 0; i < listSize; i ++){
					temp.add((String) xBYx.get(i).get(counter));
				}
				results.add(temp);
				counter ++;
			}
			catch(IndexOutOfBoundsException e){
				
				check = 1;
			}
		}
		
		return(results);
	}
	

		
		
	
	/*
	 * returns arraylist with the table's name
	 */
	
	
	
	
	
}
