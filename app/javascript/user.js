document.addEventListener('turbolinks:load', function() {
    // ”ユーザー削除”確認モーダルの開閉
    $(function() {
        $('#open-account-delete-modal').on('click', function() {
            $("#overlay").fadeIn();
            $('#account-delete-modal').fadeIn();
        });
        $('#close-account-delete-modal').on('click', function() {
            $("#overlay").fadeOut();
            $('#account-delete-modal').fadeOut();
        });
    });

    // ”画像削除”確認モーダルの開閉
    $(function() {
        $('#open-revert-image-modal').on('click', function() {
            $("#overlay").fadeIn();
            $('#revert-image-modal').fadeIn();
        });
        $('#close-revert-image-modal').on('click', function() {
            $("#overlay").fadeOut();
            $('#revert-image-modal').fadeOut();
        });
    });
});
