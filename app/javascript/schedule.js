document.addEventListener('turbolinks:load', function() {
    // 前後3日間の切り替えボタンを押すとAjaxで送信
    $(function scheduleTableSwitch() {
        $('.date-table-switch').click(function() {
            $.ajax({
                url: 'dynamic_select_date',
                type: 'GET',
                data: { value: $(this).val() },
                dataType: 'script'
            });
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
        // 月を選択して送信するとモーダルを閉じる
        $('#select-month-submit').on('click', function() {
            $('#overlay').fadeOut();
            $('#select-month-modal').fadeOut();
        });
    });
});
