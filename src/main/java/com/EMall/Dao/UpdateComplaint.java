package com.EMall.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateComplaint {

	public String updateComplaint(String Uname,String type,String Complaint)
	{
		try{
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
				String query="insert into Complaints values(?,?,?)";
				PreparedStatement pstmt=con.prepareStatement(query);
				pstmt.setString(1, Uname);
				pstmt.setString(2, type);
				pstmt.setString(3, Complaint);
				pstmt.executeUpdate();
		}
		catch(Exception e){
		return (e+"");}
		
		return "success";
	}
}
