document.addEventListener("turbolinks:load", function () {
    $(function() {
        // カテゴリを選択するとAjaxでコントローラーに送信
        $(function() {
            $('#category-select').change(function() {
                $.ajax({
                    url: 'dynamic_select_category',
                    type: 'GET',
                    data: {
                        category_id: $(this).has('option:selected').val(), url: $('#url').val(),
                        id: $('#id').val(), year: $('#_date_1i').val(), month: $('#_date_2i').val(), day: $('#_date_3i').val(),
                        plan_flag: $('#plan_flag').val(), time: $('#time').val(), intensity: $('#intensity').val(),
                        weight: $('#weight').val(), rep: $('#rep').val(), set: $('#set').val(), interval: $('#interval').val(),
                        remark: $('#remark').val()
                    },
                    dataType: 'script'
                });
            });
        });
    });
});