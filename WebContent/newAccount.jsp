<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     
<html>
<head>
<meta charset="ISO-8859-1">
<title>HD BANKS</title>
</head>
<body>

        <%
    	try{
    		String username=request.getParameter("username");
    		String password=request.getParameter("password");
    		String repassword=request.getParameter("repassword");
    		String amount=request.getParameter("amount");
    		String address=request.getParameter("address");
    		String phone=request.getParameter("phone");
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
    	    PreparedStatement ps = cn.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?)");
    		ps.setString(1,null);
    		ps.setString(2,username);
    		ps.setString(3,password);
    		ps.setString(4,repassword);
    		ps.setString(5,amount);
    		ps.setString(6,address);
    		ps.setString(7,phone);
			 int i = ps.executeUpdate();
             
             if(i>0)
             {

      			%>
                <jsp:forward page="index.jsp"></jsp:forward>
            	<%
             }
             else
             {
            	%>
            	<jsp:include page="newAccount.html"></jsp:include>
 				<%
             }
	}
	catch(Exception ex){
	%>
	<%
	ex.printStackTrace();
	out.println("Something went wrong please try again.");
	}
	%>

</body>
</html>