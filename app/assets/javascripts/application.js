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

//============================
//INIT
//============================

//Custom Scroll Init
$("#quests>ul").mCustomScrollbar({
    axis:"y",
    theme:"minimal-dark",
    scrollInertia:500
});

//============================
//FORMS
//============================

// -----------
// New Quest Check Form
// -----------

var new_quest_form = $('new_post');

function checkRegEx(it,regEx){
    if(!regEx.test(it.val())){
        it.css('background','red');
        return false;
    }else{
        it.css('background','green'); 
        return true;
    }    
}

if(new_quest_form)
{
    //Image URL Check
    $( '#post_url_img' ).on("keyup click onchange",function() {
        if( checkRegEx($(this),/.(png|jpg)$/) )
            $('#form_film_informations').fadeIn("slow");
        else
            $('#form_film_informations').hide();
        
        //Image Pre-viewer
        $('#post_img_preview').attr('src',$(this).val());
    });
    
    //Difficulty Check
    $( '#post_difficulty_0,#post_difficulty_1,#post_difficulty_2' ).on('click',function(){
        if( $('#post_difficulty_0').is(":checked") )
        {
            $('#form_indices').slideDown();
        }else{
            $('#form_indices').slideUp();
        }   
    });
    
    //Film Name Check
    $( '#post_film_name' ).on("keyup click onchange",function() {
        var inputVal = $(this).val();
        if(inputVal.length>255 || inputVal.length<1) {
            $(this).css('background','red');  
            $('#form_film_link').hide();
        }else{
            $(this).css('background','green');
            $('#form_film_link').fadeIn("slow");
        }
    });
    
    //Film URL Check
    $( '#post_url_film' ).on("keyup click onchange",function() {
        if( checkRegEx($(this),/vodkaster\.com\/films/i) )
            $('#form_validation').fadeIn("slow");
        else
            $('#form_validation').hide();
    });
}

// -----------
// Signin Check Form
// -----------

var signin_form = $('new_user');

if(signin_form)
{
    //Pseudo Check
    $( '#user_pseudo' ).on("keyup click onchange",function() {
        checkRegEx($(this),/^[a-zA-Z0-9_]{3,25}$/);
    });
    
    //Email Check
    $( '#user_email' ).on("keyup click onchange",function() {
        checkRegEx($(this),/^[^@\s]+@([^@\s]+\.)+[^@\s]+$/);
    });
    
    //Password Check
    $( '#user_password' ).on("keyup click onchange",function() {
        var inputVal = $(this).val();
        if(inputVal.length>25 || inputVal.length<6) {
            $(this).css('background','red');    
        }else{
            $(this).css('background','green');    
        }
    });
    
    //Image URL Check
    $( '#user_url_img' ).on("keyup click onchange",function() {
        checkRegEx($(this), /.(png|jpg|gif)$/);
        //Image Pre-viewer
        $('#user_img_preview').attr('src',inputVal);
    });
}

//============================
//ACTIVE CLASS
//============================

//Active class on quest list
$('#quests_list li a').on('click',function(){
    if( $(this).hasClass('ql_active') )
    {
        return false;
    }else{
        $('#quests_list li a').removeClass('ql_active');
        $(this).addClass('ql_active');
        TweenMax.to(document.querySelectorAll('.a_quest'),0.3,{opacity:0});
    }
});

//============================
//LIGHTBOX
//============================

var cqLightbox = {
    
    it: document.getElementById('lightbox'),
    
    init: function(){
        document.getElementById('lightbox_close').onclick = function(){
            cqLightbox.close();
        };
        var elems = document.querySelectorAll('.cqLightbox');
        for(var i=0; i<elems.length; i++)
        {
            var it = elems[i];
            it.onclick = function(){
                cqLightbox.open(it);
            };
        }
        TweenMax.to(cqLightbox.it,0,{y:'-100%'});
    },
        
    open: function(it){
        console.log('open !');
        var href_img = it.getAttribute('cqLightlink');
        document.querySelectorAll('#lightbox img')[0].setAttribute('src', href_img);
        cqLightbox.it.style.display = "block";
        TweenMax.to(cqLightbox.it,0.6,{y:'0%'/*, ease:Bounce.easeOut*/});
    },
        
    close: function(){
        TweenMax.to(cqLightbox.it,0.3,{y:'-100%',oncomplete:function(){ cqLightbox.it.style.display = "none"; }});
    }
    
}

cqLightbox.init();

//============================
//ALERT MESSAGES
//============================

var alerts = document.querySelectorAll('.alert');
for(var i=0; i<alerts.length; i++)
{
    var it = alerts[i];
    TweenMax.to(it,0.3,{scale:1});
    
    setTimeout( function(){
        TweenMax.to(it,0.6,{x:'150%'});
    }, 5000+(i*200) );
}

//============================
//ANIMATIONS
//============================

var quests = document.querySelectorAll('#quests_list li');
TweenMax.staggerTo(quests,0.6,{y:'0'},0.05);
