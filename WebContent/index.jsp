<!-- Sean and Tyler stuff -->
<!--  JSP file for file  -->
<!-- Hello -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="Well.Meta" %>
<%


ArrayList<ArrayList> newList = new ArrayList<ArrayList>();

Meta meta = new Meta();
meta.printGeneralMetadata();
try{
newList = meta.getTableMetadata();
} catch (SQLException e){
	System.out.println(e.getMessage());
}

for(ArrayList<String> list : newList){
	for (String row : list){
		System.out.println(row);
	
	}
	System.out.println("\n");
		
	}
	





%>


<!DOCTYPE html>
<html>
<head>
<script src="/Project1/script.js" type="text/javascript"></script>
<script type="text/javascript" src="/jquery-3.3.1.min.js"></script> 
<link rel="stylesheet" href="/Project1/indexstyle2.css" type="text/css">

<meta charset="UTF-8">

</head>
<body>
<div class = "bg">
<div class = "stick">
	<div class="topnav" id = "topnav">
	  <a href="#main">Main</a>
	  <a href="#about">About</a>
	  <a href="#plans">Plans</a>
	  <a href="#">Supplements</a>
	  <a href="#">Contact</a>
	</div>
</div>
<!-- Page content -->
<div class="main" id = "main">
  <h1>Wellness Plans</h1><br>
</div>


<table>
	<tr class="row">
	  <td class="column">
	    <div class="card">
	      <img src="Pics/power.jpg" alt="Jane" style="width:90%">
	      <div class="container">
	        <h2>Power Lifting</h2>
	        <p class="title">Hello</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>Lifting stuff</p>
	        <p><button id="myBtn" class = "button">More Info</button></p>
	      </div>
	    </div>
	  </td>
	
	  <td class="column">
	    <div class="card">
	      <img src="Pics/olympic.jpg" alt="Mike" style="width:100%">
	      <div class="container">
	        <h2>Olympic Lifts</h2>
	        <p class="title">Hello</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>lifting stuff</p>
	        <p><button id="myBtn2" class = "button">More Info</button></p>
	      </div>
	    </div>
	  </td>
	
	  <td class="column">
	    <div class="card">
	      <img src="Pics/running.jpg" alt="John" style="width:100%">
	      <div class="container">
	        <h2>Running/Cardio</h2>
	        <p class="title">Hello</p>
	        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
	        <p>lifting stuff</p>
	        <p><button id="myBtn3" class = "button">More Info</button></p>
	      </div>
	    </div>
	  </td>
	</tr>
</table>
</div>
<!-- The Modals for the different lifting plans -->
<!-- All start out hidden and are changed based on javascript functions and onclick events -->
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
	<div class="modal-content">
	  <div class="modal-header">
	    <span class="close">&times;</span>
	    <div class="topnav">
		  <a href="#home">Workout Plan</a>
		  <a href="#meal">Daily Meal Plan</a>
		  <a href="#supp">Supplement Plan</a>
		</div>
	    <h2>Power Lifting</h2>
	  </div>
	  <div class="modal-body">
	    <p>Power Lifting Stuff</p>
	    <p>Some other text...</p>
	    	<h1>Retrieve data from database in jsp</h1>
			<table border="1">
			<tr>
				<th>Workout Plan</th>
				<th>#WOperDay</th>
				<th>Goal</th>
				<th>Intensity Rating</th>
				<th>Length</th>
				<th>Author</th>
				<th>Equip Needed</th>
			</tr>
			
			</table>
			
			

	  </div>
	  <div class="modal-footer">
	    <h3>Increase Mass and Strength</h3>
	  </div>
	</div>

</div>
<!-- Modal2 -->
<div id="myModal2" class="modal2">

  <!-- Modal content -->
	<div class="modal-content">
	  <div class="modal-header">
	    <span class="close2">&times;</span>
	    <div class="topnav">
		  <a href="#home">Workout Plan</a>
		  <a href="#meal">Daily Meal Plan</a>
		  <a href="#supp">Supplement Plan</a>
		</div>
	    <h2>Olympic Lifts</h2>
	  </div>
	  <div class="modal-body">
	    <p>Olympic Lift stuff</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	  </div>
	  <div class="modal-footer">
	    <h3>Increase full body strength working multiple body groups with each workout</h3>
	  </div>
	</div>

</div>
<!-- Modal3 -->
<div id="myModal3" class="modal3">

  <!-- Modal content -->
	<div class="modal-content">
	  <div class="modal-header">
	    <span class="close3">&times;</span>
	    <div class="topnav">
		  <a href="#home">Workout Plan</a>
		  <a href="#meal">Daily Meal Plan</a>
		  <a href="#supp">Supplement Plan</a>
		</div>
	    <h2>Running/Cardio</h2>
	  </div>
	  <div class="modal-body">
	    <p>Running Stuff</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	    <p>Some other text...</p>
	  </div>
	  <div class="modal-footer">
	    <h3>Lose some weight</h3>
	  </div>
	</div>


</div>
=======
<!-- <div class = "space">
</div> -->

<div class = "bg2" id = "about" >
	<h2 class = "subtitle">About</h2>
	<h3 class ="subtitle">Business Stuff</h3>
</div>
<div class = "bg3" id = "plans">
	<h2 class = "subtitle">Plans</h2>
</div>





</body>

</html>