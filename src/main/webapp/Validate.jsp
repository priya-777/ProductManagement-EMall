<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<link rel="stylesheet" type="text/css" href="Style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Register New Space</title>
<script>
function open()
{
	alert('Please Login');
	
}
</script>
<style>
.content{
margin-top:70px;
}
li{
margin:2px;
}
.nav-link
{
border-top:none;
border-left :none;
border-right:none;
}
</style>
</head>
<body>
<%
String str="";
str=(String)session.getAttribute("str");
if(str==null)
{
	out.println("<script type=\"text/javascript\">open()");
    out.println("location='LoginAdmin.jsp';");
    out.println("</script>");
}
else if(str.equals("&*^"))
{
	out.println("<script type=\"text/javascript\">");
    out.println("location='Frames.jsp';");
    out.println("</script>");
}	

%>
</body>
</html>