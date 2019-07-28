<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice enroll.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script>
    <title>전체조회</title>
</head>
<body style="background: white;">
        <form
        action="write.do"
        id="writeForm"
        method="post"
        name="inqform"
        encType="multipart/form-data"
        class="notice_forms"
      >
        <div class="notice_summary">공지 사항 등록</div>
        <hr class="enrollhr" />
        <table class="notice_commt">
          <tr>
            <th class="notice_th2">관리자</th>
            <td class="notice_td2"><input type="text" id="writer" name="writer"/></td>
          </tr>
          <tr>
            <th class="notice_th2">제목</th>
            <td class="notice_td2"><input type="text" id="title"name="title"/></td>
          </tr>
          <tr>
            <th class="notice_th3">내용</th>
            <td class="notice_td3">
              <textarea
                name="content"
                id="content"
                rows="25"
                cols="100"
                class="notice_textarea"
              ></textarea>
            </td>
          </tr>
          <tr>
            <th class="notice_th2">첨부파일</th>
            <td class="notice_td5"><img src="" id="notice_img">      
            <input type="file" name="imageList" id="notice_file"/>                        
            </td>
          </tr>
         <!--  <tr>
            <th class="notice_th2">첨부파일2</th>
            <td class="notice_td5"><img src="" id="notice_img"> 
            <input type="file" name="imageList" id="notice_file"/> 
            </td>
          </tr>  -->
        </table>
        <hr />
        <br /><br><br>
        <div class="notice_wsubd">
          <th class="notice_wsub"><button type="submit"><a href="list.do">목록보기</a></button></th>
          &nbsp; &nbsp; &nbsp;
          <th class="notice_wsub"><button type="submit" id="uploadbutton">등록하기</button></th>
        </div>
      </form>
      <br />
      <hr />
  <footer>
          <h2>BABMUKJA COMPANY</h2>
          <div>Lorem ipsum dolor sit.</div>
  </footer>
    <script>
	let file = document.querySelector("#notice_file");
	$('#notice_file').change(function() {
		let fileList = file.files;
		// 읽기
		let reader = new FileReader();
		reader.readAsDataURL(fileList[0]);
		//로드 한 후
		reader.onload = function() {
			//로컬 이미지를 보여주기
			document.querySelector("#notice_img").src = reader.result;
			//썸네일 이미지 생성
			let tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
			tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
			tempImage.onload = function() {
				//리사이즈를 위해 캔버스 객체 생성
				let canvas = document.createElement("canvas");
				let canvasContext = canvas.getContext("2d");
				//캔버스 크기 설정
				canvas.width = 30; //가로
				canvas.height = 30; //세로
				//이미지를 캔버스에 그리기
				canvasContext.drawImage(this, 0, 0, 30, 30);
				//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
				let dataURI = canvas.toDataURL("image/jpeg");
				//썸네일 이미지 보여주기
				document.querySelector("#notice_img").src = dataURI;
			};
		};
	}); 
    	
	$("#uploadbutton").click(function() {
		let title = $("#title").val();
		let writer = $("#writer").val();
		let content = $("#content").val();
		
		if(title.length == 0) {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if(writer.length == 0) {
			alert("글쓴이를 입력해주세요.");
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