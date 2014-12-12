// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//NanoScroll Init
$("#quest,#quests").nanoScroller();

// New Quest Check Form
var new_quest_form = $('new_post');

if(new_quest_form)
{
    //Image URL Check
    $( '#post_url_img' ).keyup(function() {
        var inputVal = $(this).val();
        var regEx = /.(png|jpg)$/;
        if(!regEx.test(inputVal)) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
        //Image Pre-viewer
        $('#post_img_preview').attr('src',inputVal);
    });
    //Difficulty Check
    $( '#post_difficulty_0,#post_difficulty_1,#post_difficulty_2' ).on('click',function(){
        if( $('#post_difficulty_0').is(":checked") )
        {
            $('#post_clue').show();
        }else{
            $('#post_clue').hide();
        }   
    });
    //Film Name Check
    $( '#post_film_name' ).keyup(function() {
        var inputVal = $(this).val();
        if(inputVal.length>255 || inputVal.length<1) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
    //Film URL Check
    $( '#post_url_film' ).keyup(function() {
        var inputVal = $(this).val();
        var regEx = /vodkaster\.com\/films/i;
        if(!regEx.test(inputVal)) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
}

//  Check Form
var signin_form = $('new_user');

if(signin_form)
{
    //Pseudo Check
    $( '#user_pseudo' ).keyup(function() {
        var inputVal = $(this).val();
        var regEx = /^[a-zA-Z0-9_]{3,25}$/;
        if(!regEx.test(inputVal)) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
    //Email Check
    $( '#user_email' ).keyup(function() {
        var inputVal = $(this).val();
        var regEx = /^[^@\s]+@([^@\s]+\.)+[^@\s]+$/;
        if(!regEx.test(inputVal)) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
    //Password Check
    $( '#user_password' ).keyup(function() {
        var inputVal = $(this).val();
        if(inputVal.length>25 || inputVal.length<6) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
    //Image URL Check
    $( '#user_url_img' ).keyup(function() {
        var inputVal = $(this).val();
        var regEx = /.(png|jpg)$/;
        if(!regEx.test(inputVal)) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
        //Image Pre-viewer
        $('#user_img_preview').attr('src',inputVal);
    });
}