<%@page import="java.util.*, java.lang.*, java.sql.*, java.io.*"%>

<%
    String adminId = (String) session.getAttribute("adminid");
        
    if( adminId == null ){
        response.sendRedirect("adminLogin.jsp");
    }

    String tableName = request.getParameter("tableName");
    String[] params = null;
    
    if(tableName.equals("customer") ){
        params = request.getParameterValues("custIds[]");
    }else{
        params = request.getParameterValues("empIds[]");
    }
//    for(int i = 0; i < params.length; i++){
//        out.println(params[i]+ " ");
//    }
   
    try{
        Class.forName("oracle.jdbc.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
        
        PreparedStatement ps = null;
           
        if(tableName.equals("customer") ){
            ps = connection.prepareStatement(
                "delete from customer where customer_id = ?");
        }else{
            ps = connection.prepareStatement(
                "delete from employee where employee_id = ?");
        }
        
        
        for(int i = 0; i < params.length; i++){
            ps.setInt(1, Integer.parseInt(params[i]));
            ps.execute();
        }
        
        connection.close();
        
        if(tableName.equals("customer") ){
            out.println(String.format("Deleted %d customer records", params.length));
        }else{
            out.println(String.format("Deleted %d employees", params.length));        
        }
    }catch(Exception e){
//        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("Employee couldn't be deleted");
    }
%>
