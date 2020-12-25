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
    });
});