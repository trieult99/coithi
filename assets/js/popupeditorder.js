// Get the modal
var modal = document.getElementById("popupModal");
modal.style.display = "none";
// Get the button that opens the modal
//var btn = document.getElementById("buttonpopup");

// Get the <span> element that closes the modal
//var span = document.querySelectorAll("close")[0];

// When the user clicks on the button, open the modal
//btn.onclick = function() {
//    modal.style.display = "block";
//}

// When the user clicks on <span> (x), close the modal
//span.onclick = function() {
//    modal.style.display = "none";
//}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var btnCloseLoginPopup = document.getElementById("close-modal-delete");
btnCloseLoginPopup.onclick = function() {
    modal.style.display = "none";
}

function openDeleteConfirmPopup (){
    modal.style.display = "block";
    //
    //
}
