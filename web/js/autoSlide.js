var autoSlideIndex = 0;
var modal = document.getElementById("pathAutoImg");

var autoImg_soma = ["images/slide-soma1.jpg", "images/slide-soma2.jpg", "images/slide-soma3.jpg", "images/slide-soma4.jpg"]

var autoImg_amamaa = ["images/slide-amamaa1.jpg", "images/slide-amamaa2.jpg", "images/slide-amamaa3.jpg", "images/slide-amamaa4.jpg"];
var autoImg_op = ["images/slide-op1.jpeg", "images/slide-op2.jpg", "images/slide-op3.jpg", "images/slide-op4.jpg"];
var autoImg_fairy = ["images/slide-fairy1.jpg", "images/slide-fairy2.jpg", "images/slide-fairy3.jpg", "images/slide-fairy4.jpeg"];
var arr = autoImg_fairy;
function showAutoSlide(film) {
    if (film == "autoImg_amamaa"){
        arr = autoImg_amamaa;
    }
    if (film == "autoImg_op"){
        arr = autoImg_op;
    }
    if (film == "autoImg_soma"){
        arr = autoImg_soma;
    }
    if (film == "autoImg_fairy"){
        arr = autoImg_fairy;
    }
    runSlide();
    setInterval('runSlide()', 3000);
}

function runSlide(){
    autoSlideIndex++;
    if (autoSlideIndex > (arr.length - 1)) {
        autoSlideIndex = 0;
    }
    if (autoSlideIndex < 0) {
        autoSlideIndex = arr.length - 1;
    }
    modal.src = arr[autoSlideIndex];
}
