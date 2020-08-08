<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Style.css" />
		<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<meta charset="ISO-8859-1">
		<title>WELCOME</title>
	</head>

    <body>
    
    <form action="LoginAdmin.jsp">
            <input class="LoginAdmin" type="submit" value="Login As Admin"/><br/>
        </form>
        <%
    String info="";
    if(request.getAttribute("info")!=null)
    	info=(String)request.getAttribute("info");
    String LoginMsg="";
    if(request.getAttribute("LoginMsg")!=null)
    	LoginMsg=(String)request.getAttribute("LoginMsg");
    
	%>
   <div class="box">
    <div class="Login-logo"></div>
    <h1 style="color: white">Login</h1>
     <span class="blueText"><%= LoginMsg %></span><br>
        <form method="post" action="LoginCustomer" style="color:gray"> 
            <input class="inputbox" name="Uname" type="text" placeholder="User Name" required><br><br>
            <input class="inputbox" name="Password" type="password" placeholder="Password" required><br><br>
            <span class="blueText"><%= info %></span><br>
            <button type="submit" class="btn btn-success" >Submit</button>
</form>
        <form action="SignUp.jsp" style="text-align:center; ">
            <input class="btn btn-sm btn-dark" type="submit" value="New User? SignUp"></input><br/>
        </form>
    </div>
	 
    </body>
</html>

