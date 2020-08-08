package com.EMall.Dao;

import java.sql.*;
import java.time.LocalTime;

public class CheckDayJDBC {

	public String checkEnteredDay(String[] a, String eDate) {

		try{
			Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");
            String query="select Date from Bookings where date='"+eDate+"' and space_id="+Integer.parseInt(a[0]);
            PreparedStatement stmt=con.prepareStatement(query);
//            stmt.setString(1,eDate);
//            stmt.setInt(2, Integer.parseInt(a[0]));
            ResultSet Dates=stmt.executeQuery(query);
            if(Dates.next())
            {
            	return "success";
            }
		}
		catch(Exception e)
		{
			return e+"";
		}
		return "failure";
	}

	public String checkEnteredHour(String[] a, String eDate,String STime,String ETime) {
		int f=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");
            String query="select * from Bookingshourwise where date='"+eDate+"' and space_id="+Integer.parseInt(a[0]);
            PreparedStatement stmt=con.prepareStatement(query);
            LocalTime Starttarget = LocalTime.parse( STime ) ;
            LocalTime Stoptarget = LocalTime.parse( ETime ) ;
            
            ResultSet Dates=stmt.executeQuery(query);
            if(STime.substring(0,2).equals(ETime.substring(0,2)))
            	return "Very Less Duration";
            else
            {
            if(Stoptarget.isBefore(Starttarget))
            	return "End time is less than Start time";
            else
            {
            while(Dates.next())
            {
            	Boolean targetInZone = (Starttarget.isAfter(LocalTime.parse(Dates.getString("STime")))&&Starttarget.isBefore( LocalTime.parse(Dates.getString("ETime")))) ||(Stoptarget.isAfter(LocalTime.parse(Dates.getString("STime")))&&Stoptarget.isBefore( LocalTime.parse(Dates.getString("ETime")))) ; 
            	
            	if(targetInZone==true)
            	{
            		f=1;
            		break;
            	}
            	if(Starttarget.isBefore(LocalTime.parse(Dates.getString("STime")))&&Stoptarget.isAfter(LocalTime.parse(Dates.getString("ETime"))))
                {
                	f=1;
                	break;
                }
            	if(Starttarget.equals(LocalTime.parse(Dates.getString("STime")))||Stoptarget.equals(LocalTime.parse(Dates.getString("ETime"))))
            	{
            		f=1;
            		break;
            	}
            }
            if(f==1)
            	return "Sorry!! This Timing is already booked!!";
            }
            }
            
		}
		catch(Exception e)
		{
			return e+"";
		}
		return "failure";
	}

}
