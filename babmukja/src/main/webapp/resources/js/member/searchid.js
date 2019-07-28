$(".search_id_button").click(function() {
	const memName = $("#memName").val();
	const memPhone = $("#memPhone").val();
	const searchData = {memName,memPhone};
	
	$.ajax({
		type: 'POST',
		data: searchData,
		url: "findid.do"
	}).done(function(data){
		if(data == "") {
			$(".search_id .search_id_result").text("이름과 전화번호가 일치하지 않습니다.");
			$(".search_id .search_id_result").attr("style", "color:red;");
		} else {
			$(".search_id .search_id_result").text("회원님의 아이디는" + '"' + data + '"' + "입니다.");
			$(".search_id .search_id_result").attr("style", "color: blue;");
		}
	})
	.fail(e => console.log(e));

	if (memName.length == 0) {
		alert("이름을 입력해 주세요.");
		$("#memName").focus();
		return false;
	}
	if (memPhone.length == 0) {
		alert("전화번호를 입력해 주세요.");
		$("#memPhone").focus();
		return false;
	}
	if (cellPhone() == false) {
		alert("'-'을 사용해서 전화번호를 입력해주세요.");
		$("#memPhone").focus();
		return false;
	}

	function cellPhone() {
		const phonenum = $("#memPhone").val();
		const regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		if (!regPhone.test(phonenum)) {
			$("#memPhone").focus();
			return false;
		}
		return true;
	}
});