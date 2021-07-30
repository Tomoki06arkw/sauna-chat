$(function(){
  $('.s_01 .accordion_one .accordion_header').on('click',function(){
    $(this).next('.accordion_inner').slideToggle();
    $(this).toggleClass("open");
  });
});

$(function(){
  const INDEX = "-visible";
  const TIMEOUT = 2000;
  const $target = $(".title");

  setInterval(() => {
    $target.addClass(INDEX);
    setTimeout(() => {
      $target.removeClass(INDEX);
    }, TIMEOUT);
  }, TIMEOUT * 2);
});

$(function(){
  $('h1').fadeIn(10000);
});

$(function(){
  $('#top-btn').on('click', function(){
    $(window).scrollTop(0);  
  });
});
