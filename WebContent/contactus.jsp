<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>HD Banks</title>
</head>
<body>

	<%
	try {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "root");
		String s = "insert into contactus values(?,?,?,?)";

		PreparedStatement p = cn.prepareStatement(s);

		p.setString(1, name);
		p.setString(2, email);
		p.setString(3, phone);
		p.setString(4, message);

		int i = p.executeUpdate();

		if (i > 0) {
	%>
	<jsp:forward page="getintouch.html"></jsp:forward>
	<%
	} else {
	%>
	System.out.println("Something went wrong.");
	<jsp:include page="contactus.html"></jsp:include>
	<%
	}
	} catch (Exception ex) {
	%>
	<%
	out.println("Something went wrong please try again.");
	ex.printStackTrace();
	}
	%>

</body>
</html>