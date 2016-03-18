$(function() {
    console.log( "CLIR+DLF Rocks!" );

    $('.glyphicon-collapse-up').click(function(){
        $(this).toggleClass('glyphicon-collapse-up glyphicon-collapse-down', 400, "linear");
        $(this).parent().siblings('.abstract').slideToggle();
    });

    $(window).on("scroll",function(){
        if($(window).scrollTop() >= $('#top').position().top + 250) {
            $('.to-top').fadeIn();
        } else {
            $('.to-top').fadeOut();
        }
    });

    $('.to-top').click(function(){
        $('html, body').animate({scrollTop:0}, "slow");
        return false;
    });

});
