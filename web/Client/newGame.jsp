<!DOCTYPE html>
<html lang="en">
 

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a ride</title>

    <!-- JavaScript Bundle with Popper -->
    <link rel="stylesheet" href="./styles/buyStuff.css">
    <link rel="stylesheet" href="./styles/bootstrap.min.css">
    <script src="./scripts/bootstrap.min.js"></script>
</head>

<body>
    
    <div id="main-container" class="container-sm d-flex mt-5 flex-column align-items-center justify-content-center gap-2">
        
        <form action="" class="d-flex gap-2 flex-column ride-form form-control bg-light m-2">

            <div class="form-group">
                <label for="gameCenterChoice" name="game-center-label" class="form-label">
                    Select a game center</label>
                <select name="gameCenterChoice" id="gameCenterChoice" title="Select a food court" class="form-select ">
                    <option value="">Select a game center</option>
                    <option value="">Game Center 1</option>
                    <option value="">Game Center 2</option>
                    <option value="">Game Center 3</option>
                </select>
            </div>
        </form>

        <div class="container d-flex align-content-center m-3 flex-wrap ">
            <div class="card card-size p-2 m-2" >
                <div class="card-body">
                    <div class="d-flex align-content-center justify-content-start">
                        <input type="checkBox" name="{gift-id}" class="card-checks" 
                                value="ride-id" class="form-check d-inline ">
                        <span class="display-5 card-title m-2">{Game name}</span>
                    </div>
                    <p class="card-text text-wrap">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam modi explicabo odit tenetur repellendus ratione delectus</p>
                    <p class="card-text" style="font-size: 1.3em;">${price}</p>

                    <a href="#" class="btn-sm btn-primary more-info p-2 rounded">
                        See more
                    </a>
                </div>
            </div>
        </div>
        
        <div class="checkout d-flex flex-column gap-2 mb-5 align-items-center justify-content-center w-75">
            <!-- logic for checkout --> 
            <ul class="list-group w-50 text-center">
                <li class="list-group-item items">{Item} - {Price}</li>
                <li class="list-group-item items">{Item} - {Price}</li>
                <li class="list-group-item items">{Item} - {Price}</li>
            </ul>

            <div class="d-flex align-items-center justify-content-center" style="font-size: 1.3em">
                <p class="text-center">Total: ${total}</p>
            </div>
            
            <button type="button" class="w-25btn btn-primary btn-sm p-2 rounded">
                Checkout</button>
        </div>
    </div>
</body>


</html>