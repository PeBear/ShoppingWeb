function showChildMenu(x) {
    var modal = document.getElementById(x);
    modal.style.display = "block";
}

function hideChildMenu(x) {
    var modal = document.getElementById(x);
    modal.onmouseleave = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
}