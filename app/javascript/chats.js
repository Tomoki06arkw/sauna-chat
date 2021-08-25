//フェードイン・フェードアウト
$(function(){   
  $(".modalOpen").on('click', function(){
      var navClass = $(this).attr("class"),
          href = $(this).attr("href");
          $(href).fadeIn();
      $(this).addClass("open");
      return false;
  });
  $(".modalClose").on('click', function(){
      $(this).parents(".modal").fadeOut();
      $(".modalOpen").removeClass("open");
      return false;
  });     
});

//アコーディオン
$(function(){
  $('.s_01 .accordion_one .accordion_header').on('click',function(){
    $(this).next('.accordion_inner').slideToggle();
    $(this).toggleClass("open");
    $('.s_01 .accordion_one .accordion_header').not($(this)).next('.accordion_one .accordion_inner').slideUp();
    $('.s_01 .accordion_one .accordion_header').not($(this)).removeClass("open");
  });
});

//アニメーションcss
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

//トップページフェードイン
$(function(){
  $('h1').fadeIn(10000);
});

//スクロールトップ
$(function(){
  $('#top-btn').on('click', function() { 
    $('html, body').animate({scrollTop:0}, 300)
  }); 
});

//もっと見る
$(function() {
  $('.more-btn').on('click', function() {
    if( $(this).children().is('.open') ) {
      $(this).html('<p class="close">Close</p>').addClass('close-btn');
      $(this).parent().removeClass('slide-up').addClass('slide-down');
    } else {
      $(this).html('<p class="open">Show more</p>').removeClass('close-btn');
      $(this).parent().removeClass('slide-down').addClass('slide-up');
    }
  });
});

//スライダー
$(function(){
  $('.slider').slick({
    arrows: false,
    autoplay: true,
    autoplaySpeed: 2000,
  });
});