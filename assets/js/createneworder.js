//format total order with comma
//var totalOrderInput = document.querySelector("input[name=totalorder]");
//totalOrderInput.addEventListener("keyup", () => {
//    let totalOrder = totalOrderInput.value.replace(/[^0-9]/g, '').replace(/,/g, '');
//    totalOrderInput.value = numberWithComma(totalOrder);
//});

document.addEventListener('DOMContentLoaded', () => {
    document.querySelector('input[name=customerphone').focus();
});

//submit form
var createOrderBtn = document.querySelector("#neworder__confirm");
createOrderBtn.addEventListener("click", () => {
    showLoading();
    var customerPhone = document.querySelector("input[name=customerphone]").value;
    var customerName = document.querySelector("input[name=customername]").value;
    var totalOrder = document.querySelector("input[name=totalorder]").value.replace(/,/g, '');

    var formData = new FormData();
    formData.append("customerphone", customerPhone);
    formData.append("customername", customerName);
    formData.append("totalorder", totalOrder);

    xhr(main_http_server + "ajax/createNewOrder.gbe", formData, (res) => {
        var response = JSON.parse(res);
        if(response.error == '') {
            location.href = main_http_server;
        } else {
            endLoading();
            document.querySelector("#loginTitle").innerText = "Thông báo";
            document.querySelector("#loginError").innerText = response.error;
            document.querySelector("#loginErrorModal").style.display = "flex";
        }
    });
}, "post");

//Enter to Submit
document.querySelector('.input__totalorder').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        document.getElementById("neworder__confirm").click();
    }
});

var formInputs = document.querySelectorAll(".neworder__input");
formInputs.forEach((orderInput) => {
    orderInput.addEventListener("focus", (e) => {
        e.target.scrollIntoView();
    })
})

