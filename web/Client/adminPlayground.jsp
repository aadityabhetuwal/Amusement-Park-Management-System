<%
    String adminId = (String)session.getAttribute("adminid");

    if( adminId == null ){
        response.sendRedirect("adminLogin.jsp");
    }
%>

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
    
    <form id="query-form" >
        <div id="main-container" class="container d-flex flex-column gap-2 align-items-center justify-content-center"
            style="margin-top: 25vh;">
                
            <div class="display-4 text-center">
                Admin Playground
            </div>

            <textarea  id="query-area" name="query-area" 
                    class="form-control w-100 p-2" rows="10" placeholder="your query goes here">
            </textarea>
            
            <button id="query-btn" class="btn-primary w-25 p-2 " type="submit">
                Run query
            </button>

        </div>
    </form>
    
    <div class="d-flex container align-items-center justify-content-center gap-2 m-2"
        id="display-result">
        
    </div>
    <script>
        
        $("#query-form").on('submit', function(e){
            
            var sentData = {queryStr: $("#query-area").val()};
            
            console.log(sentData);
            
            $.ajax({
                type: "GET",
                url: "getResult.jsp", 
                data: sentData,  
                contentType: "application/x-www-url-form-encoded; charset=utf-8",
                
                success: function(data, status, xhr){
                    console.log(data);
                    $("#display-result").html(data);
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
