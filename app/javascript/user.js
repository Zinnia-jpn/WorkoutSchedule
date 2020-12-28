document.addEventListener('turbolinks:load', function () {
    $(function() {
        // ユーザー削除の確認モーダル機能
        $(function() {
            $('#user-delete-button').click(function() {
                $('#delete-modal').fadeIn();
            });
            $('#close-delete-modal').click(function() {
                $('#delete-modal').fadeOut();
            });
        });

        // ユーザー画像初期化の確認モーダル機能
        $(function() {
            $('#revert-image-button').click(function() {
                $('#revert-image-modal').fadeIn();
            });
            $('#close-revert-image-modal').click(function() {
                $('#revert-image-modal').fadeOut();
            });
        });
    });
});