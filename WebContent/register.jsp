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
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String email = request.getParameter("email");
		String phonevarchar = request.getParameter("phoneno");
		String birthdate = request.getParameter("dob");
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "root");
		String s = "insert into signup values(?,?,?,?,?)";

		PreparedStatement p = cn.prepareStatement(s);

		p.setString(1, username);
		p.setString(2, password);
		p.setString(3, email);
		p.setString(4, phonevarchar);
		p.setString(5, birthdate);

		int i = p.executeUpdate();

		if (i > 0) {
	%>
	<jsp:forward page="login.html"></jsp:forward>
	<%
	} else {
	%>
	out.println("Something went wrong.");
	<jsp:include page="register.html"></jsp:include>
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