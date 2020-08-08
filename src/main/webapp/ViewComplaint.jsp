<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="Style.css">
<link rel="stylesheet" type="text/css" href="AdminStyle.css">
		<meta charset="ISO-8859-1">
		<title>View Complaint</title>
		<style>
.content{
margin-top:90px;
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
<%
String str="";
str=(String)session.getAttribute("str");
%>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	if(<%=str%>===null)
	{
	alert("Please login Again");
	location="index.jsp";
	}
	else
		{
 	var ob=new XMLHttpRequest();
	 ob.onreadystatechange=function todo1()
 	{
          if(ob.readyState===4)
              document.getElementById("panel").innerHTML=ob.responseText;
 	}
 	ob.open("GET","getComplaints",true);
 	ob.send();
 	}
	});
</script>
</head>
<body>

<nav class="navbar navbar-dark fixed-top bg-dark" style="box-shadow:0 5px 5px rgba(0,0,0,0.5); border-radius:30px">
  <a class="navbar-brand " href="#">Admin <svg style="color:white" width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  	<path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
  	<path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  	<path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
	</svg></a>
  <button class="navbar-toggler btn btn-outline-success" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="flex-column collapse navbar-collapse" id="navbarNav" >
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link btn btn-outline-secondary" href="Frames.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link btn btn-outline-secondary" href="RegisterNewSpace.jsp">Register New Space</a>
      </li>
      <li class="nav-item">
        <a class="nav-link btn btn-outline-secondary" href="RevenueReport.jsp">Revenue Report</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link btn btn-outline-secondary" href="UtilityReport.jsp">Utility Report</a>
      </li>
      <li class="nav-item">
        <a class="nav-link btn btn-outline-secondary" href="ViewComplaint.jsp">View Complaint</a>
      </li>
    </ul>
  </div>
</nav>
<div class="content" id="panel">

</div>
</body>
</html>