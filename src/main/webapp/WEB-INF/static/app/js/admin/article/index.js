$(function () {
    $('#article-admin').addClass('active open');
    $('#article-admin-manage').addClass('active');

    var showNotify = function (response) {
        Notify.success("删除帖子成功");
    };

    var $table = $('#article-table');
    $table.on('click', 'a[data-role=delete-article]', function () {
        var $trigger = $(this);
        var url = $trigger.data('url');
        var title = $trigger.attr("title");
        $.messager.confirm("警告", "确定删除" + title + "吗?", function () {
            $.get(url, function () {
                    $trigger.parents('tr').remove();
                })
                .success(showNotify)
        });
    });
});