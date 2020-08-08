<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="AdminStyle.css">
<link rel="stylesheet" type="text/css" href="Style.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Insert title here</title>
<%
String a[]=(String[])session.getAttribute("space");
String Dates[]=(String[])session.getAttribute("Dates");
String Uname=(String)session.getAttribute("Uname");
String STime=(String)session.getAttribute("STime");
String ETime=(String)session.getAttribute("ETime");
Double Rate=(Double)session.getAttribute("Rate");
int count=Dates.length;
%>
<script>
var spaces=[];
<%
if(a!=null){
    for(int i=0; i<a.length; i++){ %>
        var code='<%= a[i] %>';           //--> without this doesnt work
        spaces[<%= i %>]=code; 
    <%}
}%>

var dates=[];
<%
if(Dates!=null){
    for(int i=0; i<Dates.length; i++){ %>
        var code='<%= Dates[i] %>';           //--> without this doesnt work
        dates[<%= i %>]=code; 
    <%}
}%>

document.addEventListener("DOMContentLoaded", function() {
	
	for(var i=0;i<dates.length;i++)
		document.getElementById("card").value+=dates[i]+"||";
	
	if(<%=Uname%>===null)
		{
		alert("Please login Again");
		location="index.jsp";
		}
	
});

</script>
</head>
<body>
<form action="UpdateBooking" method="post" class="container">
    <label class="form-check-label">Confirm Details</label>
    <div class="form-row">
    <label class="form-check-label">User Name</label>
	<input type="text" class="form-control" value=<%=Uname %> readonly>
	</div>
	<div class="form-row" id="dates">
	<label class="form-check-label">Booking Date(s)</label>
	<textarea class="form-control" id="card" style="width:100%;height:100px" readonly></textarea>
	</div>
	<div id="time">
	<div class="form-row">
	<div class="form-group col-md-6">
	<label class="form-check-label">Start Time</label>
	<input type="text" class="form-control col-4" value=<%=STime %> readonly>
	</div>
	<div class="form-group col-md-6">
	<label class="form-check-label">End Time</label>
	<input type="text" class="form-control col-4" value=<%=ETime %> readonly>
	</div>
	</div>
	</div>
	<%
	if(STime==null)
		out.println("<script>document.getElementById('time').style='display:none';</script>");
	%>
	<div class="form-row">
	<label class="form-check-label">Rate for <%= count %> Units<img src="https://img.icons8.com/ios/50/000000/rupee.png"/></label>
	
	<input class="form-control" readonly value=<%= Rate%> >
	</div>
  	<br><br><button type="submit" class="btn btn-primary" id="final">Submit</button>
  	<a href="BookAvailableSpace.jsp" class="btn btn-warning">Reset</a>
</form>
</body>
</html>