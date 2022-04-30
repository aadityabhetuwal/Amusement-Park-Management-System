<%@page import="java.util.*, java.lang.*, java.io.*"%>

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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Customer</title>
    <!-- CSS only -->
    <script src="./scripts/jquery.min.js"></script>
    <script src="./scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
    
    <style>
        .wrapper{
            border: 2px solid lightgray;
            min-width: 400px;
            width: 50vw;
            min-height: 400px;
            /* height: 50vh; */
        }

        #fpass, #update-details{
            cursor: pointer;
        }

    </style>
</head>



<body class="container justify-content-center align-items-center">
    

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
                        <a href="#" class="nav-link">Home</a>
                    </li>

                    <li class="nav-item active">
                        <a href="index.jsp" class="nav-link">logout</a>
                    </li>

                    <li class="nav-item active">
                        <a href="booking.jsp" class="nav-link">Back</a>
                    </li>

                    <li class="nav-item active">
                        <a href="#" class="nav-link">
                            
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>  

    <div class="container d-flex gap-3" style="margin-top: 20vh;">

        <div class="btn-wrappers text-center ">
            <ul class="list-group">
                <li id="fpass" class="list-group-item forgot-pass">Update password</li>
                <li id="update-details" class="list-group-item">Update details</li>
            </ul>
        </div>

        <form  action="updatePassword.jsp" method="post" id="pass-layout">
            <div class="wrapper d-flex flex-column gap-2 p-2 justify-content-center">

                <div class="d-flex gap-2 m-3 w-75 justify-content-center flex-column">
                    <label for="currpass text-nowrap ">Current Password</label>
                    <input type="password" name="currpass" id="currpass" 
                        class="form-control" placeholder="Password">
                </div>

                <div class="d-flex gap-2 m-3 w-75  justify-content-center flex-column">
                    <label for="newpass text-nowrap ">New Password</label>
                    <input type="password" name="newpass" id="newpass" 
                        class="form-control" placeholder="New password">
                    <small class="text-muted form-text">
                        Password should have atleast 8 charaters, one uppercase and lowercase letter, 
                        one digit and one special symbol  
                    </small>
                </div>
                <div class="d-flex gap-2 m-3 w-75 justify-content-center flex-column">
                    <label for="conpass text-nowrap ">Confirm Password</label>
                    <input type="password" name="conpass" id="conpass" 
                        class="form-control" placeholder="Confirm password">
                </div>
                
                <div class="m-3">
                    <button type="submit" class="btn btn-primary my-2 w-25 align-self-center">Update</button>
                </div>
            </div>
        </form>

        <form action="updateDetails.jsp" id="details-layout">
            <div class="wrapper p-3 d-flex flex-column gap-2 justify-content-center">

                <div class="form-group py-2">
                    <label for="name">Name </label>
                    <input type="text" class="form-control disabled" id="name" name="name" readonly>
                </div>
                <div class="form-group py-2">
                    <label for="customer-id">Customer Id </label>
                    <input type="text" class="form-control disabled" id="customer-id" name="customerId" readonly>
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
                    <input type="number" class="form-control" name="weight" id="weight"  required>
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

                <div>
                    <button type="submit" class="btn btn-primary my-2 w-25 align-self-center">Update</button>
                    <a href="index.jsp"><button type="button" class="btn btn-secondary my-2">Go back</button></a>
                </div>

                <div id="log">

                </div>

            </div>
        </form>

    </div>

    <script>
        var active = false;

        $("#pass-layout").hide();
        $("#details-layout").hide();

        $("#fpass").click(function(){
            $(this).addClass("bg-primary text-white");

            if(active){
                $("#update-details").removeClass("bg-primary text-white");
                $("#details-layout").hide(300);
            }

            $("#pass-layout").show(300);

            active = true;
        });

        $("#update-details").click(function(){
            $(this).addClass("bg-primary text-white");

            $.get("fetchData.jsp", function(data, status){
//                $("#log").text(data);
                const vals = data.split(",");
                
                console.log(data);
                
                const valsObj = {
                    name: vals[0].split(":")[1],
                    customerId: vals[1].split(":")[1],
                    dob: vals[2].split(":")[1],
                    weight: vals[3].split(":")[1],
                    height: vals[4].split(":")[1],
                    age: vals[5].split(":")[1],
                    special: vals[6].split(":")[1],
                    bloodPressure: vals[7].split(":")[1],
                    phone1: vals[8].split(":")[1],
                    phone2: vals[9].split(":")[1],
                    state1: vals[10].split(":")[1],
                    city1: vals[11].split(":")[1],
                    street1: vals[12].split(":")[1],
                    state2: vals[13].split(":")[1],
                    city2: vals[14].split(":")[1],
                    street2: vals[15].split(":")[1]
                };
                
                $("#name").val(valsObj.name);
                $("#customer-id").val(valsObj.customerId);
                $("#date-of-birth").val(valsObj.dob);
                $("#weight").val(valsObj.weight);
                $("#height").val(valsObj.height);
                
                $("#phone1").val(valsObj.phone1);
                $("#phone2").val(valsObj.phone2);
                
                $("#state1").val(valsObj.state1);
                $("#city1").val(valsObj.city1);
                $("#street1").val(valsObj.street1);
            
                $("#state2").val(valsObj.state2);
                $("#city2").val(valsObj.city2);
                $("#street2").val(valsObj.street2);                

                if(valsObj.special === "null"){
                    $("#special").prop('checked', false);
                }else{
                    $("#special").prop('checked', true);
                }

                $("#bloodPressure").val(valsObj.bloodPressure);
                
                console.log(valsObj);
            });

            if(active){
                $("#fpass").removeClass("bg-primary text-white");
                $("#pass-layout").hide(300);
            }

            $("#details-layout").show(300);

            active = true;
        });

    </script>
</body>
</html>