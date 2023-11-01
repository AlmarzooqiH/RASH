function login() {
    const formBorder = document.getElementById("login-signup-form");
    const loginForm = document.getElementById("login");
    const signupForm = document.getElementById("signup");
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
    formBorder.style.height = "520px";
    formBorder.style.width = "600px";
    formBorder.style.transition = "height 0.6s, width 0.6s";
    loginForm.style.visibility = "visible";
<<<<<<< HEAD
    loginBtn.style.backgroundColor = "#546ad5";
    loginBtn.style.color = "white";
    signupForm.style.visibility = "hidden";
    signupForm.style.marginTop = "-1000px";
=======
    signupForm.style.visibility = "hidden";
    loginBtn.style.backgroundColor = "#546ad5";
    loginBtn.style.color = "white";
>>>>>>> db88fef557e9f670d853121edb801760381e6e15
    signupBtn.style.background = "transparent";
    signupBtn.style.cursor = "pointer";
}

function signup() {
    const formBorder = document.getElementById("login-signup-form");
    const loginForm = document.getElementById("login");
    const signupForm = document.getElementById("signup");
    const loginBtn = document.getElementById("login-btn");
    const signupBtn = document.getElementById("signup-btn");
<<<<<<< HEAD
    formBorder.style.height = "620px";
    formBorder.style.width = "650px";
=======
    formBorder.style.height = "570px";
    formBorder.style.width = "1000px";
>>>>>>> db88fef557e9f670d853121edb801760381e6e15
    formBorder.style.transition = "height 0.6s, width 0.6s";
    loginForm.style.visibility = "hidden";
    signupForm.style.visibility = "visible";
    signupForm.style.marginLeft = "center";
    signupForm.style.marginTop = "center";
<<<<<<< HEAD
    signupForm.style.marginTop = "-525px";
=======
>>>>>>> db88fef557e9f670d853121edb801760381e6e15
    signupBtn.style.backgroundColor = "#546ad5";
    signupBtn.style.color = "white";
    loginBtn.style.cursor = "pointer";
    loginBtn.style.background = "transparent";
}

document.getElementById("login-btn").addEventListener("click", login);
document.getElementById("signup-btn").addEventListener("click", signup);
