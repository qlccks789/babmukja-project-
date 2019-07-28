  function changeComma(val) {
        val = val.toString().replace(/,원/g, "");       //  /,/g : 정규표현식 문법 - g는 글로벌의약자.  입력받은값에 ,를 g(글로벌) 다 찾는다.
        // + or - 로 시작하는 숫자값  ex> -123456  +123456
        // 숫자 3자리마다 ,를 찍게 하는 패턴 (정규표현식을 이용하여) 만들기
        
        let pattern = /(^[+-]?\d+)(\d{3})/;   
        // , 를 3자리마다 계속 찍어줘야하기때문에 while루프를 도는데, pattern.test(val)를 주면 패턴대상에 맞는게 있으면 true 를 반환한다.
        while (pattern.test(val)) {
            val = val.replace(pattern, "$1" + "," + "$2");
        }
        return val;
    };