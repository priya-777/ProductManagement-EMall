<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Admin Verification</title>
        <link rel="stylesheet" type="text/css" href="Style.css" />
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <div class="box">
    <div class="Login-admin"></div><br><br>
    <%
    String info="";
    if(request.getAttribute("info")!=null)
    	info=(String)request.getAttribute("info");
	%>
        <form method="post" action="LoginAdmin" style="color:gray"> 
            <input class="inputbox" name="Id" type="number" placeholder="Admin Id" required><br>
            <input class="inputbox" name="Password" type="password" placeholder="Password" required><br><br>
            <span class="blueText"><%= info %></span><br>
            <input class="btn btn-primary" type="submit" value="Open">
        </form>
    </div>
    </body>
</html>