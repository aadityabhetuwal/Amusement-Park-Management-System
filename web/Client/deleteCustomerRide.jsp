<%-- 
    Document   : addCustomerRide
    Created on : Apr 29, 2022, 10:26:48 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer Ride</title>
        <%@page import = "java.sql.*"%>
        <%
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
        Statement stm = connection.createStatement();
        out.println(request.getParameter("ride_no"));
        boolean valid = true;
        try{
            stm.executeUpdate("delete from customer_rides_ride where customer_id = " + session.getAttribute("userid") + " and ride_no = " + request.getParameter("ride_no"));
            
            }catch(Exception e){
            out.println(e.getMessage());
            valid = false;
            }
            if (valid == true)
            response.sendRedirect("rideBook.jsp?unbooked=true");
            else
                        response.sendRedirect("rideBook.jsp?unbooked=false");

            %>
    </head>
    <body>
    </body>
</html>
