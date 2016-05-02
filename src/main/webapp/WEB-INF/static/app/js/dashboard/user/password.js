$(function () {
    $('#user-dashboard').addClass('active open');
    $('#user-dashboard-password').addClass('active');

    var $form = $('#user-password-form');

    $form.validate({
        rules: {
            password: {
                required: true,
                rangelength: [6, 30]
            }
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            form.submit();
        }
    });
});