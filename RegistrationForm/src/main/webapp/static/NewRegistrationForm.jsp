<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<script>
//alert(1)
var hrf=window.location.href.substr(0,window.location.href.lastIndexOf("/"));

//alert(hrf)

function save() {
	//alert(1)
	var firstname=document.getElementById("fname").value;
	//alert(firstname)
	 var lastname=document.getElementById("lname").value;
	//alert(lastname)
	var email=document.getElementById("mail").value;
	///alert(email)
	//var form=document.getElementById("reg").value;
	
	if(document.getElementById("male").checked){
		var gender=document.getElementById("male").value;
		alert(gender)
	}
	else if(document.getElementById("female").checked){
		var gender=document.getElementById("female").value;
		alert(gender)
	}

	//alert(gender)
	var username=document.getElementById("uname").value;
	//alert(username)
	var password=document.getElementById("upwd").value;
	//alert(password)

	var postData="fname="+firstname+
	"&lname="+lastname+
	"&mail="+email+
	"&gen="+gender+
	"&uname="+username+
	"&upwd="+password;
	
	
	//alert(postData)
	 
	 $.ajax({
		url :hrf+"/reg_save",
		type: "POST",
		data :postData ,
		success:function(data, textStatus, jqXHR) 
		{	
		alert(data);
		if(data=="Registered")
			{
			 $('<form action="/listpage"></form>').appendTo('body').submit();
			  // session.setAttribute("userId", id);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) 
		{	
			alert("data"); 
		}
		});//ajax 
}
/* function general()
{
	var gender=document.getElementByName("gen").value;
	if(gender[0].checked)
		{
		var val=type[0].value;
		alert(val);
		}
	else if(gender[1].checked)
		{
		var val=type[1].value;
		alert(val);
		}
	} */
 </script>
<body>

	    <div class="container">

    <form class="well form-horizontal"  method="post"  id="reg" name="reg">
<fieldset>

<legend><center><h2><b>Registration</b></h2></center></legend><br>


<div class="form-group">
  <label class="col-md-4 control-label">First Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="fname" id="fname" placeholder="First Name" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Last Name</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="lname" id="lname" placeholder="Last Name" class="form-control"  type="text">
    </div>
  </div>
</div>

   <div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="mail" id="mail" placeholder="E-Mail Address" class="form-control"  type="text">
    </div>
  </div>
</div>
  <div class="form-group">
  	<label class="col-md-4 control-label">Gender</label>
  	<div class="col-md-4 ">
    <label class="radio-inline"><input type="radio" name="gen" id="male" value="Male" >Male</label>
    <label class="radio-inline"><input type="radio" name="gen" id="female" value="Female" >Female</label>
   </div>
   </div>

<div class="form-group">
  <label class="col-md-4 control-label">Username</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="uname" id="uname" placeholder="Username" class="form-control"  type="text">
    </div>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    
  <input name="upwd" id="upwd" placeholder="Password" class="form-control"  type="password">
   
  </div>
</div>




<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    <button type="button" class="btn btn-success" onclick="javascript:return save()">SUBMIT <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>

</fieldset>
</form>
</div>
    </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>