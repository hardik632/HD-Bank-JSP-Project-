<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HD BANKS</title>

<link href="index.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	
</script>

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
				<li><a href="Usercloseac.jsp">CLOSE A/C</a></li>>
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

			<td width="1200" valign="top">
				<%

				%>
				<table>
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
						PreparedStatement ps1 = cn.prepareStatement("Select max(accountno) from newaccount");

						ResultSet rs1 = ps1.executeQuery();
						while (rs1.next()) {
							int accountno = rs1.getInt(1);
							request.setAttribute("accountno", accountno);
						}
						Integer accountno = (Integer) request.getAttribute("accountno");
						int amo = 0;

						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
						PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno='" + accountno + "'");
						ResultSet rs = ps.executeQuery();
						out.print("<h4>Welcome To HD BANKS, Here is your account details:</h4>");
						out.println("<hr>");
						out.print("<table align='left' border = 2 cellspacing='5' cellpadding='5'>");
						out.print(
						"<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
						while (rs.next()) {
							amo = rs.getInt(5);
							session.setAttribute("accountno", accountno);
							out.print("<tr>");
							out.print("<td>" + rs.getInt(1) + "</td>");
							out.print("<td>" + rs.getString(2) + "</td>");
							out.print("<td>" + rs.getString(3) + "</td>");
							out.print("<td>" + rs.getInt(5) + "</td>");
							out.print("<td>" + rs.getString(6) + "</td>");
							out.print("<td>" + rs.getLong(7) + "</td>");
							out.print("</tr>");

						}
						out.print("</table>");

						String des = "credit";
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
						LocalDateTime now = LocalDateTime.now();
						PreparedStatement ps2 = con.prepareStatement("insert into ministatement values(?,?,?,?)");
						ps2.setInt(1, accountno);
						ps2.setString(2, des);
						ps2.setInt(3, amo);
						ps2.setString(4,dtf.format(now));

						ps2.executeUpdate();
					}

					catch (SQLException e) {
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