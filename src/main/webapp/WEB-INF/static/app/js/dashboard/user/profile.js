$(function () {
    $('#user-dashboard').addClass('active open');
    $('#user-dashboard-profile').addClass('active');

    var $form = $('#user-profile-form');

    $form.validate({
        rules: {
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            form.submit();
        }
    });
});