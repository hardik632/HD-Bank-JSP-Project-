<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<SCRIPT LANGUAGE="JavaScript">
        function dil(form) {
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value == "") {
                    alert("Fill out all Fields")
                    document.F1.accountno.focus()
                    return false
                }
            }

            if (isNaN(document.F1.accountno.value)) {
                alert("Accountno must  be  varchar & can't be null")
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

            return true
        }
    </SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HD BANKS</title>

<link href="index.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


</head>

<body>
	<div id="top_links">

		<marquee style="background-color: white;">"No carelessness
			until there is a cure" </marquee>

		<div id="header">
			<A href="home.html"><IMG SRC="pictures/12.png" height="50px"
				width="50px"></IMG></A>
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
				<li><a href="about.jsp">ABOUT US</a></li>
			</ul>
		</div>

		<table style="background: #FFFFFF; margin: 0 auto;">
			<tr align="justify">
				<td width="400" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
							<li><a href="#">New Account</a></li>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Apply for a Loan</a></li>
						</ul>
					</div>
				</td>
				<td width="400" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="welcome">
						<h1>CLOSE ACCOUNT FORM</h1>
						<br>
						<table align="center" bgcolor="white">
							<tr>

							</tr>
							<tr>
								<td>
									<div>
										<%if(request.getAttribute("balance")!=null) {
                                            out.print(request.getAttribute("balance")); } %>
									</div>
									<form name=F1 onSubmit="return dil(this)" action="closeac.jsp">
										<table cellspacing="5" cellpadding="3">
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
													type="reset" value="Clear" />
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
						<h1>Welcome</h1>
						<br>
						<center>
							<img src="pictures/11.gif" alt="business" width="196"
								height="106">
						</center>
						<br>
						<p>Welcome to HD BANKS. Here you can create new account ,
							withdraw money , deposit money , transfer money , check balance
							and can close your account online.</p>

					</div>
				</td>


			</tr>
		</table>
<div id="footer_top">
			<div id="footer_navigation"></div>
			<marquee style="background-color: yellow; color: blue;">Beware of fictitious offers/ lottery winnings/ cheap funds offers</marquee>
			<div id="footer_copyright">

				<div class="slideshow-container">
					<div class="mySlides fade">
						<img src="pictures/5.jpg" style="width: 142%; height: 400px">
					</div>
					<div class="mySlides fade">
						<img src="pictures/4.jpg" style="width: 142%; height: 400px">
					</div>

					<div class="mySlides fade">
						<img src="pictures/3.jpg" style="width: 142%; height: 400px">
					</div>

					<div class="mySlides fade">
						<img src="pictures/2.jpg" style="width: 142%; height: 400px">
					</div>

					<div class="mySlides fade">
						<img src="pictures/1.jpg" style="width: 142%; height: 400px">
					</div>

				</div>
				<br>
				<div style="text-align: center">
					<span class="dot"></span> <span class="dot"></span> <span
						class="dot"></span> <span class="dot"></span> <span class="dot"></span>
				</div>
				<marquee style="background-color: yellow; color: blue;">HD
					never asks for your Card/PIN/OTP/CVV details on phone, message or
					email. Please do not click on links received on your email or
					mobile asking your Bank/Card details. | Attention Retail/Corporate
					INB Users, transaction OTP will be made mandatory for all merchant
					related transactions, hence please have your mobile varchar
					registered if the same has not been done until now.</marquee>
				Copyright � HD BANKS
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
                    if (slideIndex > slides.length) { slideIndex = 1 }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";
                    setTimeout(showSlides, 2000); // Change image every 2 seconds
                }
            </script>


		</div>


	</div>

</body>

</html>