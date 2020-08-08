<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Space</title>
<link rel="stylesheet" type="text/css" href="Style.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style type="text/css">
.container-fluid{
margin:20px;

}
#btn{
margin:50px;
}
th{
padding:50px;
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
	var ob=new XMLHttpRequest();
	 ob.onreadystatechange=function todo1()
	 {
	          if(ob.readyState===4)
	              document.getElementById("panel").innerHTML =ob.responseText;
	 }
	 ob.open("GET","getTables",true);
	 ob.send();
	});

</script>
</head>
<body>

<form action="SpaceChoose" class="btn btn-dark" id="btn">
<div class="container-fluid">
<table>
<thead>
  <tr scope="row">
      <th scope="col">SpaceId</th>
      <th scope="col">Business Space</th>
      <th scope="col">Duration</th>
      <th scope="col">Rent Type</th>
      <th scope="col">Cost Per Unit</th>
      <th scope="col">Choose</th>
  </tr>
</thead>
<tbody id="panel">
</tbody>
</table><br>
    <input type="submit" class="btn btn-primary" value="Confirm" />
    </div>
</form>
</body>
</html>