<link rel="stylesheet" href="scripts/bootstrap.min.js"/>

<%@page import="java.io.*, java.sql.*"%>
<%
    try{
        Class.forName("oracle.jdbc.OracleDriver");
    }
    catch(ClassNotFoundException e){
        out.println(e.getMessage());
    }
    
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", 
            "c##aadi", "aadi");

    Statement statement = connection.createStatement();

    ResultSet resultSet = statement.executeQuery("select username, password from admins");
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    RequestDispatcher rd = request.getRequestDispatcher("adminPlayground.jsp");
    RequestDispatcher rd2 = request.getRequestDispatcher("adminLogin.jsp");
    
    boolean registered = false;
    
    
    while(resultSet.next()){
        out.println(resultSet.getString("username"));
        
        if (resultSet.getString("username").equals(username) && 
                resultSet.getString("password").equals(password) ){
            request.setAttribute("valid", "valid");
            registered = true;
            break;
        }
    }
    
    if (registered){
        session.setAttribute("adminid", username);
        rd.forward(request, response);

    }else{
        request.setAttribute("valid", "invalid");
        rd2.include(request, response);
    }
    
%>
