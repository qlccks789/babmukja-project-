
$("#scrapbook-add").click(function(){
	$("#modal-scrapbook").modal("hide");
	$("#modal-scrapbook-creator").modal("show");
});
$(document).on("keyup","input[name='scrapbook-title']",function(){
	if($(this).val().length > 30) $(this).val($(this).val().substring(0,30)); 
});
$(document).on("click","#scrapbook-coverselector-text",function(){			
	$("input[name='bookcover']").click();
});
$(document).on("click","#book-cancel",function(){
	 $("#scrapbook-coverselector").html(`
			 <p id="scrapbook-coverselector-text">표지로 설정할 이미지를<br>업로드해주세요!</p>
	 `);
	 $("#modal-scrapbook-creator").modal("hide");
	 $("#modal-scrapbook").modal("show");
 });

let title = "";
let readFile;
let fData = new FormData();
$(document).on("change","input[name='bookcover']",function(e){
	var reader = new FileReader();
    reader.readAsDataURL(e.target.files[0]);
    readFile = e.target.files[0];
    fData.append("memNo",userNo);
    
    	 reader.onload = function () {
         var tempImage = new Image();
         tempImage.src = reader.result;
         
         tempImage.onload = function () {
             var canvas = document.createElement('canvas');
             var canvasContext = canvas.getContext("2d");

             canvas.width = 200;
             canvas.height = 200;
             canvasContext.drawImage(this, 0, 0, 200, 200);
                 
             var dataURI = canvas.toDataURL("image/jpeg");
             var imgTag = "<img id='cover-picture' class='preview_img' src='"+dataURI+"'/>";
			 $("#scrapbook-coverselector").html(imgTag);
         };
     };


});
$(document).on("click","#book-create",function(){
	title = $("#scrapbook-title").val();
	if(title == "") {
		alert("제목을 입력해주세요.");
		return;
	}
	if(readFile == null){
		
		alert("사진을 업로드해주세요.");
		return;
	}
	fData.append("attach",readFile);
	fData.append("title",title);
	fData.append("memNickname",userNickname);
	$.ajax({
		url: 'insertscrapbook.do',
		type: "post",
		processData: false,
		contentType: false,
		data: fData
	}).done(function(result){
		location.href = "/babmukja/member/mypage.do?memNickname="+encodeURI(result , "UTF-8");;
	});
	
});

