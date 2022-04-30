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
    <title>Book your features</title>
    
    <link rel="stylesheet" href="styles/booking.css">
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
    <script src="./scripts/bootstrap.min.js"></script>
    
    <style>
        #main-container{
            /* margin-top: 25vh; */
            padding-top: 15vh;
            background : linear-gradient(rgba(252, 235, 252,.65), rgba(245, 243, 237,.85)), url("./images/light-bg.webp");
            background-repeat: repeat;
            background-size: 75%;
            background-position: center center;
/*            width: 100vw;
            height: 100vh;*/
            position: relative;
            box-sizing: border-box;
            margin-top : 0 !important;
            
            color : #000;
        }

    </style>
    
</head>


<body style="margin-top:5vh">
        
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
                        <a href="#" class="nav-link">Home</a>
                    </li>

                    

                    <li class="nav-item active">
                        <a href="#" class="nav-link">Cart</a>
                    </li>

                    <li class="nav-item active">
                        <a href="updateCustomer.jsp" class="nav-link">
                            Update Profile
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="index.jsp" class="nav-link">
                            Logout
                        </a>
                    </li>


                </ul>
            </div>
        </div>
    </nav>
    
    
    <div id="main-container" 
        class="d-flex flex-column align-items-center justify-content-center">
        <form class="input-form d-flex flex-row justify-content-around align-itmes-center  p-2 w-75" >

        <!--<form class="input-form d-flex m-2 gap-2 flex-row justify-content-around align-itmes-center container bg-light rounded p-2 w-75">-->
            <button id="ride-btn" class="btn btn-outline-success p-4" onclick="window.location.href='./rideBook.jsp'" type="button">
                Book a new ride
            </button>
    
            <button id="game-btn" class="btn btn-outline-success p-4" onclick="window.location.href='./newGame.jsp'" type="button">
                Book a new game
            </button>

            <button id="game-btn" class="btn btn-outline-success p-4" onclick="window.location.href='./buyGifts.jsp'" type="button">
                Buy Gifts
            </button>

            <button id="food-btn" class="btn btn-outline-success p-4" onclick="window.location.href='./buyFood.jsp'" type="button">
                Buy food coupons
            </button>
        </form>

        <footer class="container w-50 align-items-center justify-items-center">
            <div class="header text-center display-3 border-2 rounded p-2 w-50">Upcoming rides</div>
            
            
            
                <%@page import = "java.sql.*"%>
                <%
                    String customerId = request.getParameter("customerId");  
                    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery("Select r.ride_no,r.block_no, r.location  from ride r, customer_rides_ride crr where r.ride_no = crr.ride_no and customer_id = "+ session.getAttribute("userid"));
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnCount = rsmd.getColumnCount();

                    out.println("<div class=''><table class='table'><thead><tr>");

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
                    out.println("</table></div>");
                    %>
        </footer>

    </div>


</body>


</html>