let scrapbookFlag = false;
let captureFlag = false;
var img = "";

$(".recipeScrap").click(function(){
	
	if($("input[name='scrap-status']").val() == 'Y'){
		
		alert("이미 스크랩한 게시물입니다.");
		return;
	}
	
	let loginMemNo = $("input[name='memNo']").val();
	$("#modal-scrap").modal("show");
	if(!scrapbookFlag){
		$.ajax({
			url:"/babmukja/member/scrapbookAjax.do",
			type:"POST",
			data : {memNo : loginMemNo}
		}).done(function(result){
			let html = "";
			let i = 0;
			for(let book of result){
				let html = "";
				
				html+='<div class="scrapbook-content">';
				html+=	'<p class="scrapbook-content-title">'+book.title+'</p>' ;
				html+=	'<div class="scrapbook-content-cover" style="background:url('+book.imgPath+'); background-size: cover;"></div>';
				html+=	'<input name="scrapbook-radio" type="radio" value="'+ book.scrapNo +'">';
				html+='</div>';			
				
				$("#scrapbook-wrapper-sec3").append(html);	
			}
		});
		
	}
	if(!captureFlag){
		capture();
	}
	captureFlag = true;
	scrapbookFlag = true;
	
	
});
$("#scrapbook-wrapper-sec4-button2").click(function(){
	$("#modal-scrap").modal("hide");
//	scrapbookFlag = false;
});
$(document).on("click","#scrapbook-wrapper-sec4-button1",function(){
	let radioValue = $("input[name='scrapbook-radio']:checked").val();
	let loginMemNo = $("input[name='memNo']").val();
	if(radioValue == undefined){
		alert("스크랩한 자료를 저장할 책자를 선택해주세요.");
		return;
	}
	$("body").append('<div id="waitLoading"></div>').css({margin: "0 auto"});
	
	var f = new FormData();
    f.append("file", img, "test.png");
    f.append("radioVal", radioValue);
    f.append("recipeNo", $("input[name='no']").val());
    f.append("memNo", loginMemNo);
	
	$.ajax({
		url:"capture.do",
		type:"POST",
		data: f,
	    processData: false,
	    contentType: false
	}).done(function(){
		alert("레시피 정보가 스크랩 되었습니다.");
		$("#modal-scrap").modal("hide");
		$("#waitLoading").css({display:"none"});
		$("input[name='scrap-status']").val("Y");
		let $recipeScrap = $(".recipeScrap");
		$recipeScrap.css({background:"#7db341",color:"white"});
		$recipeScrap.children("b").text(Number($recipeScrap.children("b").text()) + 1);
	});
});


function capture() {
	
  var content="#post-body";
  
  $(content).html2canvas({  
    onrendered: function (canvas) {  
      var dataUrl = canvas.toDataURL("image/png");
      img = dataURItoBlob(dataUrl);
      $('#img_val').val(img);  
      $("#scrapbook-wrapper-sec2").html('<img id="sec2-img-container" src=' + window.URL.createObjectURL(img) + '>'); 
    }  
  });  
} 

function dataURItoBlob(dataURI)
{
    var byteString = atob(dataURI.split(',')[1]);
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
    var ab = new ArrayBuffer(byteString.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < byteString.length; i++)
    {
        ia[i] = byteString.charCodeAt(i);
    }

    var bb = new Blob([ab], { "type": mimeString });
    return bb;
}

