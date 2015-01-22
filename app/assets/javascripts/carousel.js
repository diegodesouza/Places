$(document).ready(function(){
  $('.index-carousel').slick({
    arrows: true,
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    centerPadding: '60px',
    variableWidth: true
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
