<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/meetup/meetup_notice_style.css"/>" />
<link rel="stylesheet"
	href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons" />">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="board_insert_container">
		<div class="board_insert_wrapper">
			<div class="board_insert_header">글등록</div>

			<div class="board_insert_recipe">
				레시피를 작성하고 싶다면 <a href="<c:url value="/recipe/writeform.do"/>">레시피등록 하러가기</a>
			</div>

			<form id="writeform" action="writeFreeBoard.do" method="POST" enctype="multipart/form-data">
			<div class="board_insert_title">
				<input type="text" id="title" name="title" placeholder="제목을 입력해주세요." />
				<!--모임번호  -->
				<input type="hidden" id="meetNo" name="meetNo" value="${meetNo}"/>
				<input type="hidden" id="memNo" name="memNo" value="${memNo}"/>
			</div>

			<div class="board_insert_writer">
				<input type="text" id="writer" name="writer" placeholder="작성자를 입력해주세요." />
			</div>

			<div class="board_insert_content">
				<input type="text" id="content" name="content" placeholder="내용을 입력해주세요.">
			</div>

			<input type="hidden" id="memNo" />

			<div class="board_insert_file">
				<label class="label"> 
				<input type="file" name="boardfile" id="insert_file" /> <i class="material-icons">attach_file</i> 
				<span class="title">Add File</span>
					<div class="board_insert_file_div">
						<img src="" id="board_insert_img">
					</div>
				</label>
			</div>

			<div class="board_insert_button">
				<button>글등록하기</button>
			</div>
			</form>
		</div>
	</div>
	</main>
	<script>
		// 이미지 썸네일
		let file = document.querySelector("#insert_file");

		file.onchange = function() {
			let fileList = file.files;

			// 읽기
			let reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			//로드 한 후
			reader.onload = function() {
				//로컬 이미지를 보여주기
				document.querySelector("#board_insert_img").src = reader.result;

				//썸네일 이미지 생성
				let tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
				tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
				tempImage.onload = function() {
					//리사이즈를 위해 캔버스 객체 생성
					let canvas = document.createElement("canvas");
					let canvasContext = canvas.getContext("2d");

					//캔버스 크기 설정
					canvas.width = 150; //가로
					canvas.height = 150; //세로

					//이미지를 캔버스에 그리기
					canvasContext.drawImage(this, 0, 0, 150, 150);
					//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
					let dataURI = canvas.toDataURL("image/jpeg");

					//썸네일 이미지 보여주기
					document.querySelector("#board_insert_img").src = dataURI;
				};
			};
		};
		
		// 유효성 검사
		$(".board_insert_button").click(function() {
			
			let title = $("#title").val();
			let writer = $("#writer").val();
			let content = $("#content").val();
			
			if(title.length == 0) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			if(writer.length == 0) {
				alert("작성자를 입력해주세요.");
				$("#writer").focus();
				return false;
			}
			if(content.length == 0) {
				alert("내용을 입력해주세요.");
				$("#content").focus;
				return false;
			}
		});
		
	</script>
</body>
</html>