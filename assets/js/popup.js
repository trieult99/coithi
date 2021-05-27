// Get the modal
var loginErrorModal = document.getElementById("loginErrorModal");

var btnCloseLoginPopup = document.getElementById("close-modal-login");
if(btnCloseLoginPopup) {
    btnCloseLoginPopup.onclick = function() {
        loginErrorModal.style.display = "none";
    };
}
