<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css">
<link rel="stylesheet" type="text/css" href="Style.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script>
document.addEventListener('DOMContentLoaded', function(){
    var today = new Date(),
        year = today.getFullYear(),
        month = today.getMonth(),
        monthTag =["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
        day = today.getDate(),
        days = document.getElementsByTagName('td'),
        selectedDay,
        setDate,
        daysLen = days.length;
// options should like '2014-01-01'
    function Calendar(selector, options) {
        this.options = options;
        this.draw();
    }
    
    Calendar.prototype.draw  = function() {
        this.getCookie('selected_day');
        this.getOptions();
        this.drawDays();
        var that = this,
            reset = document.getElementById('reset'),
            pre = document.getElementsByClassName('pre-button'),
            next = document.getElementsByClassName('next-button');
            
            pre[0].addEventListener('click', function(){that.preMonth(); });
            next[0].addEventListener('click', function(){that.nextMonth(); });
            reset.addEventListener('click', function(){that.reset(); });
        while(daysLen--) {
            days[daysLen].addEventListener('click', function(){that.clickDay(this); });
        }
    };
    
    Calendar.prototype.drawHeader = function(e) {
        var headDay = document.getElementsByClassName('head-day'),
            headMonth = document.getElementsByClassName('head-month');

            e?headDay[0].innerHTML = e : headDay[0].innerHTML = day;
            headMonth[0].innerHTML = monthTag[month] +" - " + year;        
     };
    
    Calendar.prototype.drawDays = function() {
        var startDay = new Date(year, month, 1).getDay(),
            nDays = new Date(year, month + 1, 0).getDate(),
    
            n = startDay;
        for(var k = 0; k <42; k++) {
            days[k].innerHTML = '';
            days[k].id = '';
            days[k].className = '';
        }

        for(var i  = 1; i <= nDays ; i++) {
            days[n].innerHTML = i; 
            n++;
        }
        
        for(var j = 0; j < 42; j++) {
            if(days[j].innerHTML === ""){
                
                days[j].id = "disabled";
                
            }else if(j === day + startDay - 1){
                if((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth())&&(year===today.getFullYear()))){
                    this.drawHeader(day);
                    days[j].id = "today";
                }
            }
            if(selectedDay){
                if((j === selectedDay.getDate() + startDay - 1)&&(month === selectedDay.getMonth())&&(year === selectedDay.getFullYear())){
                days[j].className = "selected";
                this.drawHeader(selectedDay.getDate());
                }
            }
        }
    };
    
    Calendar.prototype.clickDay = function(o) {
        var selected = document.getElementsByClassName("selected"),
            len = selected.length;
        if(len !== 0){
            selected[0].className = "";
        }
        o.className = "selected";
        selectedDay = new Date(year, month, o.innerHTML);
        this.drawHeader(o.innerHTML);
        this.setCookie('selected_day', 1);
        
    };
    
    Calendar.prototype.preMonth = function() {
        if(month < 1){ 
            month = 11;
            year = year - 1; 
        }else{
            month = month - 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.nextMonth = function() {
        if(month >= 11){
            month = 0;
            year =  year + 1; 
        }else{
            month = month + 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.getOptions = function() {
        if(this.options){
            var sets = this.options.split('-');
                setDate = new Date(sets[0], sets[1]-1, sets[2]);
                day = setDate.getDate();
                year = setDate.getFullYear();
                month = setDate.getMonth();
        }
    };
    
     Calendar.prototype.reset = function() {
         month = today.getMonth();
         year = today.getFullYear();
         day = today.getDate();
         this.options = undefined;
         this.drawDays();
     };
    
    Calendar.prototype.setCookie = function(name, expiredays){
        if(expiredays) {
            var date = new Date();
            date.setTime(date.getTime() + (expiredays*24*60*60*1000));
            var expires = "; expires=" +date.toGMTString();
        }else{
            var expires = "";
        }
        document.cookie = name + "=" + selectedDay + expires + "; path=/";
    };
    
    Calendar.prototype.getCookie = function(name) {
        if(document.cookie.length){
            var arrCookie  = document.cookie.split(';'),
                nameEQ = name + "=";
            for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
                var c = arrCookie[i];
                while (c.charAt(0)==' ') {
                    c = c.substring(1,c.length);
                    
                }
                if (c.indexOf(nameEQ) === 0) {
                    selectedDay =  new Date(c.substring(nameEQ.length, c.length));
                }
            }
        }
    };
    var calendar = new Calendar();
    
        
}, false);

function getCookie(name) {
    // Split cookie string and get all individual name=value pairs in an array
    var cookieArr = document.cookie.split(";");
    
    // Loop through the array elements
    for(var i = 0; i < cookieArr.length; i++) {
        var cookiePair = cookieArr[i].split("=");

        if(name == cookiePair[0].trim()) {
        	
            return decodeURIComponent(cookiePair[1]).substring(0,15);
        }
    }
    
    // Return null if not found
    return null;
}
var a;
function getEntries(updatednow)
{
 
}

</script>
<script>

<%
String duration="";
String renttype="";
String a[]=(String[])session.getAttribute("space");
if(a!=null)
{
	duration=a[2];
	renttype=a[3];
}

%>
var area,areasplited=[],dur,rent,updatednow;

function enterarea()
{
	area=document.getElementById("selectedday").value;
	areasplited=area.split("&");
	updatednow=getCookie('selected_day');
	var utc = new Date(new Date().toJSON().slice(0,10).replace(/-/g,'/'));
	var date1 = new Date(getCookie('selected_day'));
    var alertmsg="Check Date Entered for Errors like ";
	var f=0;
	for(i=0;i<areasplited.length;i++)
	{
			if(areasplited[i]===updatednow)
			{
			f=1;
			break;
			}	
	}
	if(f==1)
		alertmsg+="Already Entered Date";
	if(date1<utc)
	{
		alertmsg+=",Finished Day";
	f=1;
	}
	if(dur==="Week Days")
		{
		if(updatednow.substring(0,4)==="Sat "||updatednow.substring(0,4)==="Sun ")
			{
			alertmsg+=",Not a Week Day";
			f=1;
			}
		}
	else if(dur==="Week Ends")
	{
	if(!(updatednow.substring(0,4)==="Sat "||updatednow.substring(0,4)==="Sun "))
		{
		f=1;
		alertmsg+=",Not a WeekEnd!!!";
		}
	}
	
	var ob=new XMLHttpRequest();
	 ob.onreadystatechange=function todo1()
	 {
	          if(ob.readyState===4)
	       	  {
	        	if(ob.responseText.trim()==="failure")
	        	{
	        		if(f==0)
	        		document.getElementById('selectedday').value+=getCookie('selected_day')+"&";
	        		else
	        		alert(alertmsg);
	        	}
	        	else
	        		alert("Sorry!! This date is already Booked!");
	          }
	 }
	 ob.open("GET","CheckDay?updatednow="+updatednow,true);
	 ob.send();	
}
		
//$(document).on("click", "#selectedday", function(){
//    $(this).parent("div").remove();
//	document.getElementById("insertagain").innerHTML="<div><div id='selectedday'></div></div>"
//});

<%
String str="";
str=(String)session.getAttribute("str");
%>
document.addEventListener("DOMContentLoaded", function() {
	
	area=document.getElementById("selectedday").value;
	areasplited=area.split("&");
	dur="<%=duration%>";
	rent="<%=renttype%>"
	if(rent!=="Hour Wise")
	document.getElementById("time").style.display="none";
	
});


function enter()
{
	if(rent==="Week Wise")
		{
		if(areasplited.length<7)
		{
		document.getElementById("final").setAttribute("disabled", "disabled");
		document.getElementById("checkme").checked=false;
		alert("Enter atleast 7 days");
		}
		else
		document.getElementById("final").disabled=false;
		}
	else if(rent==="Day Wise")
		{
		if(document.getElementById("selectedday").value==="")
		{
		document.getElementById("final").setAttribute("disabled", "disabled");
		document.getElementById("checkme").checked=false;
		alert("Enter Atleast One Day");
		}
		else
		document.getElementById("final").disabled=false;
		}
	else if(rent==="Hour Wise")
		{
		if(document.getElementById("selectedday").value===""||areasplited.length>1)
		{
		document.getElementById("final").setAttribute("disabled", "disabled");
		document.getElementById("checkme").checked=false;
		if(areasplited.length>1)
			alert("Enter One Day!");
		else
		alert("Enter Atleast One Day");
		}
		else
		document.getElementById("final").disabled=false;
	
		var obj=new XMLHttpRequest();
		 obj.onreadystatechange=function todo1()
		 {
		          if(obj.readyState===4)
		       	  {
		        	if(obj.responseText.trim()!=="failure")
		        	{
		        		document.getElementById("final").setAttribute("disabled", "disabled");
		    			document.getElementById("checkme").checked=false;
		    			alert(obj.responseText);
		        	}
		        	else
		        		{
		        		document.getElementById("final").disabled=false;
		        		}
		          }
		 }
		 obj.open("GET","CheckHours?updatednow="+updatednow+"&stime="+document.getElementById("stime").value+"&etime="+document.getElementById("etime").value,true);
		 obj.send();
		}
}


</script>
<style type="text/css">

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}

blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-spacing: 2px;
}
.clearfix:before,
.clearfix:after {
    content: " "; /* 1 */
    display: table; /* 2 */
}

.clearfix:after {
    clear: both;
}
/**
 * For IE 6/7 only
 * Include this rule to trigger hasLayout and contain floats.
 */
.clearfix {
    *zoom: 1;
}
a, a:hover {
    text-decoration: none;
}
.img-responsive {
    max-width: 100%;
    height: auto;
}

body{
    font-family: Arial, Helvetica, sans-serif;
     -webkit-user-select: none;
     -moz-user-select: none;
     -ms-user-select: none;
     user-select: none;
}

.elegant-calencar {
    width: 25em;
    height: 31em;
    border: 1px solid #c9c9c9;
    -webkit-box-shadow: 0 0 5px #c9c9c9;
    box-shadow: 0 0 5px #c9c9c9;
    text-align: center;

}

#header {
    font-family: 'HelveticaNeue-UltraLight', 'Helvetica Neue UltraLight', 'Helvetica Neue', Arial, Helvetica, sans-serif;
    height: 14em;
    margin-bottom: 1em;
}

