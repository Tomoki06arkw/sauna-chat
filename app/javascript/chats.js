$(function(){
 
  // モーダルウィンドウが開くときの処理    
  $(".modalOpen").on('click', function(){
      var navClass = $(this).attr("class"),
          href = $(this).attr("href");
              
          $(href).fadeIn();
      $(this).addClass("open");
      return false;
  });
  // モーダルウィンドウが閉じるときの処理    
  $(".modalClose").on('click', function(){
      $(this).parents(".modal").fadeOut();
      $(".modalOpen").removeClass("open");
      return false;
  });  
      
});


$(function(){
  $('.s_01 .accordion_one .accordion_header').on('click',function(){
    $(this).next('.accordion_inner').slideToggle();
    $(this).toggleClass("open");
    $('.s_01 .accordion_one .accordion_header').not($(this)).next('.accordion_one .accordion_inner').slideUp();
    $('.s_01 .accordion_one .accordion_header').not($(this)).removeClass("open");
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
  $('#top-btn').on('click', function() { 
    $('html, body').animate({scrollTop:0}, 300)
  }); 
});
