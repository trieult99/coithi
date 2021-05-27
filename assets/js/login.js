var loginSubmitBtn = document.querySelector("#frmlogin__submitbtn");

loginSubmitBtn.addEventListener("click", () => {
    showLoading();
    var username = document.querySelector("input[name=username]").value;
    var password = document.querySelector("input[name=password]").value;

    var formData = new FormData();
    formData.append("username", username);
    formData.append("password", password);
    xhr(main_http_server + "ajax/submitLogin.gbe", formData, (res) => {
        console.log(res);
        var response = JSON.parse(res);
        if (response.error == '') {
            location.href = main_http_server;
        } else {
            endLoading();
            document.querySelector("#loginError").innerText = response.error;
            document.querySelector("#loginErrorModal").style.display = "flex";
        }
    });
}, "post");

//Enter to Submit
document.querySelector('#login__userpassword').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        document.getElementById("frmlogin__submitbtn").click();
    }
});