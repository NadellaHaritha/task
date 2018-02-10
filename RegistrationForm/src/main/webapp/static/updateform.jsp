<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String id=request.getParameter("edit_id");
%>
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
 $(document).ready(function() 
{
	 //alert(55)
	var regid=document.getElementById("editid").value;
	 if(!(regid=="new") ||regid=="null") {
		 //alert(5)
			$.getJSON('http://localhost:8080/single_id?id='+regid, function(data) {
				
				$.each(data, function(i,f){
					alert(f.firstname)
					  document.getElementById("fname").value=f.firstname;
				     document.getElementById("lname").value=f.lastname;
					 
					 document.getElementById("mail").value=f.email;
					 
					  document.getElementById("gen").value=f.gender;
					 /* if(document.getElementById("male").checked){
							var gender=document.getElementById("male").value;
							alert(gender)
						}
						else if(document.getElementById("female").checked){
							var gender=document.getElementById("female").value;
							alert(gender)
						} */

					
					  document.getElementById("uname").value=f.username; 
					  document.getElementById("upwd").value=f.password;
				});
				

			     	});

			
			
	 }
//alert(regid);

}); 
//alert(1)
 var hrf=window.location.href.substr(0,window.location.href.lastIndexOf("/"));
 //alert(hrf)
 function update()
 {
	//alert(1)
	 	var id=document.getElementById("editid").value;
 	//alert(1)
 	var firstname=document.getElementById("fname").value;
 	//alert(firstname)
 	var lastname=document.getElementById("lname").value;
 	//alert(lastname)
 	var email=document.getElementById("mail").value;
 	///alert(email)
 	var gender=document.getElementById("gen").value;
 	/* if(document.getElementById("male").checked){
		var gender=document.getElementById("male").value;
		alert(gender)
	}
	else if(document.getElementById("female").checked){
		var gender=document.getElementById("female").value;
		alert(gender)
	} */

 	var username=document.getElementById("uname").value;
 	//alert(address)
 	var password=document.getElementById("upwd").value;
 	//alert(password)
 	//alert(3)
  
 	
 	var postData="editid="+id+
 		"&fname="+firstname+
		"&lname="+lastname+
		"&mail="+email+
		"&gen="+gender+
		"&uname="+username+
		"&upwd="+password;
 	
 //	alert(postData)
 	// alert(hrf)
 	 
 	$.ajax({
 		url :hrf+"/data_update",
 		type: "POST",
 		data :postData ,
 		success:function(data, textStatus, jqXHR) 
 		{	
 		alert(data);		      			   
 		 if(data=="Updated")
		{
 			$('<form action="/listpage"></form>').appendTo('body').submit();
		  // session.setAttribute("userId", id);
		} 
	},
 		error: function(jqXHR, textStatus, errorThrown) 
 		{	
 			alert(data); 
 		}
 		});//ajax

 }
</script>
<body>

	    <div class="container">

    <form action="/listpage" class="well form-horizontal"    id="reg" name="reg">
<fieldset>

<legend><center><h2><b>Update Form</b></h2></center></legend><br>

 <input type="hidden" value='<%= id %>' name="editid" id="editid">

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
    <label class="radio-inline"><input type="radio" name="gen" id="gen" value="Male">Male</label>
    <label class="radio-inline"><input type="radio" name="gen" id="gen" value="Female">Female</label>
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
   <button type="button" class="btn btn-success" onclick="javascript:return update()">SUBMIT <span class="glyphicon glyphicon-send"></span></button>
<!--   <a href="NewList.jsp" class="btn btn-success" role="button" onClick=" update()">SUBMIT <span class="glyphicon glyphicon-send"></span></a>-->
</div>

</div>

</fieldset>
</form>
</div>
    </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>