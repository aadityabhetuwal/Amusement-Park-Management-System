
const ridePopup = document.querySelector(".floating-popup.ride");
const rideBtn = document.querySelector("#ride-btn");

ridePopup.style.visibility = 'hidden';

function clickHandler(event){
    event.preventDefault();

    console.log(event.target);

    if(ridePopup.contains(event.target) || event.target == rideBtn){
        ridePopup.style.visibility = 'visible';
    }else{
        ridePopup.style.visibility = 'hidden';
    }
}

document.addEventListener("click", clickHandler);
