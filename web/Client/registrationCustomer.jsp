<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Customer</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="container justify-content-center align-items-center">
    
    <nav class="navbar navbar-expand-lg navbar-light fixed-top nav-bag-col" style ="background-color: rgba(252, 235, 252, .9)">
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

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-nowrap" href="#" role="button" 
                            data-bs-toggle="dropdown" id="bookingDropDown" aria-expanded="false"> 
                            Book rides
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="bookingDropDown">
                            <li><a href="#" class="dropdown-item">Book rides</a></li>
                            <li><a href="#" class="dropdown-item">Book rides</a></li>
                            <li><a href="#" class="dropdown-item">Book rides</a></li>
                            <li><a href="#" class="dropdown-item">Book rides</a></li>
                        </ul>
                    </li>

                    <li class="nav-item active">
                        <a href="#" class="nav-link">Cart</a>
                    </li>

                    <li class="nav-item active">
                        <a href="#" class="nav-link">
                            <%
                                String userId = (String) session.getAttribute("userid");
                                
                                if(userId != null){
                                    out.println(userId);
                                }else{
                                    out.println("Profile");
                                }
                            %>
                        </a>
                    </li>


                </ul>
            </div>
        </div>
    </nav>
                        
    <div class="container border border-dark rounded " 
        style="margin : 10vh 0; margin-top: 25vh;">
        
        <div class="display-1 text-center mb-5">XYZ Amusement Park</div>
    
    <form class="container w-50" method="post" action="AddCustomer.jsp">
        <div class="form-group py-2">
            <label for="name">Name </label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group py-2">
            <label for="customer-id">Customer Id </label>
            <input type="text" class="form-control" id="customer-id" name="customerId" required>
            <%@page import="java.sql.*"%>
            <%
                Class.forName("oracle.jdbc.OracleDriver");
                
                Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", 
                        "c##aadi", "aadi");
                Statement st = connection.createStatement();
                
                if (request.getAttribute("customerIdUsed") != null && 
                    request.getAttribute("customerIdUsed").equals("used"))
                    out.println("<div><small style='color:red'>Customer Id already used.</small></div>");
                    
                connection.close();
                
            %>
        </div>

        <div class="form-group py-2">
            <label for="password">Password </label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="form-group py-2">
            <label for="date-of-birth">Date of Birth</label>
            <input type = "date" class="form-control" name="DOB" id = "date-of-birth" required>
        </div>

        <div class="form-group py-2">
            <div>Phone Number</div>
            <label for="phone1">Phone 1</label>
            <input type="text" id="phone1" name="phone1" class="form-control" >
            <label for="phone2">Phone 2</label>
            <input type="text" id="phone2" name="phone2" class="form-control" >
        </div>

        <div class = "form-group py-2">
            <label for = "weight">Weight (kg)</label>
            <input type="number" class="form-control" name="ceight" id = "weight"  required>
        </div>
        <div class="form-group py-2">
            <label for = "height" >Height (cm) </label>
            <input type="number" class="form-control" name="height" id="height"  required>
        </div>

        <div class="form-group py-2">
            <label for = "height" >Blood Pressure</label>
            <input type="number" class="form-control" name="bloodPressure" id="bloodPressure"  required>
        </div>
        

        <div class="form-group py-2">
            <div>Address 1</div>
            <label for="state1">State</label>
            <input type="text" class="form-control" name="state1" id="state1" >
            <label for="city1">City</label>
            <input type="text" class="form-control" name="city1" id="city1" >
            <label for="street1">Street</label>
            <input type="text" class="form-control" name="street1" id="street1" >
        </div>

        <div class="form-group py-2">
            <div>Address 2</div>
            <label for="state2">State</label>
            <input type="text" class="form-control" name="state2" id="state2" state">
            <label for="city2">City</label>
            <input type="text" class="form-control" name="city2" id="city2" city">
            <label for="street2">Street</label>
            <input type="text" class="form-control" name="street2" id="street2" street">
        </div>

        <div class="form-check py-2">
            <label for="special">Special</label>
            <input type="checkbox" class="form-check-input" name="special" id="special" value="special">
        </div>
        <button type="submit" class="btn btn-primary my-2">Register</button>
        <a href="index.jsp"><button type="button" class="btn btn-secondary my-2">Go Back</button></a>

      </form>
    </div>
</body>
</html>