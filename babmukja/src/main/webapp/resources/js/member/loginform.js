// 아이디, 비밀번호 공백일 때
	$(".login__button").click(function() {
		let email = $("#email").val();
		let pass = $("#pass").val();
	
		if (email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		if (pass == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		// 로그인 예외처리
		$.ajax({
			url : "login.do",
			type:"POST",
			data : {
				memEmail : email,
				memPass : pass
			}
			
		}).done(function(result){
			const code = result.code;
			
			switch(code){
			case 0:
				location.href = loginUrl;
				break;
			case 1:
				alert("아이디를 확인해주세요.");
				$("#pass").val("");
				$("#email").val("").focus();
				break;
			case 2:
				alert("이메일 인증 후 이용 가능합니다.");
				location.href= idCheck ;
				break;					
			case 3:
				alert("이메일과 비밀번호가 일치하지 않습니다.");
				$("#pass").val("");
				$("#email").val("").focus();
				break;
			}
		});
	});
	
	// 카카오톡 로그인
	Kakao.init('6d1d12aeec7199df6e42d9c90c771a35');
	function loginKakao() {
	  // 로그인 창을 띄웁니다.
	  Kakao.Auth.loginForm({
	    success: function(authObj) {
	    	 Kakao.API.request({
		      	 url: '/v1/user/me',
			     success: function(res) { 
					 let meminfo = {id:res.id,nickName:res.properties['nickname'],
					 accessToken:authObj.access_token,refreshToken:authObj.refresh_token}
					 $.ajax({
						type:"POST",
						data: "memEmail="+res.id,
						url:"checksocialemail.do",
					 }).done(function(result){
						 alert("카카오톡 로그인 성공");
						if(result == 0){
							 $("#socialsigupform #memEmail").val(res.id);
		    			     $("#socialsigupform #memName").val(res.properties['nickname']);
		    			     $("#socialsigupform #socialAt").val("1");
							 $("#socialsigupform").submit();
						}else{
							$("#sociallogin #memEmail").val(res.id);
	    					$("#sociallogin #memNickname").val(res.properties['nickname']);
	    					$("#sociallogin #accessToken").val(authObj.access_token);
							$("#sociallogin").submit();
						}
					}).fail(function(xhr){
						alert("서버 처리중 에러발생")
					})
	      	 	}
	     	})
	    }
	  });
	};