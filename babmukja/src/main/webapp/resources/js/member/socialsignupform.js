$("#kakao_signup_button").click(function() {
	let memNickname = $("#memNickname").val();
	
	if(memNickname.length == 0) {
		alert("닉네임을 설정해주세요.");
		$("#memNickname").focus();
		return false;
	}
});

// 닉네임 중복체크 
// 닉네임 중복일 경우 = 0, 중복이 아닌 경우 = 1
let nick = 0;
$("#memNickname").keyup(function() {
	let nickName = $("#memNickname").val();
	$.ajax({
		type:'POST',
		data: "memNickname="+nickName,
		url: 'checknickname.do',
		dataType: "json",
		success: function(data) {
			if(data != 0 || (nickName === "")) {
				$(".kakao_signup_result .kakao_check").text("사용이 불가능한 닉네임 입니다.");
				$(".kakao_signup_result .kakao_check").attr("style", "color:red;");
				$("#memNickname").focus();
				$("#hNickname").val(1);
			} else {
				$(".kakao_signup_result .kakao_check").text("사용 가능한 닉네임 입니다.");
				$(".kakao_signup_result .kakao_check").attr("style", "color:blue;");
				$("#memNickname").focus();
				$("#hNickname").val(2);
				nick = 1;
			}
		}
	});
});