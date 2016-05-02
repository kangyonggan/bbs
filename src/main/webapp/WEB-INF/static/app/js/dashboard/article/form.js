$(function () {
    $('#article-dashboard').addClass('active open');
    $('#article-dashboard-manage').addClass('active');

    var $form = $('#article-create-form');

    $form.validate({
        rules: {
            title: {
                required: true,
                rangelength: [1, 30]
            },
            categoryId: {
                required: true
            },
            body: {
                required: true
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            form.submit();
        }
    });
});