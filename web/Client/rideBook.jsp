<%
    String userId = (String)session.getAttribute("userid");

    if( userId == null ){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Rides</title>

    <!-- JavaScript Bundle with Popper -->
    <!--<link rel="stylesheet" href="./styles/buyStuff.css">-->
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
    <script src="./scripts/bootstrap.min.js"></script>
    
    <style>
        #main-container{
            /* margin-top: 25vh; */
            padding-top: 15vh;
            background : 
                url("https://img.freepik.com/free-vector/amusement-park-with-carousels-cartoon-style-urban-cityscape-circus_119523-1152.jpg");
            background-repeat: repeat-y;
            background-size: 75%;
            background-position: center center;
            width: 100vw;
            height: 100vh;
            position: relative;
            box-sizing: border-box;
            margin-top : 0 !important;
            
            /*color : #fff;*/
        }

    </style>
</head>

<body style='padding-top:400px'>
    
    <nav class="navbar navbar-expand-lg navbar-light fixed-top " style ="background-color: rgba(252, 235, 252, .9)">
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
                        <a href="booking.jsp" class="nav-link">Home</a>
                    </li>

                    <li class="nav-item active">
                        <a href="index.jsp" class="nav-link">logout</a>
                    </li>

                    <li class="nav-item active">
                        <a href="#" class="nav-link">Cart</a>
                    </li>

                    


                    <li class="nav-item active">
                        <a href="updateCustomer.jsp" class="nav-link">
                            Profile
                        </a>
                    </li>


                </ul>
            </div>
        </div>
    </nav>
                        
    <div id="main-container" 
        class="d-flex flex-column align-items-center justify-content-center" >
            
        <form action="" class="d-flex gap-2flex-column" >
            <div class="form-group">
                <label for="rideChoice" name="rideLabel" class="form-label">Select Ride Type</label>
                <select name="rideChoice" id="rideChoice" title="Select a ride" class="form-select ">
                    <option value="" hidden>Select ride type</option>
                    <option value="">All</option>
                    <option value="">Available</option>
                    <option value="">For me</option>
                </select>
                
            <%try{
                            if (request.getParameter("booked").equals("true")){
                                out.println("<p class='bg-light w-100 p-2'>Booked successfully</p>");
                            }
                            else if(request.getParameter("booked").equals("false")){
                                out.println("<p class='bg-light w-100 p-2'>Already been booked</p>");
                            }
                            }
                            catch(Exception e){
//                            out.println(e.getMessage());
                            }
        %>
        <%try{
                            if (request.getParameter("unbooked").equals("true")){
                                out.println("<p class='bg-light w-100 p-2'>Unbooked successfully</p>");
                            }
                            else if(request.getParameter("unbooked").equals("false")){
                                out.println("<p class='bg-light w-100 p-2'>Not been booked</p>");
                            }
                            }
                            catch(Exception e){
//                            out.println(e.getMessage());
                            }
        %>
            
            
        </form>
        </div>
        <%@page import="java.sql.*"%>

        
            <div class="d-flex align-content-center m-4 flex-wrap ">
                
                        
        <%
             try{
                        Class.forName("oracle.jdbc.OracleDriver");
                    }catch(ClassNotFoundException e){
                    
                    }
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
            PreparedStatement ps = connection.prepareStatement("select * from ride");

            ResultSet rs = ps.executeQuery();
            Integer ride_no;
            while (rs.next()){
                ride_no = rs.getInt(1);

            out.println("<div class=\"card card-size p-2 m-2\" >" +
            "<div class=\"card-body\">" +
            "    <div class=\"d-flex align-content-center \">" +
            "        <span class=\"display-5 card-title m-2\">Ride " + ride_no + "</span>" +
            "        <input type=\"checkBox\" name=\"{ride-id}\" class=\"mx-5\" " + 
            "                value=\"ride-id\">" +
             "  </div>" +
             "   <p class=\"card-text text-wrap\">" +
             "       Available Seats: " + rs.getObject(2) + "</p><p>" +
             "       location: Block " + rs.getObject(10) + " section " + rs.getObject(9) + "</p" +

             "   </p>"+
             "   <p class=\"card-text text-wrap\">Age requirement: " + rs.getObject(3) +"  </p>" +
             "      <p class=\"card-text text-wrap\">Height requirement: " + rs.getObject(5) +"  </p>" +
             "      <p class=\"card-text text-wrap\">Functional: " + rs.getObject(8) + " </p>" +
                                  "    <br>  <p class=\"card-text text-wrap\">Price: " + rs.getObject(11) + " </p>" +

             "   <a class=\"btn-sm btn-primary more-info p-2 rounded\" href=\"addCustomerRide.jsp?ride_no=" + ride_no + "\">" +
             
             "       Book"+
             "   </a>&nbsp; &nbsp;"+
             "   <a class=\"btn-sm btn-warning more-info p-2 rounded\" href=\"deleteCustomerRide.jsp?ride_no=" + ride_no + "\">" +
             
             "       Remove"+
             "   </a>"+
            "</div>" +
            "</div>");
            }
            %>

                                
                       
            </div>




            <div class="display-5">Bill for rides</div>

            <div class="checkout d-flex flex-column gap-2 mb-5 align-items-center justify-content-center w-75">
                <%
                   
                     Statement statement = connection.createStatement();
                     rs= statement.executeQuery("Select r.ride_no, r.price from ride r, customer_rides_ride crr where r.ride_no = crr.ride_no and crr.customer_id="+ session.getAttribute("userid"));
                     int total = 0;
                     out.println("<ul class='list-group w-50 text-center'>");
                     int price;
                     while (rs.next()){
                        price = rs.getInt(2);
                        total += price;
                        out.println("<li class='list-group-item items'>Ride " + rs.getObject(1) + "&nbsp; &nbsp; " + price  + "</li>");
                    }
                    out.println("</ul>");
                    out.println("<div class='d-flex align-items-center justify-content-center' style='font-size: 1.3em'>" +
                    "<p class='text-center'>Total: " + total + "</p>" +
                    "</div>");
                    
                %>


                

                <button type="button" class="w-25btn btn-primary btn-sm p-2 rounded">
                    Checkout</button>
            </div>
    </div>
</body>


</html>