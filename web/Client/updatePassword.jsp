<%-- 
    Document   : UpdatePassword
    Created on : Apr 26, 2022, 12:02:45 PM
    Author     : Dell
--%>

<%@page import="java.sql.*, java.io.*" %>

<%
    String userId = (String)session.getAttribute("userid");

    if( userId == null ){
        response.sendRedirect("index.jsp");
    }
    
    String currPass = request.getParameter("currpass");
    String newPass = request.getParameter("newpass");
    String conPass = request.getParameter("conpass");
    String regex = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%])([a-zA-Z0-9!@#$%]){8,}$";
    
//    out.println(newPass.matches(regex));
    
    if( !newPass.matches(regex) ){
        out.println("<script> alert('Password should have Atleast one digit,"
           + " one upper and lower case character, one special symbol and be of length 8');"
           +" window.location='updateCustomer.jsp'; </script>");
    }
    
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
    Statement fetchQuery = connection.createStatement();
    String dbPass = null;
    
    ResultSet basicInfo = fetchQuery.executeQuery(
        String.format("select * from customer where customer_id = %d", Integer.parseInt(userId))
    );  
    
    while(basicInfo.next()){
        dbPass = basicInfo.getString("password");
    }
    
    basicInfo.close();
    fetchQuery.close();
    
    if( !dbPass.equals(currPass)){
        out.println("<script> alert('Incorrect password, please enter correct password');"
           +" window.location='updateCustomer.jsp'; </script>"); 
    }
        
//    out.println(currPass);
//    out.println(conPass);
    
    if( !newPass.equals(conPass) ){
        out.println("<script> alert('Password and confirm password should match');"
           +" window.location='updateCustomer.jsp'; </script>"); 
    }
    
    Statement updatePass = connection.createStatement();
    
    updatePass.executeUpdate(
        String.format("update customer set password = '%s' where customer_id = %d",
            newPass, Integer.parseInt(userId))
    );
    
    out.println("<script> alert('Password updated for customer with id " + 
        userId + "'); window.location='updateCustomer.jsp'; </script>");
    
    connection.close();
%>