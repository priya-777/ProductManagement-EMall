<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Admin Verification</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="Style.css">
<link rel="stylesheet" type="text/css" href="AdminStyle.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
        function check()
        {
			if(document.getElementById("input3").value!=document.getElementById("input4").value)
				document.getElementById("Error").innerHTML="Password did not match";
			else
				document.getElementById("Error").innerHTML="Password Matched ";
        }
        </script>
        <style>
        .container-md{
        background: rgba(0, 0 ,0 ,.6);
        margin-top:30px;
        padding:20px;
        border-radius:100px;
        }
        
        </style>
    </head>
    <body>
    <div class="container-md rounded-lg">
    <div style="color:white">
    <h1>Sign Up</h1>
    <form action="SignUp" method="post">
  <div class="form-row">
   <div class="form-group col-md-6">
      <label>Full Name</label>
      <input type="text" class="form-control" id="input0" placeholder="Enter Full Name" name="FullName" required>
    </div>
   <div class="form-group col-md-6">
   <label>User Name</label>
      <label class="sr-only" for="inlineFormInputGroup">Username</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">@</div>
        </div>
        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Username" name="UserName" required>
      </div>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label>Email</label>
      <input type="email" class="form-control" id="input1" placeholder="Email" name="Email" required>
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group col-md-6">
      <label>Phone Number</label>
      <input type="tel" pattern="[0-9]{10}" required class="form-control" id="input2" placeholder="Enter 10 digit number" name="PhoneNumber" required>
    </div>
  </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
      <label>Password</label>
      <input type="password" class="form-control" id="input3" placeholder="Password" name="Password" required>
    </div>
   <!--<div class="form-group col-md-6">
   <label for="inputEmail4">Confirm Password</label>
      <input onkeyup="check()" type="password" class="form-control" id="input4" placeholder="Confirm Password" name="CPassword" required>
    </div>-->
    </div>
    <div id="Error"></div></br>
      <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
      <label class="form-check-label" for="gridCheck">
        confirm details..
      </label>
    </div>
  </div>
  <center>
            <button type="submit" class="btn btn-success" >Sign Up</button>
<button type="button" class="btn btn-warning" onclick="window.location.href='http://localhost:8081/EMall/index.jsp';">Reset</button>
</center>
  </form>
   
</div>


</div>
    </body>
</html>