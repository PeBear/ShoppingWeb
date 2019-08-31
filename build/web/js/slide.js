var slideIndex = 0;
showSlides();
function plusSlide(n) {
    slideIndex = slideIndex + Number(n);
    showSlides();
}

function showSlides() {
    var slides = document.getElementsByClassName("images-box");
    for (var i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    if (slideIndex > slides.length - 1) {
        slideIndex = 0;
    }
    if (slideIndex < 0) {
        slideIndex = slides.length-1;
    }
    slides[slideIndex].style.display = "block";
}
