document.addEventListener('turbolinks:load', function() {
    // オーバーレイをクリックするとモーダルを閉じる
    $(function() {
        $('#overlay').on('click', function() {
            $('#overlay').fadeOut();
            $('.custom-modal').fadeOut();
        });
    });
});
