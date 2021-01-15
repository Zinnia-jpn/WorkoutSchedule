document.addEventListener('turbolinks:load', function() {
    // 日付選択モーダルの開閉
    $(function() {
        $('#open-select-day-modal').on('click', function() {
            $('#overlay').fadeIn();
            $('#select-day-modal').fadeIn();
        });
        $('#close-select-day-modal').on('click' ,function() {
            $('#overlay').fadeOut();
            $('#select-day-modal').fadeOut();
        });
    });

    // 月選択モーダルの開閉
    $(function() {
        $('#open-select-month-modal').on('click', function() {
            $('#overlay').fadeIn();
            $('#select-month-modal').fadeIn();
        });
        $('#close-select-month-modal').on('click' ,function() {
            $('#overlay').fadeOut();
            $('#select-month-modal').fadeOut();
        });
    });
});
