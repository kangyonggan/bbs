$(function () {
    $("#reply").click(function () {

        if (!hasLogin) {
            Notify.warning("登录后才能评论!");
            return false;
        }

        var body = $("#body").val();
        if (body == "") {
            Notify.error("评论内容不能为空!");
            return false;
        }
        $("#reply-form").submit();
    });
});