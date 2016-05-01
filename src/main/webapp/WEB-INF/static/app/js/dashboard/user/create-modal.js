$(function () {
    var $form = $('#user-create-form');

    $form.validate({
        rules: {
            username: {
                required: true,
                rangelength: [6, 30]
            },
            password: {
                required: true,
                rangelength: [6, 30]
            }
        }
    });

});