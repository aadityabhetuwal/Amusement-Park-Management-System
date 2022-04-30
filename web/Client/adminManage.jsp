<%
    String adminId = (String)session.getAttribute("adminid");

    if( adminId == null ){
        response.sendRedirect("adminLogin.jsp");
    }
%>

<%@page import="java.sql.*, java.io.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Playground</title>
    
    <!-- CSS only -->
    <script src="./scripts/jquery.min.js"></script>
    <script src="./scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
</head>

    
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position-fixed w-100 top-0 start-0">
        <div class="container-fluid">
            <a href="#" class="navbar-brand m-3">XYZ Amusement Park</a>

            <div class="w-100">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarContent" aria-controls="navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>  

            <div class="collapse navbar-collapse d-flex text-right" id="navbarContent">

                <ul class="navbar-nav ml-auto gap-2 m-3">
                    <li class="nav-item active">
                        <a href="adminManage.jsp" class="nav-link">Mange records</a>
                    </li>

                    <li class="nav-item active">
                        <a href="adminPlayground.jsp" class="nav-link">Playground</a>
                    </li>

                    <li class="nav-item active">
                        <a href="adminLogout.jsp" class="nav-link">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <form id="delete-form">
        <div id="main-container" class="container d-flex flex-column gap-2 align-items-center justify-content-center"
            style="margin-top: 25vh;">
                
            <div class="display-4 text-center">
                Admin Manage
            </div>
               
            <div class="h1 text-center mt-5">
                Customer
            </div>
            <%
                try{
                    Class.forName("oracle.jdbc.OracleDriver");
                    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
                    Statement stm = connection.createStatement();


                    ResultSet rs = stm.executeQuery("select * from customer");
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnCount = rsmd.getColumnCount();
                        
                    
                    out.println("<table class='table'><thead><tr>");
                    out.println("<td scope=\"col\">#</td>");
                    
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
                        out.println("<td scope=\"row\">"
                        + "<input type=\"checkbox\" name=\"checked\" autocomplete=\"off\"" 
                        + "value=\"" + rs.getInt(1) + "\" class=\"form-check-input checked-items\">");

                        for(int i = 1; i <= columnCount; i++){
                            out.println(
                                "<td>" + rs.getObject(i) + "</td>"
                            );
                        }
                        out.println("</tr>");
                    }

                    out.println("</tbody></table>");
                    
                    stm.close();
                    rs.close();
                    connection.close();
                }catch(Exception e){
                    e.printStackTrace(new java.io.PrintWriter(out));
                }
            %>
            
            
            <button id="delete-btn" class="btn-primary w-25 p-2 " type="submit">
                Delete selected.
            </button>
            
        </div>
            
        <div id="display-result"> </div>

    </form>
            
    <form id="delete-employee-form">
        <div id="main-container" class="container d-flex flex-column gap-2 align-items-center justify-content-center"
            >
                
            <div class="h1 text-center mt-5">
                Employee
            </div>
            <%
                try{
                    Class.forName("oracle.jdbc.OracleDriver");
                    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
                    Statement stm = connection.createStatement();


                    ResultSet rs = stm.executeQuery("select * from employee");
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnCount = rsmd.getColumnCount();
                                        
                    out.println("<table class='table'><thead><tr>");
                    out.println("<td scope=\"col\">#</td>");
                    
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
                        out.println("<td scope=\"row\">"
                        + "<input type=\"checkbox\" name=\"checked\" autocomplete=\"off\"" 
                        + "value=\"" + rs.getInt(1) + "\" class=\"form-check-input checked-employees\">");

                        for(int i = 1; i <= columnCount; i++){
                            out.println(
                                "<td>" + rs.getObject(i) + "</td>"
                            );
                        }
                        out.println("</tr>");
                    }

                    out.println("</tbody></table>");
                       
                    stm.close();    
                    rs.close();
                    connection.close();
                }catch(Exception e){
                    e.printStackTrace(new java.io.PrintWriter(out));
                }
            %>
            
            <button id="delete-employee-btn" class="btn-primary w-25 p-2 " type="submit">
                Delete selected Employee
            </button>

        </div>
        
        <div id="display-employee-result"> </div>

    </form>
    
    <script>
        $("#display-result").html("");
        
        $("#delete-form").on('submit', function(e){
            
            var items = $(".checked-items");
            
            var sentData = {custIds:[], tableName : "customer"};
            
            for(var i = 0; i < items.length; i++){
                if(items[i].checked){
                    sentData.custIds.push(items[i].value);
                }   
            }
            
            console.log(sentData);
            
            $.ajax({
                type: "GET",
                url: "deleteCustomer.jsp", 
                data: sentData,  
                contentType: "application/x-www-url-form-encoded; charset=utf-8",
                
                success: function(data, status, xhr){
                    alert(data);
                    window.location.reload();
                },
                
                error: function(err){
                    console.log("error");
                    console.log(err);
                }
            });
            
            e.preventDefault();
        });
        
        $("#delete-employee-form").on('submit', function(e){
            
            var items = $(".checked-employees");
            
            var sentData = {empIds :[], tableName : "employee"};
            
            for(var i = 0; i < items.length; i++){
                if(items[i].checked){
                    sentData.empIds.push(items[i].value);
                }   
            }
            
            console.log(sentData);
            
            $.ajax({
                type: "GET",
                url: "deleteCustomer.jsp", 
                data: sentData,  
                contentType: "application/x-www-url-form-encoded; charset=utf-8",
                
                success: function(data, status, xhr){
                    alert(data);
                    window.location.reload();
                },
                
                error: function(err){
                    console.log("error");
                    console.log(err);
                }
            });
            
            e.preventDefault();
        });
        
    </script>
</body>
</html>
