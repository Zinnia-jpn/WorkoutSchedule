document.addEventListener("turbolinks:load", function() {
    // カテゴリを選択するとAjaxでコントローラーに送信
    $(function() {
        $('#category-select').change(function() {
            $.ajax({
                url: '/records/dynamic_select_category', // 絶対パスによって指定
                type: 'GET',
                data: {
                    category_id: $(this).has('option:selected').val(), 'token': $('#token').val(),
                    record: {
                        'date(1i)': $('#record_date_1i').val(), 'date(2i)': $('#record_date_2i').val(), 'date(3i)': $('#record_date_3i').val(),
                        do_flag: $('#record_do_flag').prop('checked'), time: $('#record_time').val(), intensity: $('#record_intensity').val(),
                        weight: $('#record_weight').val(), rep: $('#record_rep').val(), set: $('#record_set').val(), interval: $('#record_interval').val(),
                        remark: $('#record_remark').val()
                    }
                },
                dataType: 'script'
            });
        });
    });
});
