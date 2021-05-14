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
					boolean status = false;

					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
					PreparedStatement ps = cn
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
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
							PreparedStatement ps1 = con.prepareStatement("Select * from ministatement where accountno=?");
							ps1.setInt(1, accountno);
							ResultSet rs1 = ps1.executeQuery();

							out.print("<table align='left' cellspacing='5' cellpadding='5' border=1px>");
							out.print("<tr><th>ACCOUNT NO</th><th>DESCRIPTION</th><th>AMOUNT</th><th>DATE</th></tr>");
							while (rs1.next()) {
						int accountno1 = rs1.getInt(1);
						session.setAttribute("accountno", accountno1);

						System.out.print(accountno);

						out.print("<tr>");
						out.print("<td>" + rs1.getString(1) + "</td>");
						out.print("<td>" + rs1.getString(2) + "</td>");
						out.print("<td>" + rs1.getInt(3) + "</td>");
						out.print("<td>" + rs1.getString(4) + "</td>");
						out.print("</tr>");

							}
							out.print("</table>");

						} else {
							out.print("Please check your username and Password");
							request.setAttribute("balance", "Please check your username and Password");
					%>
					<jsp:forward page="Userministatement.jsp"></jsp:forward>
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