// 우편번호 api
	function goPopup() {
		let pop = window.open(jusoUrl, "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
			bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
			rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		$("#signupform input[name='postNo']").val(zipNo);
		$("#signupform input[name='addrDefault']").val(
				roadAddrPart1 + roadAddrPart2);
		$("#signupform input[name='addrDetail']").val(addrDetail);
	}	

	// 닉네임 중복체크 
	// 닉네임 중복일 경우 = 0, 중복이 아닌 경우 = 1
	let nick = 0;
	$(".Nickname-check-button").click(function() {
		let nickName = $("#memNickname").val();
		$.ajax({
			type:'POST',
			data: "memNickname="+nickName,
			url: 'checknickname.do',
			dataType: "json",
			success: function(data) {
				if(data != 0 || (nickName === "")) {
					$(".nickName-result .nickName-check").text("사용이 불가능한 닉네임 입니다.");
					$(".nickName-result .nickName-check").attr("style", "color:red;");
					$("#memNickname").focus();
					$("#hNickname").val(1);
				} else {
					$(".nickName-result .nickName-check").text("사용 가능한 닉네임 입니다.");
					$(".nickName-result .nickName-check").attr("style", "color:blue;");
					$("#memNickname").focus();
					$("#hNickname").val(2);
					nick = 1;
				}
			}
		});
	});
	
	// 이메일 중복검사
	let em = 0;
	$(".email-check-button").click(function() {
		let email = $("#memEmail").val();
		$.ajax({
			type:'POST',
			data: "memEmail="+email,
			url: 'checkemail.do',
			dataType: "json",
			success: function(data) {
				if(data != 0 || (email === "")) {
					$(".email-result .email-check").text("사용 불가능한 이메일 입니다.");
					$(".email-result .email-check").attr("style", "color:red;");
					$("#memEmail").focus();
					$("#hEmail").val(1);
				} else {
					$(".email-result .email-check").text("사용 가능한 이메일 입니다.");
					$(".email-result .email-check").attr("style", "color:blue;");
					$("#memEmail").focus();
					$("#hEmail").val(2);
					em = 1;
				}
			}
		});
	});
	
	// 각 항목 조건에 맞는지 확인 
	function doSignUp() {
	    let memName = $("#memName").val();
	    let memEmail = $("#memEmail").val();
	    let memPhone = $("#memPhone").val();
	    let memNickname = $("#memNickname").val();
	    let memPass = $("#memPass").val();
	    let checkePass = $("#checkePass").val();
	    let postNo = $("#postNo").val();
	    let hEmail = $("#hEmail").val();
	    let hNickname = $("#hNickname").val();
	    
	    if(memName.length == 0){
	        alert("이름을 입력해 주세요."); 
	        $("#memName").focus();
	        return false;
	    }
	    if(memEmail.length == 0){
	        alert("이메일을 입력해 주세요."); 
	        $("#memEmail").focus();
	        return false;
	    }
	    if(checkEmail() == false){
	        alert("이메일 형식에 맞게 입력해 주세요."); 
	        $("#memEmail").focus();
	        return false; 
	    }
	    if(memPhone.length == 0){
	        alert("전화번호를 입력해 주세요."); 
	        $("#memPhone").focus();
	        return false;
	    }
	    if(isCellPhone() == false){
	        alert("전화번호 형식에 맞게 입력해 주세요."); 
	        $("#memPhone").focus();
	        return false;
	    }
	    if(memNickname.length == 0){
	        alert("닉네임을 입력해 주세요."); 
	        $("#memNickname").focus();
	        return false;
	    }
	    if(memPass.length == 0){
	        alert("비밀번호를 입력해 주세요."); 
	        $("#memPass").focus();
	        return false;
	    }
	    if(checkPassword(memPass) == false){
	    	alert("숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
	        $("#memPass").focus();
	        return false; 
	    }
	    if(checkePass.length == 0){
	        alert("비밀번호를 확인해 주세요."); 
	        $("#checkePass").focus();
	        return false;
	    }
	    if(memPass != checkePass){
	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	        $("#checkePass").focus();
	        return false; 
	    }
	    if(postNo.length == 0){
	        alert("우편번호를 입력해 주세요."); 
	        $("#postNo").focus();
	        return false; 
	    }
	    if(hintNo.length == 0){
	        alert("힌트를 선택해 주세요."); 
	        $("#hintNo").focus();
	        return false; 
	    }
	    if(hintAnswer.length == 0){
	        alert("힌트 답변을 입력해 주세요."); 
	        $("#hintAnswer").focus();
	        return false; 
	    }
	    if(hEmail === '0'){
	    	alert("이메일 중복체크를 해주세요.");
	    	return false;
	    }
	    if(hEmail === '1'){
	    	alert("사용 불가능한 이메일 입니다.");
	    	return false;
	    }
	    if(hNickname === '0'){
	    	alert("닉네임 중복체크를 해주세요.");
	    	return false;
	    }
	    if(hNickname === '1'){
	    	alert("사용 불가능한 닉네임 입니다.");
	    	return false;
	    }
	}
	
	// passWord 정규 표현식
	function checkPassword(password){
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
	        $('#pass').val('').focus();
	        return false;
	    }    
	    let checkNumber = password.search(/[0-9]/g);
	    let checkEnglish = password.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	        alert("숫자와 영문자를 혼용하여야 합니다.");
	        $('#pass').val('').focus();
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(password)){
	        alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
	        $('#pass').val('').focus();
	        return false;
	    }
	    return true;
	}
	
	//2가지 휴대전화 표현중에 하나만 택하기 
	function isCellPhone() {
		const phonenum = $("#memPhone").val();
		const regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		if(!regPhone.test(phonenum)){
			$("#memPhone").focus();
			return false;    
		}
		return true;
	}
	
	// email 정규 표현식
	function checkEmail(){
		  const emailVal = $("#memEmail").val();
		  $("#memEmail").focus();
		  const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  // 검증에 사용할 정규식 변수 regExp에 저장
		  console.log(emailVal.match(regExp));
		  if (emailVal.match(regExp) == null) {
		    return false;
		  }
		  return true;
	};