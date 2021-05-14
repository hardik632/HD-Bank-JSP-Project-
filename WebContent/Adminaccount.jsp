<html>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	
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
			<A href="AdminHome.html"><IMG SRC="pictures/12.png" height="50px"
				width="50px"></IMG></A> <A href="index.html" style="float: right"><img
				height="50px" width="50px" src="pictures/14.png"></A>
			<h1>
				HD - BANK<span class="style1"></span>
			</h1>
			<h2>Corporate Banking application</h2>

		</div>

		<div id="navigation">
			<ul>
				<li><a href="Adminaccount.jsp">All ACCOUNTS</a></li>
				<li><a href="Admindeposit.jsp">DEPOSIT</a></li>
				<li><a href="Adminwithdraw.jsp">WITHDRAW</a></li>
				
				
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
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
						PreparedStatement ps = con.prepareStatement("Select * from newaccount");
						ResultSet rs = ps.executeQuery();
						out.print("<table align='left' cellspacing='5' cellpadding='5' border=1px>");
						out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
						while (rs.next()) 
						{

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

					}

					catch (SQLException e) {
						e.printStackTrace();
					}
					%>
				</table> <%

 %>
			
	</table>
	</body>
	</html>

