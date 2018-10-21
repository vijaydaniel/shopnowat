package org.sunshine.utils;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UploadImages {

	public static List<String> files = new ArrayList<String>();

	public static void listFilesForFolder(final File folder) {
		for (final File fileEntry : folder.listFiles()) {
			if (fileEntry.isDirectory()) {
				listFilesForFolder(fileEntry);
			} else {
				System.out.println(fileEntry.getName());
				files.add(fileEntry.getName());
			}
		}
	}

	public static void main(String[] args) {
		final File folder = new File(args[0]);
		String storeId = "0";
		if(args.length>1){
			storeId = args[1];
		}
		listFilesForFolder(folder);
		getConnection();
		for (String fileName : files) {
			String inputImage = "";
			String filePath = "";
			if(storeId.equals("0")){
				filePath = "common";
			}else{
				filePath = storeId;
			}
			inputImage = "img/products/" + filePath + "/" + fileName;
			insertRecord(storeId, inputImage);
		}
		/*try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
	}

	private static void getConnection() {
		 try{
		//STEP 2: Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");

	      //STEP 3: Open a connection
	      System.out.println("Connecting to a selected database...");
	      conn = DriverManager.getConnection(DB_URL, USER, PASS);
	      System.out.println("Connected database successfully...");
	      
	      //STEP 4: Execute a query
	      System.out.println("Inserting records into the table...");
	      stmt = conn.createStatement();
		 }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forNameUploadImages
		      e.printStackTrace();
		   }
	}

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/shopnowatdb";

	static final String USER = "root";
	static final String PASS = "passwd";
	static Connection conn = null;
	static Statement stmt = null;

	private static void insertRecord(String storeId, String inputImage) {
		   try{
		      String sql = "INSERT INTO product_images (storeid, img ) values("+ storeId +", '"+inputImage+"')";
		      stmt.executeUpdate(sql);
		   }catch(SQLException se){
		      se.printStackTrace();
		   }catch(Exception e){
		      e.printStackTrace();
		   }
	}

}
