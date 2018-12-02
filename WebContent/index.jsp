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

%>




<!DOCTYPE html>
<html>
<head>
<script src="/Project1/script.js" type="text/javascript"></script>
<script type="text/javascript" src="/jquery-3.3.1.min.js"></script> 
<link rel="stylesheet" href="/Project1/indexstyle2.css" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class = "bg">
<div class = "stick">
	<div class="topnav" id = "topnav">
	  <a href="#main">Main</a>
	  <a href="#mission">Motivation</a>
	  <a href="#plans">Plans</a>
	  <a href="#supps">Supplements</a>
	  <a href="#about">About</a>
	  <a href="#contact">Contact</a>
	</div>
</div>
<!-- Page content -->
<div class="main" id = "main">
  <h1>Wellness Plans</h1><br>
</div>

 <h2 class = "subtitle">
 Wellness is something that you choose to pursue. It’s a choice you make in life that requires constant effort to achieve.
While associated with a healthy lifestyle, wellness goes beyond the confines of general health. It encompasses a positive outlook on your mind, body, and soul and is something we often have more control over than health.
Wellness has various dimensions and can be viewed a quality, state, or process.
 </h2>

</div>


<!-- <div class = "space">
</div> -->

<div class = "bg2" id = "mission" >
	<h2 class = "subtitle">Mission Statement</h2>
	 <table class = "stuff">
		 <tr>
		 <td>
			 <div class="flip-box">
			  <div class="flip-box-inner">
			    <div class="flip-box-front">
			      <h1>Why Wellness?</h1>
			    </div>
			    <div class="flip-box-back">
			      <h2>We want everyone to be the very best they can be! Our over-arching goal is one of great significance
			      		and positivity.</h2>
			    </div>
			  </div>
			</div>
		 </td>
		 <td>
			 <div class="flip-box2">
			  <div class="flip-box-inner2">
			    <div class="flip-box-front2">
			      <h1>Our Goal?</h1>
			    </div>
			    <div class="flip-box-back2">
			      <h2>Our goal is to give people the option to be healthy and give them the correct tools.
			      		We want our website to help you reach the goals you've always wanted to reach.</h2>
			    </div>
			  </div>
			</div>
		</td>
		  <td>
			 <div class="flip-box3">
			  <div class="flip-box-inner3">
			    <div class="flip-box-front3">
			      <h1>Our Promise?</h1>
			    </div>
			    <div class="flip-box-back3">
			      <h2>We promise you that our website is the very very very best tool to help you reach your goal. 
			      		We would place our literal lives on the living fact that our website is the single
			      		greatest tool for wellness.</h2>
			    </div>
			  </div>
			</div>
		 </td>
		</tr>
	</table>
</div>
<div class = "bg3" id = "plans">
	<h2 class = "subtitle">Plans</h2>
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
	      </div>
	    </div>
	  </td>
	
	  <td class="column">
	    <div class="card">
	      <img src="Pics/olympic.jpg" alt="Mike" style="width:100%">
	      <div class="container">
	        <h2>Olympic Lifts</h2>
	        <p class="title">Hello</p>
	        <p>Olympic lifts are a great way to get full body strength becauase of the activation of more than 1 muscle group.</p>
	        <p>It's important to incorporate Olympic lift</p>
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
	      </div>
	    </div>
	  </td>
	</tr>
