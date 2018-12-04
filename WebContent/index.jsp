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
	</div>
</div>
<!-- Page content -->
<div class="main" id = "main">
</div>
<table class = "searchTable">
	<tr>
		<td>
			<h1>
	  			Wellness Plans  	
	 	 	</h1>
	 	 <td>
	</tr>
	<tr>
		<td>
			<div>
				“Strength does not come from the physical capacity. It comes from an indomitable will.” – Ghandi
			</div>
		</td>
		<td>
			<div class ="bigboy">
				Search our Wellness Database or Browser Categories Below!
			</div>
		</td>
		
	</tr>
	<tr>
		<td class = "searchColumn">
			<div class="dropdown">
			  <button class="dropbtn">Pick a Category</button>
			  <div class="dropdown-content">
			    <a href="?plan=workoutplan">Workout Plans</a>
			    <a href="?plan=supplementplan">Supplement Plans</a>
			    <a href="?plan=dailymealplan">Meal Plans</a>
			  </div>
			</div>
		</td>
		<td class = "searchColumn">
			<div class="dropdown">
				<% 
			  		try{
			  			String plan = request.getParameter("plan");
			  			if (plan != null && !plan.isEmpty()) {
			  				if(plan.equals("workoutplan")){
			  					out.print("<button class='dropbtn'>Workout Plans</button>");
				  				out.print("<div class='dropdown-content'>");
				  				for(String line: meta.valuePull("workoutplan","WorkoutPlan")){
				  					out.print("<a href='?plan="+plan+"&planD="+line+"'>"+line+"</a>");
				  				}
				  				out.print("</div>");
			  				}
			  				if(plan.equals("supplementplan")){
			  					out.print("<button class='dropbtn'>Supplement Plans</button>");
				  				out.print("<div class='dropdown-content'>");
				  				for(String line: meta.valuePull("supplementplan","Name")){
				  					out.print("<a href='?plan="+plan+"&planD="+line+"'>"+line+"</a>");
				  				}
				  				out.print("</div>");
			  				}
			  				if(plan.equals("dailymealplan")){
			  					out.print("<button class='dropbtn'>Meal Plans</button>");
				  				out.print("<div class='dropdown-content'>");
				  				for(String line: meta.valuePull("dailymealplan","name")){
				  					out.print("<a href='?plan="+plan+"&planD="+line+"'>"+line+"</a>");
				  				}
				  				out.print("</div>");
			  				}
			  			}
			  		}
			  		catch(NullPointerException e){
			  			
			  		}
			  	%>
			  </div>
			</div>
		</td>
		<td class = "searchColumn">
			<div class="dropdown">
				<% 
			  		try{
			  			String planD = request.getParameter("planD");
			  			String plan = request.getParameter("plan");
			  			int counter = 0;
			  			if (planD != null && !planD.isEmpty()) {
			  				String table = "";
			  				String table2 = "";
			  				if(plan.equals("workoutplan")){
			  					table = "workout_has_exercise";
			  					table2 = "exercise";
			  					
			  				}
			  				else if (plan.equals("supplementplan")){
			  					table = "supplementplan_has_supplement";
			  					table2 = "supplement";
			  					counter = 1;
			  					
			  				}
			  				else if (plan.equals("dailymealplan")){
			  					table = "dailymealplan_has_meal";
			  					table2 = "meal";
			  					counter = 1;
			  					
			  				}
			  					
			  				
		  					out.print("<button class='dropbtn'>"+planD+"</button>");
		  					out.print("</div>");
		  					out.print("</td>");
		  					out.print("</tr>");
		  					out.print("</table>");
		  					
			  				
			  				ArrayList<ArrayList> end = meta.blockBuilder(table);
				  			
				  			ArrayList<String> temp = new ArrayList<String>();
				  			String cValue = "";
				  			for(ArrayList<String> row : end){
				  				if(row.contains(planD)){
				  					cValue = row.get(counter);
				  					temp.add(cValue);
				  				}
				  			}
				  			out.print("<table class = 'sResults'>");
				  			ArrayList<String> cols = new ArrayList<String>();
				  			cols = meta.colReturn(table2);
				  			out.print("<tr>");
				  			for(String col1 : cols){
				  				
	  						out.print("<th>");
	  						out.print(col1);
	  						out.print("</th>");
			  	
				  			}
				  			
				  			out.print("</tr>");
				  			ArrayList<ArrayList> val = meta.blockBuilder(table2);
				  			for(ArrayList<String> row2 : val){
				  				if(temp.contains(row2.get(0))){
				  					out.print("<tr>");
				  					for(String value : row2){
				  						out.print("<td class = 'cell1'>");
				  						out.print(value);
				  						out.print("</td>");
				  						
				  					}
				  					out.print("</tr>");
				  						}
				  					
				  			}
				  			out.print("</table>");
			  			
			  			}
			  		}
			  		catch(NullPointerException e){
			  			
			  		}
			  	%>
			  </div>
		</td>
	</tr>
</table>

<!--
 <h2 class = "subtitle">
 Wellness is something that you choose to pursue. It’s a choice you make in life that requires constant effort to achieve.
