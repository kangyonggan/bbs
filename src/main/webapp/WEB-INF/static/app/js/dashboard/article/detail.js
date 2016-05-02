$(function () {
    $('#article-dashboard').addClass('active open');
    $('#article-dashboard-manage').addClass('active');

    var showNotify = function (response) {
        Notify.success("删除评论成功");
    };

    $(".reply-delete").click(function () {

        var $this = $(this);

        $.messager.confirm("警告", "确定删除此评论吗?", function () {
            $.get($this.data("url"), function () {
                    $this.parents('.reply-div').remove();
                })
                .success(showNotify)
        });

        return false;
    });

});