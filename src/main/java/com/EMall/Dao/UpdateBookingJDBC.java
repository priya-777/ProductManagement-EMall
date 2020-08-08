package com.EMall.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UpdateBookingJDBC {

	public String updateBooking(String Uname,String[] Space,String[] Dates,double Rate)
	{
		int f=0;
		int count=0;
		int cus_id=0;
		try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
		String query1="select count(*) from finance";
		String query2="select customer_id from customer where username=?";
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery(query1);
		while(rs.next())
		{
		count=rs.getInt("count(*)");
		}
		count++;
		PreparedStatement pstmt=con.prepareStatement(query2);
		pstmt.setString(1, Uname);
		ResultSet rs1=pstmt.executeQuery();
		while(rs1.next())
		{
			cus_id=rs1.getInt("customer_id");
		}
		
		String mainquery="insert into bookings values(?,?,?,?)";
		PreparedStatement mainstmt=con.prepareStatement(mainquery);
		for(int i=0;i<Dates.length;i++)
		{
		mainstmt.setInt(1,count);
		mainstmt.setInt(2,Integer.parseInt(Space[0]));
		mainstmt.setInt(3,cus_id);
		mainstmt.setString(4,Dates[i]);
		mainstmt.executeUpdate();
		}
		String mainquery1="insert into finance values(?,?)";
		PreparedStatement mainstmt1=con.prepareStatement(mainquery1);
		mainstmt1.setInt(1,count);
		mainstmt1.setDouble(2,Rate);
		mainstmt1.executeUpdate();
		con.close();  
		}
		
		catch(Exception e){ 
			return e+"";
			} 
		
			return "success";
	}
	public String updateBooking(String Uname,String[] Space,String[] Dates,double Rate,String STime,String ETime)
	{
		int f=0;
		int count=0;
		int cus_id=0;
		try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
		String query1="select count(*) from finance";
		String query2="select customer_id from customer where username=?";
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery(query1);
		while(rs.next())
		{
		count=rs.getInt("count(*)");
		}
		count++;
		PreparedStatement pstmt=con.prepareStatement(query2);
		pstmt.setString(1, Uname);
		ResultSet rs1=pstmt.executeQuery();
		while(rs1.next())
		{
			cus_id=rs1.getInt("customer_id");
		}
		
		String mainquery="insert into bookingshourwise values(?,?,?,?,?,?)";
		PreparedStatement mainstmt=con.prepareStatement(mainquery);
		for(int i=0;i<Dates.length;i++)
		{
		mainstmt.setInt(1,count);
		mainstmt.setInt(2,Integer.parseInt(Space[0]));
		mainstmt.setInt(3,cus_id);
		mainstmt.setString(4,Dates[i]);
		mainstmt.setString(5,STime);
		mainstmt.setString(6,ETime);
		mainstmt.executeUpdate();
		}
		String mainquery1="insert into finance values(?,?)";
		PreparedStatement mainstmt1=con.prepareStatement(mainquery1);
		mainstmt1.setInt(1,count);
		mainstmt1.setDouble(2,Rate);
		mainstmt1.executeUpdate();
		con.close();  
		}
		
		catch(Exception e){ 
			return e+"";
			} 
		
			return "success";
	}
}
