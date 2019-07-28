(function ($) {

    let changeComma = function (val) {
        val = val.toString().replace(/,/g, "");// 이것은 무슨뜻인가
        let pattern = /(^[+-]?\d+)(\d{3})/;//^는 ^ 다음에 ~이 나오면
        while (pattern.test(val)) {
            val = val.replace(pattern, "$1" +","+ "$2");
        }
        return val;
    };


    $.fn.comma = function () {
        let ele = this;
        this.keyup(function () {
            ele.val(changeComma(ele.val()));
        });
    };
})(jQuery);