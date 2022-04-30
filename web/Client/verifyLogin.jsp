<link rel="stylesheet" href="scripts/bootstrap.min.js"/>

<%@page import="java.io.*, java.sql.*"%>
<%
    try{
        Class.forName("oracle.jdbc.OracleDriver");
    }
    catch(ClassNotFoundException e){
        out.println(e.getMessage());
    }
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");

    Statement statement = connection.createStatement();

    ResultSet resultSet = statement.executeQuery("Select customer_id, name, password from customer");
    
    String customerId = request.getParameter("customerId");
    String password = request.getParameter("password");
    
    RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
    RequestDispatcher rd2 = request.getRequestDispatcher("index.jsp");
    
    boolean registered = false;
    while(resultSet.next()){

        if (resultSet.getString("customer_id").equals(customerId) && resultSet.getString("password").equals(password)){
            request.setAttribute("valid", "valid");
            registered = true;
            break;
        }
    }
    
    if (registered){
        rd.forward(request, response);
        session.setAttribute("userid", customerId);
    }else{
        request.setAttribute("valid", "invalid");
        rd2.include(request, response);
    }
    
%>