.pre-button, .next-button {
    margin-top: 2em;
    font-size: 3em;
    -webkit-transition: -webkit-transform 0.5s;
    transition: transform 0.5s;
    cursor: pointer;
    width: 1em;
    height: 1em;
    line-height: 1em;
    color: white;
    border-radius: 10px;
}

.pre-button:hover, .next-button:hover {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
}

.pre-button:active,.next-button:active{
    -webkit-transform: scale(0.7);
    -ms-transform: scale(0.7);
    transform: scale(0.7);
}

.pre-button {
    float: left;
    margin-left: 0.5em;
}

.next-button {
    float: right;
    margin-right: 0.5em;
    margin-top:-113px;
    margin-bottom:2em;
}

.head-info {
    float: left;
    width: 16em;
}

.head-day {
    margin-top: 30px;
    font-size: 8em;
    line-height: 1;
    color: #fff;
}

.head-month {
    margin-top: 20px;
    font-size: 2em;
    line-height: 1;
    color: #fff;
}

#calendar {
    width: 90%;
    margin: 0 auto;
}

#calendar tr {
    height: 2em;
    line-height: 2em;
}

thead tr {
    color: white;
	font-weight: 700;
	text-transform: uppercase;
}

tbody tr {
    color: #252a25;
}

tbody td{
    width: 14%;
    border-radius: 50%;
    cursor: pointer;
    -webkit-transition:all 0.2s ease-in;
    transition:all 0.2s ease-in;
}

