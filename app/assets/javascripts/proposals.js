$(function() {
    console.log( "CLIR+DLF Rocks!" );

    $('.glyphicon-collapse-up').click(function(){
        $(this).toggleClass('glyphicon-collapse-up glyphicon-collapse-down');
        $(this).parent().siblings('.abstract').slideToggle();
    });

});
