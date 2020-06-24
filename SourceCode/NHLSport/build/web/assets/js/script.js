$(document).ready(function() { 

    $('.js--icon-menu').click(function(){
        var nav = $('.js--mobile-nav');
        nav.removeClass('hidden');
        animateCSS('.js--mobile-nav', 'fadeInLeft');
    });

    $('.js--close-sidebar').click(function(){
        var nav = $('.js--mobile-nav');
        animateCSS('.js--mobile-nav', 'fadeOut', function() {
            // Do something after animation
            nav.addClass('hidden');
        });
    });


    // Function Animate CSS
    function animateCSS(element, animationName, callback) {
        var node = document.querySelector(element)
        node.classList.add('animated', animationName)
    
        function handleAnimationEnd() {
            node.classList.remove('animated', animationName)
            node.removeEventListener('animationend', handleAnimationEnd)
    
            if (typeof callback === 'function') callback()
        }
    
        node.addEventListener('animationend', handleAnimationEnd)
    }
});