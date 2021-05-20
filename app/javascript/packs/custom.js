$(function() {
  'use strict';

  console.log('DLF Forum Voting');

  $(window).on("scroll", function() {
    if ($(window).scrollTop() >= $('#top').position().top + 150) {
      $('.to-top').fadeIn();
    } else {
      $('.to-top').fadeOut();
    }
  });

  $('.media').click(function() {
    var location = '#' + $(this).data('section');
    $('html, body').animate({
      scrollTop: $(location).offset().top
    }, "slow");
    return false;
  });

  $('.to-top').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 400);
    return false;
  });

});

// (function() {
//   'use strict';
//   console.log('DLF Forum Voting');
//
//   const media = document.querySelectorAll('.media');
//   media.addEventListener('click', (e) => {
//     console.log('click', e);
//   });
//   console.log(media);
// })();
