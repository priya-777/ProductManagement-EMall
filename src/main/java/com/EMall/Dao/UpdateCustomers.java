package com.EMall.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UpdateCustomers {

	public String updateCDetails(String FullName,String UserName,String Email,String PhoneNumber,String Password)
	{
		int count=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");
			String query1="select count(*) from customer";
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery(query1);
			while(rs.next())
			{
			count=rs.getInt("count(*)");
			}
			count++;
			String query="insert into Customer values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(query);  
			pstmt.setInt(1, count);
			pstmt.setString(2, FullName);
			pstmt.setString(3, UserName);
			pstmt.setString(4, Email);
			pstmt.setString(5, PhoneNumber);
			pstmt.setString(6, Password);
			pstmt.executeUpdate();
			con.close();  
		}
		catch(Exception e)
		{
			return e+"";
		}
		
		return "Success";
	}
}
