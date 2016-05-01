$.ajaxSetup({
    cache: false,
    contentType: "application/x-www-form-urlencoded;charset=utf-8",
    complete: function (XMLHttpRequest, textStatus) {
        var session_status = XMLHttpRequest.getResponseHeader("session_status");
        if (session_status == "timeout") {
            window.location = ctx + "/login";
        }
    }
});

$(document).on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
});

$('.modal').on('click', '[data-toggle=form-submit]', function (e) {
    e.preventDefault();
    $($(this).data('target')).submit();
});

var showMessage = function (type, message) {
    $.gritter.add({
        title: '通知',
        text: message,
        class_name: type
    });
};

var Notify = {
    success: function (message) {
        showMessage('gritter-success', message);
    },

    warning: function (message) {
        showMessage('gritter-warning', message);
    },

    error: function (message) {
        showMessage('gritter-error', message);
    },

    info: function (message) {
        showMessage('gritter-info', message);
    }
};

//配置jQuery.validator默认的处理方法
jQuery.validator.setDefaults({
    focusInvalid: false,
    onfocusout: function (element) {
        $(element).valid();
        if (this.element(element)) {
            var $parent = $(element).parents(".form-group").removeClass("has-error").addClass("has-success");
            $parent.find(".fa-check-circle").removeClass("hide");
            $parent.find(".fa-times-circle").addClass("hide");
            $parent.find(".help-block").text("校验通过");
        }
    },
    showErrors: function (errorMap, errorList) {
        for (var i = 0; i < errorList.length; i++) {
            var $parent = $(errorList[i].element).parents(".form-group").addClass("has-error");
            $parent.find(".fa-times-circle").removeClass("hide");
            $parent.find(".help-block").text(errorList[i].message);
        }
    },
    submitHandler: function (form, event) {
        event.preventDefault();
        var $modal = $(form).parents('.modal');
        $(form).ajaxSubmit({
            dataType: 'json',
            success: function (response) {
                if (response.status == 'fail') {
                    Notify.error("操作失败。");
                } else {
                    $modal.modal('hide');
                    //Notify.success("操作成功。");
                    window.location.reload();
                }
            },
            error: function (data, textstatus) {
                $modal.modal('hide');
                Notify.error("服务器内部错误，请稍后再试。");
            }
        });
    }
});

$.messager.model = {
    cancel: {text: "取消", classed: 'btn-default'},
    ok: {text: "确定", classed: 'btn-success'}
};