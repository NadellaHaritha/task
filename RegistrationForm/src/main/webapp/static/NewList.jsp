<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
 
 $(document).ready(function() {
	 
	  $.getJSON('http://localhost:8080/user_list', function(data) {
		
		 $.each(data,function(i,f){
			 var tr="<tr><td>"+f.id+"</td><td>" +f.firstname+"</td><td>" +f.lastname+"</td><td>" +f.email+"</td><td>" +f.gender+"</td><td>" +f.username+"</td><td>" +f.password+"</td><td class='center' style='color:black'> <input type='submit' value='edit'  onclick='javascript:edit(this.id)' id="+f.id+"></input></td>"+"<td style='color:black'><form action='/listpage'><input type='submit' value='delete'  onclick='javascript:trdelete(this.id)' id="+f.id+"></input></form></td></tr>"
		   	 $('#table').append(tr); 	
			
		   
			 
		 });
	    
	  });
	 
	});
 function edit(id)
 {
   $('<form action="/updatepage"><input type="text" value="'+id+'" id="edit_id" name="edit_id"></form>').appendTo('body').submit();
  // session.setAttribute("userId", id);
 }
 function trdelete(id)
 {
	 //alert(id)
	 $.getJSON('http://localhost:8080/data_delete?id='+id, function(data) {
			
			$.each(data, function(i,f){
				//alert(f.first_name)
				 $('<form action="/listpage"></form>').appendTo('body').submit();
			

		     	});
 });
 }
 </script>
<body>

<div class="container">
  <h2 class="text-center">List Page</h2>
  <div class="row">
   <form action="/newregistration_form" >
   <button class="btn btn-success pull-right">Add <span class="glyphicon glyphicon-plus"></span></button></form>
  </div>        
  <table id="table" class="table table-striped">
    <thead>
      <tr>
      <th>ID</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>EMail</th>
        <th>Gender </th>
        <th>UserName </th>
        <th>Password </th>
        <!--  <th><button class="btn btn-warning">Edit</button>
         <button class="btn btn-danger">Delete</button></th> -->
      </tr>
    </thead>
    <tbody>
     <!--  <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <th><button class="btn btn-warning">Edit</button>
         <button class="btn btn-danger">Delete</button></th>
      </tr> -->
      
     
    </tbody>
  </table>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>