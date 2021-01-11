document.addEventListener('turbolinks:load', function() {
    // メニュー画面の開閉
    $(function() {
        $('#header-menu-button').on('click', function() {
            if (!$('#menu-open').length) {
                $('.header-nav-container').slideDown(400, function() {
                    $('.header-nav-container').attr('id', 'menu-open');
                    $(this).removeAttr('style');
                });
            } else {
                $('.header-nav-container').slideUp(400, function() {
                    $('.header-nav-container').removeAttr('id', 'menu-open');
                    $(this).removeAttr('style');
                });
            }
        });
    });
});