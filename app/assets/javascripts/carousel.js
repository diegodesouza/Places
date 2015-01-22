$(document).ready(function(){
  $('.index-carousel').slick({
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    slide: 'div',
    cssEase: 'linear',
    autoplay: true,
    autoplaySpeed: 4000,
    slidesToShow: 3,
    adaptiveHeight: false
  });
});



$(document).ready(function(){
$('.carousel').slick({
  centerPadding: '60px',
  centerMode: true,
  dots: true,
  infinite: true,
  speed: 500,
  fade: true,
  slide: 'div',
  cssEase: 'linear'
});
});
