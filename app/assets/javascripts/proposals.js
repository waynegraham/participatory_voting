$(function() {
    console.log( "CLIR+DLF Rocks!" );

    $('.glyphicon-collapse-up').click(function(){
        $(this).toggleClass('glyphicon-collapse-up glyphicon-collapse-down', 400, "linear");
        $(this).parent().siblings('.abstract').slideToggle();
    });

});
