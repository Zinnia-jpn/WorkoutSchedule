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

    // 月選択のモーダル機能
    $(function() {
        $('#select-month-button').click(function() {
            $('#select-month-modal').fadeIn();
        });
        $('#month-modal-close').click(function() {
            $('#select-month-modal').fadeOut();
        });
    });
});