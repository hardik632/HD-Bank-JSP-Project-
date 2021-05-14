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
					String num = request.getParameter("accountno");
					int accountno = Integer.parseInt(num);
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String num1 = request.getParameter("taccountno");
					int taccountno = Integer.parseInt(num1);
					String amoun = request.getParameter("amount");
					int add = Integer.parseInt(amoun);
					boolean status = false;
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
					PreparedStatement ps = con
							.prepareStatement("Select * from NEWACCOUNT where accountno=? and username = ? and password =?");
					ps.setInt(1, accountno);
					ps.setString(2, username);
					ps.setString(3, password);
					ResultSet rs = ps.executeQuery();
					status = rs.next();
					try {
						if (status == true) {
							out.print("Welcome   " + username);
							out.println("<hr>");
							out.println("Money Transfered from accountno. " + accountno + " to accountno." + taccountno);
							Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
							PreparedStatement ps1 = con1.prepareStatement("Select * from NEWACCOUNT where accountno=?");
							
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
							LocalDateTime now = LocalDateTime.now();
							String des = "Transfer_Depoist";
							PreparedStatement ps5 = con.prepareStatement("insert into ministatement values(?,?,?,?)");
							ps5.setInt(1, taccountno);
							ps5.setString(2, des);
							ps5.setString(3, amoun);
							ps5.setString(4,dtf.format(now));
							ps5.executeUpdate();
							
							
							String des1 = "Transfer_Withdraw";
							ps5.setInt(1, accountno);
							ps5.setString(2, des1);
							ps5.setString(3, amoun);
							ps5.setString(4,dtf.format(now));
							ps5.executeUpdate();
							
							ps1.setInt(1, taccountno);
							ResultSet rs1 = ps1.executeQuery();
							int dataamount = 0;
							if (rs1.next()) {
						dataamount = add + rs1.getInt(5);
							}
							Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
							PreparedStatement ps2 = con2
							.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + taccountno + "'");
							ps2.setInt(1, dataamount);
							ps2.executeUpdate();
							ResultSet rs2 = ps1.executeQuery();
							Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
							PreparedStatement ps3 = con3.prepareStatement("Select * from NEWACCOUNT where accountno=?");
							ps3.setInt(1, accountno);
							ResultSet rs3 = ps3.executeQuery();
							int dataamount1 = 0;
							if (rs3.next()) {
						dataamount1 = rs3.getInt(5) - add;
							}
							Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
							PreparedStatement ps4 = con4
							.prepareStatement("update NEWACCOUNT set amount=? where accountno='" + accountno + "'");
							ps4.setInt(1, dataamount1);
							ps4.executeUpdate();
							ResultSet rs4 = ps4.executeQuery();
						} else {
							out.print("Please check your username and Password");
							request.setAttribute("balance", "Please check your username and Password");
					%>
					<jsp:forward page="Usertransfer.jsp"></jsp:forward>
					<%
					}
					} catch (SQLException e) {
					e.printStackTrace();
					}
					%>
				</table> <%

 %>
			
	</table>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.time.*"%>
	<%@ page import="java.time.format.*"%>
