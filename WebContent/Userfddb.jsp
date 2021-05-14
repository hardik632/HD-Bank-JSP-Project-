<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HD BANKS</title>

<link href="index.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div id="top_links">

		<marquee style="background-color: yellow; color: blue;">"No
			carelessness until there is a cure" </marquee>

		<div id="header">
			<A href="Userhome.html"><IMG SRC="pictures/12.png" height="50px"
				width="50px"></IMG></A> <A href="index.html" style="float: right"><img
				height="50px" width="50px" src="pictures/14.png"></A>
			<h1>
				HD - BANK<span class="style1"></span>
			</h1>
			<h2>Corporate Banking application</h2>

		</div>

		<div id="navigation">
			<ul>
				<li><a href="UsernewAccount.html">NEW ACCOUNT</a></li>
				<li><a href="Userbalance.jsp">BALANCE</a></li>
				<li><a href="Usertransfer.jsp">TRANSFER</a></li>
				<li><a href="Userministatement.jsp">TRANSACTIONS</a></li>
				<li><a href="Userfd.jsp">FD</a></li>
				<li><a href="Usercloseac.jsp">CLOSE A/C</a></li>
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
			<td width="800" valign="top">
				<%

				%>
				<table>
					<%
					String accountno = request.getParameter("accountno");
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String amount = request.getParameter("amount");
					String tenure = request.getParameter("tenure");
					int amt = Integer.parseInt(amount);
					boolean status = false;

					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
					PreparedStatement ps = cn
							.prepareStatement("Select * from NEWACCOUNT where accountno=? and username = ? and password =?");
					ps.setString(1, accountno);
					ps.setString(2, username);
					ps.setString(3, password);

					ResultSet rs = ps.executeQuery();
					status = rs.next();
					int balance =rs.getInt(5);
					try {
							if (status == true) {
								out.print("Welcome   " + username);
								out.println("<hr>");
								if(balance<amt)
								{
									request.setAttribute("infbal", "There is a not enough balance in your account ");
									%>
									<jsp:forward page="Userfd.jsp"></jsp:forward>
									<%
								}
								
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
								String des = "fd";
								DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
								LocalDateTime now = LocalDateTime.now();
								PreparedStatement ps5 = con.prepareStatement("insert into ministatement values(?,?,?,?)");
								ps5.setString(1, accountno);
								ps5.setString(2, des);
								ps5.setString(3, amount);
								ps5.setString(4,dtf.format(now));
								ps5.executeUpdate();
								
								PreparedStatement ps55 = con.prepareStatement("insert into fd values(?,?,?,?,?)");
								ps55.setString(1, accountno);
								ps55.setString(2, username);
								ps55.setString(3, amount);
								ps55.setString(4,dtf.format(now));
								ps55.setString(5,tenure);
								ps55.executeUpdate();
							

								PreparedStatement ps1 = con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
								ps1.setString(1, accountno);
								ResultSet rs1 = ps1.executeQuery();
								int dataamount = 0;

								if (rs1.next()) {
									dataamount = rs1.getInt(5) - amt;

								}
								
								Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
								PreparedStatement ps2 = con1
								.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + accountno + "'");
								ps2.setInt(1, dataamount);
								ps2.executeUpdate();
								ResultSet rs2 = ps1.executeQuery();
								

								if (rs2.next()) {
							//out.print("There is a debit in your Balance,Updated Balance: ");
							request.setAttribute("totaldataamount", amt);
							request.setAttribute("balance", "Fixed Depoist Created for amount  ");
						%>
						<jsp:forward page="Totalbalance.jsp"></jsp:forward>
						<%
						}

						} else {
					out.print("Please check your username and Password");
					request.setAttribute("balance", "Please check your username and Password");
					%>
					<jsp:forward page="Userfd.jsp"></jsp:forward>
					<%
					}
					} catch (SQLException e) {
					e.printStackTrace();
					}
					%>
				</table> <%%>
			
	</table>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.time.*"%>
	<%@ page import="java.time.format.*"%>