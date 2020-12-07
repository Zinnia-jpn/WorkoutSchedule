document.addEventListener('turbolinks:load', function () {
    $(function() {
        // 切り替えボタンを選択するとAjaxでコントローラーに送信
        $(function() {
            $('.schedule-table-switch').click(function() {
                $.ajax({
                    url: 'dynamic_select_tables',
                    type: 'GET',
                    data: { value: $(this).val() },
                    dataType: 'script'
                });
            });
        });
    });
});