tbody td:hover, .selected {
    color: #fff;
    background-color: rgba(0,0,0,.5);
    border: none;
}

tbody td:active {
    -webkit-transform: scale(0.7);
    -ms-transform: scale(0.7);
    transform: scale(0.7);
}

#today {
    background-color: black;
    color: #fff;
    font-family: serif;
    border-radius: 50%;
}

#disabled {
    cursor: default;
    background: transparent;
}

#reset:active{
    -webkit-transform: scale(0.8);
    -ms-transform: scale(0.8);
    transform: scale(0.8);     
}

.main {
  margin-left: 400px;
  font-size: 23px;
  padding: 100px;
  margin-top:0px;
}

.col{
background-color:white;
}
.container-fluid{
padding:10px;
}
#panel{
display:none;
}
</style>
</head>
<body>
<form action="SpaceChoose.jsp" class="container-fluid">
<input type="submit" class="btn btn-light" value="
<%
for(int i=0;i<5;i++)
{

out.println(a[i]);
if(i!=4)
out.println("||");
}
%>" />
</form>
<input id="panel"/>

<div class="container-fluid pt-3">

    <div class="form-group row">
    <div class="col-6">
          <div class="elegant-calencar">
       <p id="reset"></p>
        <div id="header" class="clearfix btn btn-primary" >
           <div class="pre-button">&lt;</div>
            <div class="head-info">
                <div class="head-day"></div>
                <div class="head-month"></div>
            </div>
            <div class="next-button">&gt;</div>
        </div>
        <table id="calendar">
            <thead>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <input onclick="enterarea()" class="btn btn-primary" type="submit" id="book"/>
    </div>
    </div>
    <div class="col-sm">
  <form action="confirm" method="post" class="form-group">
    <div class="form-group">
    <label for="example-time-input" class="badge badge-secondary">Booking Dates</label>
    <textarea class="form-control" id="selectedday" name="that" style="width:80%; height:100px" readonly></textarea>
    </div>
    <div class="form-group row" id="time">
    <div class="col-4">
  		<label for="example-time-input" class="badge badge-secondary">Start Time</label>
    	<input class="form-control" type="time" value="00:00:00" id="stime" name="stime" required>
    </div>
    <div class="col-4">
    	<label for="example-time-input" class="badge badge-secondary">End Time:</label>
    	<input class="form-control" type="time" value="00:00:00" id="etime" name="etime" required>
   	</div>
	</div>
	<div class="form-check">
    <input type="checkbox" class="form-check-input" id="checkme" onclick="enter()" required>
    <label class="form-check-label">Check me out</label>
  </div>
  	<button type="submit" class="btn btn-primary" id="final">Submit</button>
  	<a href="BookAvailableSpace.jsp" class="btn btn-warning">Reset</a>
  </form>

</div>
</div>
</div>

</body>
<script>

</script>
</html>



