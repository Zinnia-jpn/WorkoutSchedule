$(function() {
    // カテゴリを選択するとAjaxでコントローラーに送信
    $(function() {
        $('#normal-muscle-part-select').change(function() {
            $.ajax({
                url: "dynamic_select_muscle_part",
                type: 'GET',
                data: { muscle_part_id: $(this).has('option:selected').val(), flag: $('#plan_flag').val() },
                dataType: 'script'
            });
        });
    });

});