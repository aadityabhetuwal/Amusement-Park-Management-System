<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amusement park system</title>

    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
    <script src="./scripts/bootstrap.min.js"></script>
    
    <style>
        #main-container{
            /* margin-top: 25vh; */
            padding-top: 15vh;
            background : linear-gradient(rgba(252, 235, 252,.65), rgba(245, 243, 237,.85)), url("./images/light-bg.webp");
            /*filter: blur(8px);*/
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            width: 100vw;
            height: 100vh;
            position: relative;
            box-sizing: border-box;
            margin-top : 0 !important;
            
            color : #000;
        }
        

    </style>
</head>


<body >
    
    <nav class="navbar navbar-expand-lg navbar-light fixed-top " style ="background-color: rgba(252, 235, 252, .9)">
        <div class="container-fluid">
            <a href="#" class="navbar-brand m-3">XYZ Amusement Park</a>

            <div class="w-100">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarContent" aria-controls="navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>  

            <div class="collapse navbar-collapse justify-content-end" id="navbarContent">

                <ul class="navbar-nav ml-auto gap-2 m-3">
                    <li class="nav-item active">
                        <a href="index.jsp" class="nav-link text-nowrap">Customer Login</a>
                    </li>

                    <li class="nav-item active">
                        <a href="adminLogin.jsp" class="nav-link text-nowrap">Admin login</a>
                    </li>

                    <li class="nav-item active">
                        <a href="employeeLogin.jsp" class="nav-link text-nowrap">Employee login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div id="main-container"
        class="d-flex flex-column align-items-center rounded ">

        <div class="display-6 text-center">
            XYZ Amusement park
        </div>
        
        <div class="d-flex align-items-center justify-content-center w-100 ">
            
            <form class="container w-25 rounded border-dark bg-light p-5" action="verifyLogin.jsp">
                <div class="form-group py-2 ">

                    <label for="customerNo">Customer Number</label>
                    <input type="text" name="customerId" id="customerNo" 
                            class="form-control" placeholder="Customer Id" required>
                    </div>
                        
                <div class="form-group py-2">

                    <label for="customerPassword">Password</label>

                    <input type="password" name="password" id="customerPassword" 
                            class="form-control" placeholder="Password" required>
                    <%
                    
                    if (request.getAttribute("valid")!=null && request.getAttribute("valid").equals("invalid"))
                        out.println("<div><small style='color:red'>Invalid customer number/password </small></div>");
                %>
                </div>
                
                
                
                    <button id="submit" class="btn btn-outline-primary rounded my-2 p-2 w-100">Submit</button>

                    <div class="d-flex align-items-center justify-content-center pb-4">
                        <p class="mb-0 me-2">Don't have an account?</p>
                        <button type="button" class="btn btn-outline-danger" 
                            onclick="window.location.href='registrationCustomer.jsp'">Create new</button>
                    </div>                    
                
            </form>

            <div class="container w-25 rounded border-dark bg-light p-5">
                <div class="display-6">
                    About Us
                </div>
                <div class="text-left pt-5">
                    You are warmly welcomed to XYZ amusement park. We are delighted to 
                    provide you with reckless riding experience and extensive gaming environment.
                    <br><br>
                    Contact: 88034534366
                </div>
                
            </div>
        
        </div>

    </div>
    
   
</body>


</html>