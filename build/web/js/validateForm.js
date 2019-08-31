function validateForm(){
    var error = document.getElementById('errorRegister');
    var userName = document.forms[1].txtUsername.value;
    if (userName == ""){
        error.innerHTML = 'Empty Username';
        return false;
    }

    var password = document.forms[1].txtPassword.value;
    if (password == ""){
        error.innerHTML = 'Empty Password';
        return false;
    }

    var email = document.forms[1].txtEmail.value;
    var emailPattern = /[a-z0-9]+@[a-z0-9]+\.+[a-z]/i;
    if (!email.match(emailPattern)){
        error.innerHTML = 'Invalid email';
        return false;
    }
    var reEmail = document.forms[1].txtReEmail.value;
    if (email != reEmail){
        error.innerHTML = 'Re-email doesn\'t macht';
        return false;
    }
    error.innerHTML = "";
    alert('Register success!');
    return true;
}