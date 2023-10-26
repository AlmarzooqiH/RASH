function login() {
    const formBorder = document.getElementById("login-signup-form");
    const loginForm = document.getElementById("login");
    const signupForm = document.getElementById("signup");
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
    loginForm.style.visibility = "visible";
    signupForm.style.visibility = "hidden";
    loginBtn.style.backgroundColor = "#d098fb";
    loginBtn.style.color = "white";
    signupBtn.style.background = "transparent";
    signupBtn.style.cursor = "pointer";
    formBorder.style.height = "400px";
    formBorder.style.transition = "height 0.6s";
}
function signup() {
    const formBorder = document.getElementById("login-signup-form");
    const loginForm = document.getElementById("login");
    const signupForm = document.getElementById("signup");
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
    loginForm.style.visibility = "hidden";
    signupForm.style.visibility = "visible";
    formBorder.style.height = "600px";
    signupBtn.style.backgroundColor = "#d098fb";
    signupBtn.style.color = "white";
    loginBtn.style.cursor = "pointer";
    loginBtn.style.background = "transparent";
    formBorder.style.transition = "height 0.6s";
    signupForm.style.marginLeft = "50px";
    signupForm.style.marginTop = "-350px";

}
