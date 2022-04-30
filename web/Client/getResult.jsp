<%@page import="oracle.jdbc.OracleTypes"%>
<%@page import="java.util.*, java.lang.*, java.sql.*, java.io.*"%>

<%
    String adminId = (String) session.getAttribute("adminid");
        
    if( adminId == null ){
        response.sendRedirect("adminLogin.jsp");
    }
    
    String text = request.getParameter("queryStr");
    text = text.strip();
    
    if(text.endsWith(";")){
                text = text.substring(0, text.length() - 1);
            }
   
    try{
        Class.forName("oracle.jdbc.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
        Statement stm = connection.createStatement();

        
        if( text.stripLeading().toLowerCase().startsWith("select") ){ 
            
            ResultSet rs = stm.executeQuery(text);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            
            out.println("<table class='table'><thead><tr>");

            String[] colNames = new String[columnCount];
            
            for (int i = 1; i <= columnCount; i++ ) {
                colNames[i - 1] = rsmd.getColumnName(i);
                out.println(String.format("<th scope=\"col\">%s</th>", 
                    colNames[i - 1]) 
                );
            }
            
            out.println("</tr></thead><tbody>");
            
            while( rs.next() ){
                out.println("<tr>");
                
                for(int i = 1; i <= columnCount; i++){
                    out.println(
                        "<td>" + rs.getObject(i) + "</td>"
                    );
                }
                out.println("</tr>");
            }
            
            out.println("</tbody></table>");
        }else if (text.stripLeading().toLowerCase().startsWith("call getname")){
                try{
                text = "{" + text + "}";
                text = text.replace(")", ",?)");
//                out.println(text);
                CallableStatement callStmt = connection.prepareCall(text);
                callStmt.registerOutParameter(1, Types.VARCHAR);
                callStmt.executeQuery();
                
                out.println("<p >The customer id belongs to " + (String)callStmt.getObject(1) + "</p>");
    }catch(SQLException e){
    out.println("Customer id not available");
    }

        }else if (text.stripLeading().toLowerCase().startsWith("call getrides")){
//        try{
//                out.println(text);
                text = "{" + text + "}";
                text = text.replace("(", "(?,");
                text = text.replace(")", ",?, ?)");
//                out.println(text);
                CallableStatement callStmt = connection.prepareCall(text);
//                out.println("test1");
                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
//                out.println("Test a");
                callStmt.registerOutParameter(2, Types.INTEGER);
                callStmt.registerOutParameter(3, Types.INTEGER);
//                out.println("test2");
                callStmt.executeQuery();
//                out.println("test3");
                ResultSet rs = (ResultSet) callStmt.getObject(1);
                out.println("<br><br>The rides for the customer are: ");
                while (rs.next()){
                out.println("<br>Ride no: " + rs.getInt(1) + "&nbsp; &nbsp");
                out.println("Block no: " + rs.getInt(2));
    }
//
//    }catch(SQLException e){
//    out.println("Cusomter id not available");
//    }
        }else if(text.stripLeading().toLowerCase().startsWith("call getdesignation")){
                text = "{? = " + text + "}";
                try{
                CallableStatement callStmt = connection.prepareCall(text);
                callStmt.registerOutParameter(1, Types.VARCHAR);
                callStmt.executeQuery();
                
                out.println("The designation of the employee is " + callStmt.getObject(1));
    }catch(SQLException e){
        out.println("Employee details not available");
//        e.printStackTrace(new java.io.PrintWriter(out));
    }

    }
    
        else{
            int updates = stm.executeUpdate(text);
            
            out.println(
                String.format("<div>%d rows affected.</div>", updates)
            );
        }

        
        connection.close();
    }catch(Exception e){
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