</table>
<p><button id="myBtn" class = "button">More Info</button></p>
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
		    <div class = "modal-background1-1" id = "home">
		    	<!--  PAGE 1 -->
		    	<h1>Retrieve data from database in jsp</h1>
			<table class = "data" border="1">
			<tr>
				<th>Workout Plan</th>
				<th>Number of Workouts per day</th>
				<th>Goal</th>
				<th>Intensity Rating</th>
				<th>Length</th>
				<th>Author</th>
				<th>Equip Needed</th>
			</tr>
			
			<%
			// for every column
			ArrayList<ArrayList> tempList1 = meta.blockBuilder("workoutplan");
			
			for(ArrayList<String> row : tempList1){
				out.print("<tr>");
				for(String value : row){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
			}
			%>
			</table>
		    </div>
		    <div class = "modal-background1-2" id = "meal">
		    	<!--  PAGE 2 -->
			    <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Calorie Count</th>
						<th>Protein Count</th>
						<th>Carb Count</th>
						<th>Meals Per Day</th>
					</tr>
					
					<%
						// for every column
						ArrayList<ArrayList> mealList = meta.blockBuilder("dailymealplan");
						
						for(ArrayList<String> row : mealList){
							out.print("<tr>");
							for(String value : row){
								out.print("<td>");
								out.print(value);
								out.print("</td>");
								
							}
							out.print("</tr>");
						}
					
					%>
				</table>
		    	
		    </div>
		    <div class = "modal-background1-2" id = "supp">
		    	<!--  PAGE 3 -->
		    	 <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Supplement Count</th>
						<th>Protein Total</th>
						<th>Caffeine Total</th>
						<th>Creatine Total</th>
					</tr>
					
					<%
						// for every column
						ArrayList<ArrayList> suppList = meta.blockBuilder("supplementplan");
						
						for(ArrayList<String> row : suppList){
							out.print("<tr>");
							for(String value : row){
								out.print("<td>");
								out.print(value);
								out.print("</td>");
								
							}
							out.print("</tr>");
						}
					
					%>
				</table>
		    </div>
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
	<!-- Content in the modal -->
	  <div class="modal-body">
		    <div class = "modal-background1-1" id = "home">
		    	<!--  PAGE 1 -->
		    	<h1>Retrieve data from database in jsp</h1>
			<table class = "data" border="1">
			<tr>
				<th>Workout Plan</th>
				<th>Number of Workouts per day</th>
				<th>Goal</th>
				<th>Intensity Rating</th>
				<th>Length</th>
				<th>Author</th>
				<th>Equip Needed</th>
			</tr>
			
			<%
			// for every column
			ArrayList<ArrayList> tempList2 = meta.blockBuilder("workoutplan");
			
			for(ArrayList<String> row : tempList2){
				out.print("<tr>");
				for(String value : row){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
			}
		
			%>
			</table>
		    </div>
		    <div class = "modal-background1-2" id = "meal">
		    	<!--  PAGE 2 -->
			    <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Calorie Count</th>
						<th>Protein Count</th>
						<th>Carb Count</th>
						<th>Meals Per Day</th>
					</tr>
					
					<%
						// for every column
						ArrayList<ArrayList> mealList2 = meta.blockBuilder("dailymealplan");
						
						for(ArrayList<String> row : mealList2){
							out.print("<tr>");
							for(String value : row){
								out.print("<td>");
								out.print(value);
								out.print("</td>");
								
							}
							out.print("</tr>");
						}
					
						
							//for every value in that column
						System.out.println();
					%>
				</table>
		    	
		    </div>
		    <div class = "modal-background1-2" id = "supp">
		    	<!--  PAGE 3 -->
		    	<table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Supplement Count</th>
						<th>Protein Total</th>
						<th>Caffeine Total</th>
						<th>Creatine Total</th>
					</tr>
					
					<%
						// for every column
						ArrayList<ArrayList> suppList2 = meta.blockBuilder("supplementplan");
						
						for(ArrayList<String> row : suppList2){
							out.print("<tr>");
							for(String value : row){
								out.print("<td>");
								out.print(value);
								out.print("</td>");
								
							}
							out.print("</tr>");
						}
					
					%>
				</table>
		    </div>
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
		    <div class = "modal-background1-1" id = "home">
		    	<!--  PAGE 1 -->
		    	<h1>Retrieve data from database in jsp</h1>
			<table class = "data" border="1">
				<tr>
					<th>Workout Plan</th>
					<th>Number of Workouts per day</th>
					<th>Goal</th>
					<th>Intensity Rating</th>
					<th>Length</th>
					<th>Author</th>
					<th>Equip Needed</th>
				</tr>
				
				<%
				// for every column
				ArrayList<ArrayList> tempList3 = meta.blockBuilder("workoutplan");
				
				for(ArrayList<String> row : tempList3){
					out.print("<tr>");
					for(String value : row){
						out.print("<td>");
						out.print(value);
						out.print("</td>");
						
					}
					out.print("</tr>");
				}
		
				%>
			</table>
		    </div>
		    <div class = "modal-background1-2" id = "meal">
		    	<!--  PAGE 2 -->
			    	<table class = "data" border="1">
				<tr>
					<th>Name</th>
					<th>Calorie Count</th>
					<th>Protein Count</th>
					<th>Carb Count</th>
					<th>Meals Per Day</th>
				</tr>
				
				<%
				// for every column
				ArrayList<ArrayList> mealList3 = meta.blockBuilder("dailymealplan");
				
				for(ArrayList<String> row : mealList3){
					out.print("<tr>");
					for(String value : row){
						out.print("<td>");
						out.print(value);
						out.print("</td>");
						
					}
					out.print("</tr>");
				}
			
				
					//for every value in that column
				System.out.println();
				%>
				</table>
		    	
		    </div>
		    <div class = "modal-background1-2" id = "supp">
		    	<!--  PAGE 3 -->
		    	<table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Supplement Count</th>
						<th>Protein Total</th>
						<th>Caffeine Total</th>
						<th>Creatine Total</th>
					</tr>
					
					<%
						// for every column
						ArrayList<ArrayList> suppList3 = meta.blockBuilder("supplementplan");
						
						for(ArrayList<String> row : suppList3){
							out.print("<tr>");
							for(String value : row){
								out.print("<td>");
								out.print(value);
								out.print("</td>");
								
							}
							out.print("</tr>");
						}
					
					%>
				</table>
		    	
		    </div>
	  </div>
	  <div class="modal-footer">
	    <h3>Lose some weight</h3>
	  </div>
	</div>


</div>
	
<div class = "bg4" id = "supps" >
	<h2 class = "subtitle">Supplements</h2>
	
	<!-- The grid: three columns -->
	<!-- Three columns -->
<table class = "fit">
	<tr class="suppRow">
	  <td class="columnsupp" id ="box1" onclick="openTab('b1');" style="background:#333;">
	    Fat Burner
	  </td>
	  <td class="columnsupp" id ="box2" onclick="openTab('b2');" style="background:#333;">
	    Protein Heavy
	  </td>
	  <td class="columnsupp" id = "box3" onclick="openTab('b3');" style="background:#333;">
	    Energy Blend
	  </td>
	  <td class="columnsupp" id = "box4" onclick="openTab('b4');" style="background:#333;">
	    Endurance
	  </td>
	  <td class="columnsupp" id = "box5" onclick="openTab('b5');" style="background:#333;">
	    NCAA Approved
	  </td>
	</tr>
</table>
<!-- Full-width columns: (hidden by default) -->
<div id="b1" class="containerTab" style="background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Fat Burner</h2>
  <p>
  	<%
		// for every column
		ArrayList<ArrayList> fburn = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> temp = new ArrayList<String>();
		String cValue = "";
		for(ArrayList<String> row : fburn){
			if(row.contains("Fat Burner")){
				cValue = row.get(1);
				temp.add(cValue);
			}
		}
		ArrayList<ArrayList> val = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : val){
			if(temp.contains(row2.get(0))){
				System.out.println(row2);
					}
				
			}
		
		
	%>
  </p>
</div>

<div id="b2" class="containerTab" style="background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Protein Heavy</h2>
  <p>
  	
  </p>
  </div>

<div id="b3" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Energy Blend</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div>

<div id="b4" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Endurance</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div>

<div id="b5" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>NCAA Approved</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div>
	
</div>

<div class = "bg5" id = "about" >
	<h2 class = "subtitle">Meet the Creators</h2>
		<table class="creators">
			<tr>
				<th>
					<p>Sean Joyce</p>
				</th>
				<th>
					<p>Tyler Iverson</p>
				</th>
			</tr>
			<tr class = "lifeData">
				<td class = "each">
				 <p>
				 	Started his Fitness Lifestyle: 5 Years Ago 
				 	<br>
				 	Favorite Workout: Lats and Biceps 
				 	<br>
				 	Least Favorite Workout: Cardio  
				 	<br>
				 	Workouts Per Week: 6
				 	<br>
				 	
				 					 
				 	
				 	
				 
				 </p>
				</td>
				<td class = "each">
				 <p>
				 	Started his Fitness Lifestyle: 8 Years Ago 
				 	<br>
				 	Favorite Workout: Chest and Shoulders
				 	<br>
				 	Least Favorite Workout: Abs  
				 	<br>
				 	Workouts Per Week: 6
				 	<br>
				 	</p>
				</td>
			</tr>
		</table>
</div>

<div class = "bg6" id = "contact" >
	<h2 class = "subtitle">Contact</h2>
</div>




</body>

</html>