While associated with a healthy lifestyle, wellness goes beyond the confines of general health. It encompasses a positive outlook on your mind, body, and soul and is something we often have more control over than health.
Wellness has various dimensions and can be viewed a quality, state, or process.
 </h2>
-->
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
	        
	      </div>
	    </div>
	  </td>
	
	  <td class="column">
	    <div class="card">
	      <img src="Pics/olympic.jpg" alt="Mike" style="width:100%">
	      <div class="container">
	        <h2>Olympic Lifts</h2>
	        
	    </div>
	  </td>
	
	  <td class="column">
	    <div class="card">
	      <img src="Pics/running.jpg" alt="John" style="width:100%">
	      <div class="container">
	        <h2>Running/Cardio</h2>
	        
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
	    <h2>Quick Overview</h2>
	  </div>
	 <div class="modal-body">
		    <div class = "modal-background1-1" id = "home">
		    	<!--  PAGE 1 -->
		    	<h1>Quick View Some Plans Below</h1>
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
						<th>Meal Plan</th>
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
						<th>Supplement Plan</th>
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
						<th>Meal Plan</th>
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
						<th>Supplement Plan</th>
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
  <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>When To Take</th>
						<th>Usage</th>
	
					</tr>
 
  	<%
		// for every column
		ArrayList<ArrayList> end = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> temp = new ArrayList<String>();
		String cValue = "";
		for(ArrayList<String> row : end){
			if(row.contains("Fat Burner")){
				cValue = row.get(1);
				temp.add(cValue);
			}
		}
		ArrayList<ArrayList> val = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : val){
			if(temp.contains(row2.get(0))){
				out.print("<tr>");
				for(String value : row2){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
					}
				
			}
		
		
	%>
	</table>
  
</div>

<div id="b2" class="containerTab" style="background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Protein Heavy</h2>
  <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>When To Take</th>
						<th>Usage</th>
	
					</tr>
 
  	<%
		// for every column
		ArrayList<ArrayList> phe = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> temp2 = new ArrayList<String>();
		String cValue2 = "";
		for(ArrayList<String> row : phe){
			if(row.contains("Protein Heavy")){
				cValue2 = row.get(1);
				temp2.add(cValue2);
			}
		}
		ArrayList<ArrayList> val2 = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : val2){
			if(temp2.contains(row2.get(0))){
				out.print("<tr>");
				for(String value : row2){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
					}
				
			}
		
		
	%>
	</table>
  </div>

<div id="b3" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Energy Blend</h2>
  <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>When To Take</th>
						<th>Usage</th>
	
					</tr>
 
  	<%
		// for every column
		ArrayList<ArrayList> eblend = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> etemp = new ArrayList<String>();
		String ecvalue = "";
		for(ArrayList<String> row : eblend){
			if(row.contains("Energy Blend")){
				ecvalue = row.get(1);
				etemp.add(ecvalue);
			}
		}
		ArrayList<ArrayList> val3 = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : val3){
			if(etemp.contains(row2.get(0))){
				out.print("<tr>");
				for(String value : row2){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
					}
				
			}
		
		
	%>
	</table>
</div>

<div id="b4" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Endurance</h2>
  <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>When To Take</th>
						<th>Usage</th>
	
					</tr>
 
  	<%
		// for every column
		ArrayList<ArrayList> end2 = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> temp4 = new ArrayList<String>();
		String cValue4 = "";
		for(ArrayList<String> row : end2){
			if(row.contains("Endurance")){
				cValue4 = row.get(1);
				temp4.add(cValue4);
			}
		}
		ArrayList<ArrayList> val4 = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : val4){
			if(temp4.contains(row2.get(0))){
				out.print("<tr>");
				for(String value : row2){
					out.print("<td>");
					out.print(value);
					out.print("</td>");
					
				}
				out.print("</tr>");
					}
				
			}
		
		
	%>
	</table>
</div>

<div id="b5" class="containerTab" style = "background:#333">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>NCAA Approved</h2>
  <table class = "data" border="1">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>When To Take</th>
						<th>Usage</th>
	
					</tr>
 
  	<%
		// for every column
		ArrayList<ArrayList> end4 = meta.blockBuilder("supplementplan_has_supplement");
		ArrayList<String> endtemp = new ArrayList<String>();
		String cendvalue = "";
		for(ArrayList<String> row : end4){
			if(row.contains("NCAA Approved")){
				cendvalue = row.get(1);
				endtemp.add(cendvalue);
			}
		}
		ArrayList<ArrayList> endval = meta.blockBuilder("supplement");
		for(ArrayList<String> row2 : endval){
			if(endtemp.contains(row2.get(0))){
				out.print("<tr>");
				for(String endvalue : row2){
					out.print("<td>");
					out.print(endvalue);
					out.print("</td>");
					
				}
				out.print("</tr>");
					}
				
			}
		
		
	%>
	</table>
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
				<img id = "img" src="Pics/joy.JPG" alt="sleepy">
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
				<img id = "img" src="Pics/ivy.JPG" alt="sleepy">
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



</body>

</html>