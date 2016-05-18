$(function() {
    'use strict';

    console.log( "CLIR+DLF Rocks!" );

    // this may be useful if this becomes "slow"
    // $(window).load(function(){
    //     $('#preloader').fadeOut('slow', function(){
    //         $(this).remove();
    //     });
    // });

    // $('.expand').click(function(){
    //     $('.glyphicon-collapse-up').toggleClass('glyphicon-collapse-up glyphicon-collapse-down', 400, "linear");
    //     $('.abstract').slideToggle();
    // });
    //
    // $('.glyphicon-collapse-up').click(function(){
    //     $(this).toggleClass('glyphicon-collapse-up glyphicon-collapse-down', 400, "linear");
    //     $(this).parent().siblings('.abstract').slideToggle();
    // });

    $(window).on("scroll",function(){
        if($(window).scrollTop() >= $('#top').position().top + 150) {
            $('.to-top').fadeIn();
        } else {
            $('.to-top').fadeOut();
        }
    });

    $('.media').click(function(){
        var location = '#' + $(this).data('section');
        $('html, body').animate({scrollTop: $(location).offset().top}, "slow");
        return false;
    });

    // $('#section-nav a').click(function(){
    //     var location = $(this).attr('href');
    //     $('html, body').animate({scrollTop: $(location).offset().top}, "slow");
    //     return false;
    // });

    $('.to-top').click(function(){
        $('html, body').animate({scrollTop:0}, "slow");
        return false;
    });

});
