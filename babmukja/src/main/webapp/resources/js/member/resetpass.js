$("#reset_pass_btn").click(function() {
	let memPass = $("#memPass").val();
	let checkmemPass = $("#checkmemPass").val();
	if(memPass.length == 0){
        alert("비밀번호를 입력해 주세요."); 
        $("#memPass").focus();
        return false;
    }
	if (checkPassword(memPass) == false) {
		alert("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
		$("#memPass").focus();
		return false;
	}
	if (checkmemPass.length == 0) {
		alert("비밀번호를 확인해 주세요.");
		$("#checkmemPass").focus();
		return false;
	}
	if (memPass != checkmemPass) {
		alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
		$("#checkePass").focus();
		return false;
	}
});

// passWord 정규 표현식
function checkPassword(password) {
	if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)) {
		$('#pass').val('').focus();
		return false;
	}
	var checkNumber = password.search(/[0-9]/g);
	var checkEnglish = password.search(/[a-z]/ig);
	if (checkNumber < 0 || checkEnglish < 0) {
		alert("숫자와 영문자를 혼용하여야 합니다.");
		$('#pass').val('').focus();
		return false;
	}
	if (/(\w)\1\1\1/.test(password)) {
		alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
		$('#pass').val('').focus();
		return false;
	}
	return true;
}