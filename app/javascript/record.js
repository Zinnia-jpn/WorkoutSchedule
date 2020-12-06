$(function() {
    // カテゴリを選択するとAjaxでコントローラーに送信
    $(function() {
        $('#category-select').change(function() {
            $.ajax({
                url: 'dynamic_select_category',
                type: 'GET',
                data: { category_id: $(this).has('option:selected').val(), flag: $('#plan_flag').val() },
                dataType: 'script'
            });
        });
    });

});