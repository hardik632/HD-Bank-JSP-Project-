
<html>

<head>
<SCRIPT>
	function dil(form) {
		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value == "") {
				alert("Fill out all Fields")
				document.F1.accountno.focus()
				return false
			}
		}

		if (isNaN(document.F1.accountno.value)) {
			alert("A/C No.  must  be  varchar & can't be null")
			document.F1.accountno.value = ""
			document.F1.accountno.focus()
			return false
		}

		if (!isNaN(document.F1.username.value)) {
			alert("User Name  must  be  char's & can't be null")
			document.F1.username.value = ""
			document.F1.username.focus()
			return false
		}

		if (!isNaN(document.F1.password.value)) {
			alert("Password  must  be  char's & can't be null")
			document.F1.password.value = ""
			document.F1.password.focus()
			return false
		}

		if (isNaN(document.F1.amount.value)) {
			alert("Amount  must  be  varchar & can't be null")
			document.F1.amount.value = ""
			document.F1.amount.focus()
			return false
		}

		return true
	}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HD BANKS</title>

<link href="index.css" rel="stylesheet" type="text/css">

</head>

<body onload = "hide()">
	<div id="top_links">

		<marquee style="background-color: yellow; color: blue;">"No
			carelessness until there is a cure" </marquee>

		<div id="header">
			<A href="home.html"><IMG SRC="pictures/12.png" height="50px"
				width="50px"></IMG></A> <A href="index.html" style="float: right"><img
				height="50px" width="50px" src="pictures/14.png"></A>
			<h1>
				HD - BANK<span class="style1"></span>
			</h1>
			<h2>Corporate Banking application</h2>

		</div>

		<div id="navigation">
			<ul>
				<li><a href="newAccount.html">NEW ACCOUNT</a></li>
				<li><a href="balance.jsp">BALANCE</a></li>
				<li><a href="deposit.jsp">DEPOSIT</a></li>
				<li><a href="withdraw.jsp">WITHDRAW</a></li>
				<li><a href="transfer.jsp">TRANSFER</a></li>
				<li><a href="closeac.jsp">CLOSE A/C</a></li>
				<li><a href="ministatement.jsp">TRANSACTIONS</a></li>
				<li><a href="fd.jsp">FD</a></li>
			</ul>
		</div>
	</div>

	<table style="background: #FFFFFF; margin: 0 auto;">
		<tr align="justify">
			<td width="400" valign="top"
				style="border-right: #666666 1px dotted;">
				<div id="services">
					<h1>Services</h1>
					<br>
					<ul>
						<li><a href="about.jsp">About Us</a></li>
						<li><a href="contactus.html">Contact Us</a></li>
					</ul>

				</div>
			</td>
			<td width="400" valign="top"
				style="border-right: #666666 1px dotted;">
				<div id="welcome">
					<h1>FIXED DEPOSIT FORM</h1>
					<br>
					<table>
						<tr>

						</tr>
						<tr>
							<td>
								<div>
									<%
									if (request.getAttribute("balance") != null) {
										out.print(request.getAttribute("balance"));
									}
									if (request.getAttribute("infbal") != null) {
										out.print(request.getAttribute("infbal"));
									}
									%>
								</div> 
							
								<input class="button button3" onclick="check(this)" id ="createfd" value="Create FD" /> 
								<br><br>
								<input class="button button3" onclick="check1(this)" id ="viewfd" value="View FD" /> 
								
								
								<script>
								function hide(){
									document.getElementById("fd").style.display = "none";
									document.getElementById("fd1").style.display = "none";
								}
								function check(val)
								{
									
									
									if(val.value=="Create FD"){
										document.getElementById("fd1").style.display="block";
										document.getElementById("fd").style.display = "none";
										document.getElementById("viewfd").value = "View FD";
									val.value ="Hide Create FD";
									}
									else{
										document.getElementById("fd1").style.display = "none";
										val.value ="Create FD";
									}
											
								}
								function check1(val)
								{
									
									
									if(val.value=="View FD"){
										document.getElementById("fd").style.display="block";
										document.getElementById("fd1").style.display = "none";
										document.getElementById("createfd").value = "Create FD";
									val.value ="Hide view FD";}
									else{
										document.getElementById("fd").style.display = "none";
										val.value ="View FD";
									}
											
								}
								</script>

								<form name=F1 id="fd" onSubmit="return dil(this)"
									action="fddb1.jsp" method="post">
									<table>
										<tr>
											<td>ACCOUNT NO:</td>
											<td><input type="text" name="accountno" /></td>
										</tr>
										<tr>
											<td>USER NAME:</td>
											<td><input type="text" name="username" /></td>
										</tr>
										<tr>
											<td>PASSWORD:</td>
											<td><input type="password" name="password" /></td>
										</tr>
										<tr>
											<td></td>
											<td><input class="button button2" type="submit"
												value="Submit" /> <input class="button button3"
												type="reset" value="Clear" /></td>
									</table>
								</form>
								<form name=F1 id="fd1" onSubmit="return dil(this)"
									action="fddb.jsp" method="post">
									<table>
										<tr>
											<td>ACCOUNT NO:</td>
											<td><input type="text" name="accountno" /></td>
										</tr>
										<tr>
											<td>USER NAME:</td>
											<td><input type="text" name="username" /></td>
										</tr>
										<tr>
											<td>PASSWORD:</td>
											<td><input type="password" name="password" /></td>
										</tr>
										<tr>
											<td>AMOUNT:</td>
											<td><input type="text" name="amount" /></td>
										</tr>
										<tr>
											<td>Tenure:</td>
											<td><input type="text" name="tenure" /></td>
										</tr>
										<tr>
											<td></td>
											<td><input class="button button2" type="submit"
												value="Submit" /> <input class="button button3"
												type="reset" value="Clear" /></td>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
			</td>
			<td width="400" valign="top"
				style="border-right: #666666 1px dotted;">
				<div id="welcome">
					<h1>Interst Rate</h1>
					<br>
			
						<img src="pictures/fd.PNG" alt="business" width="350" height="400">


				</div>
			</td>


		</tr>
	</table>
	<div id="footer_top">
		<div id="footer_navigation"></div>
		<marquee style="background-color: yellow; color: blue;">Beware
			of fictitious offers/ lottery winnings/ cheap funds offers</marquee>
		<div id="footer_copyright">

			<div class="slideshow-container">
				<div class="mySlides fade">
					<img src="pictures/5.jpg" style="width: 128%; height: 400px">
				</div>
				<div class="mySlides fade">
					<img src="pictures/4.jpg" style="width: 128%; height: 400px">
				</div>

				<div class="mySlides fade">
					<img src="pictures/3.jpg" style="width: 128%; height: 400px">
				</div>

				<div class="mySlides fade">
					<img src="pictures/2.jpg" style="width: 128%; height: 400px">
				</div>

				<div class="mySlides fade">
					<img src="pictures/1.jpg" style="width: 128%; height: 400px">
				</div>

			</div>
			<br>
			<div style="text-align: center">
				<span class="dot"></span> <span class="dot"></span> <span
					class="dot"></span> <span class="dot"></span> <span class="dot"></span>
			</div>
			<marquee style="background-color: yellow; color: blue;">HD
				never asks for your Card/PIN/OTP/CVV details on phone, message or
				email. Please do not click on links received on your email or mobile
				asking your Bank/Card details. | Attention Retail/Corporate INB
				Users, transaction OTP will be made mandatory for all merchant
				related transactions, hence please have your mobile 
				registered if the same has not been done until now.</marquee>
			Copyright © HD BANKS
		</div>
		<script>
			var slideIndex = 0;
			showSlides();

			function showSlides() {
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("dot");
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				slideIndex++;
				if (slideIndex > slides.length) {
					slideIndex = 1
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
				setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
		</script>


	</div>

</body>
</html>