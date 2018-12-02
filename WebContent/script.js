window.onload = function(){ 

	// Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.addEventListener('click', function(event) {
		if (event.target == modal) {
	        modal.style.display = "none";}
	});
	//
	//
	//
	// Get the modal
	var modal2 = document.getElementById('myModal2');
	
	// Get the button that opens the modal
	var btn2 = document.getElementById("myBtn2");
	
	// Get the <span> element that closes the modal
	var span2 = document.getElementsByClassName("close2")[0];
	
	// When the user clicks the button, open the modal 
	btn2.onclick = function() {
	    modal2.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span2.onclick = function() {
	    modal2.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	// When the user clicks anywhere outside of the modal, close it
	window.addEventListener('click', function(event) {
		if (event.target == modal2) {
	        modal2.style.display = "none";}
	});
	//
	//
	
	
	
	
	//
	//
	//
	//
	// Get the modal
	var modal3 = document.getElementById('myModal3');
	
	// Get the button that opens the modal
	var btn3 = document.getElementById("myBtn3");
	
	// Get the <span> element that closes the modal
	var span3 = document.getElementsByClassName("close3")[0];
	
	// When the user clicks the button, open the modal 
	btn3.onclick = function() {
	    modal3.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span3.onclick = function() {
	    modal3.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	// When the user clicks anywhere outside of the modal, close it
	window.addEventListener('click', function(event) {
		if (event.target == modal3) {
	        modal3.style.display = "none";}
	});
	//
	//
	//
	//
	//
	// Hide all elements with class="containerTab", except for the one that matches the clickable grid column
			var b1 = document.getElementById('b1');
			var b2 = document.getElementById('b2');
			var b3 = document.getElementById('b3');
			var b4 = document.getElementById('b4');
			var b5 = document.getElementById('b5');
			var box1 = document.getElementById('box1');
			var box2 = document.getElementById('box2');
			var box3 = document.getElementById('box3');
			var box4 = document.getElementById('box4');
			var box5 = document.getElementById('box5');
			
			box1.onclick = function(){
				b2.style.display = "none";
				b3.style.display = "none";
				b4.style.display = "none";
				b5.style.display = "none";
				b1.style.display = "block";
			}
			box2.onclick = function(){
				b1.style.display = "none";
				b3.style.display = "none";
				b4.style.display = "none";
				b5.style.display = "none";
				b2.style.display = "block";
			}
			box3.onclick = function(){
				b1.style.display = "none";
				b2.style.display = "none";
				b4.style.display = "none";
				b5.style.display = "none";
				b3.style.display = "block";
			}
			box4.onclick = function(){
				b1.style.display = "none";
				b2.style.display = "none";
				b3.style.display = "none";
				b5.style.display = "none";
				b4.style.display = "block";
			}
			box5.onclick = function(){
				b1.style.display = "none";
				b2.style.display = "none";
				b3.style.display = "none";
				b4.style.display = "none";
				b5.style.display = "block";
			}
			
			window.addEventListener('click', function(event) {
				if (event.target == box1) {
			        b1.style.display = "block";}
			});
			window.addEventListener('click', function(event) {
				if (event.target == box2) {
			        b2.style.display = "block";}
			});
			window.addEventListener('click', function(event) {
				if (event.target == box3) {
			        b3.style.display = "block";}
			});
	
	
	
};

