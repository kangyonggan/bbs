$(function () {

    if (window.chrome) {
        $('.slider li').css('background-size', '100% 100%');
    }
    $('.slider').unslider({
        speed: 500,               //  滚动速度
        delay: 1500,              //  动画延迟
        keys: true,               //  启动键盘导航
        dots: true,               //  显示点导航
        fluid: true               //  支持响应式设计
    });
});