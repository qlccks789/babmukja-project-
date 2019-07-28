<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/notice/notice detail.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body style="background: white;">
	<div class="babcontainer">
		<div class="babnotices">공지사항 상세조회</div>
	</div>	
	<br>
	<br>
	<form action="/insertProc" method="post">
	<table class="babtable">
		<tr class="bab_tr">
			<td class="babtd5">
				<br>
				<div>
					번호 : <c:out value="${notice.noticeNo}" />
				</div>
				<br>
				<div>
					글쓴이 : <c:out value="${notice.writer}" />
				</div>
				<br>
				<div>
					제목 : <c:out value="${notice.title}"/>
				</div>
				<br>
				<div style="width:620px;">
				        내용 : <c:out value="${notice.content}"/> 
				</div> 
				<c:if test="${notice.imgSysname != null}">
				<div class="notice_content_img">  	
				<div class="notice_detail_img">
				<%-- <div class="notice_detail_content">내용: ${notice.content}</div>  --%>
				<%-- <c:forEach begin="1" end="4" step="1" varStatus="num"> 
				  <div>${num.count}</div>
				 </c:forEach>   --%>
				  <img src="<c:url value='download.do?path=${notice.imgSysname}'/>">
				</div> 
				</div> 
				</c:if>
			   <%-- <div id="notice_img"> 
         	       <c:forEach var="file" items="${imageList}"> 
           		           <div> 
       	    	              <img src="download.do?path=${file.path}&sysname=${file.sysname}"> 
       	    	           </div>      
 	    	       </c:forEach> 
				</div> --%>
			    <br>
				<div>
					등록일 : <fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> 
				</div>
				<br>
				<div>조회수 : ${notice.viewcnt}</div>
				<br> 
			</td>
		</tr>
	<div class="btnView2" style="float:center;">
        <td class="btnView">
<%--         <c:if test="{sessionScope.admin != null}"> --%>
        <button input type="button" id="noticeEdit" style="font-size: 1.2em;"><a href='updateForm.do?noticeNo=${notice.noticeNo}'>수정</a></button>
		<button input type="button" id="noticeDelete" style="font-size: 1.2em;"><a href='delete.do?noticeNo=${notice.noticeNo}'>삭제</a></button>
<%-- 		</c:if> --%>
		<button input type="button" style="font-size: 1.2em;"><a href='list.do'>목록</a></button>
		</td> 
	</div>
	</table><br><br>
	</form>
    <hr>
 <!--  댓글  -->
    <div class="comment_container">
        <label for="content" style="font-size:1.5em; font-weight:bold; display:flex; justify-content:center;">COMMENTS</label>
        <%-- <c:if test="{sessionScope.user.memName != null}"> --%>
        <!-- <input type="checkbox" id="secretAt">비밀댓글 -->
        <%--  </c:if>  --%>
        <form id= "commentInsert" name="commentInsertForm" method="post">
  			<input type="hidden" name="noticeNo" value="${notice.noticeNo}">			
  			
              <div class="input-group">
               <input type="text" style="width:95%; border-radius: 5px 5px 5px 5px;" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <%-- <c:if test="{sessionScope.user.memName != null}">  --%>
                    <button class="btn btn-default" id="submitComment" type="button" name="commentInsertBtn">등록</button>
               <%--  </c:if> --%>
              </div>
        </form>
    </div>
   
    <div class="container">
        <div class="commentList"></div>
    </div>
 </div>
<script>
/* $("#noticeEdit").click(function() {
	if(confirm("수정하시겠습니까?")){
	}
});

$("#noticeDelete").click(function() {
	if(confirm("삭제하시겠습니까?")){	   
   }
}); */
// alert("noticeNo: " + noticeNo );
// `${detail.noticeNo}`; //게시글 번호
/* var noticeCommentNo = ${comment.noticeCommentNo} + 1;
console.log("noticeCommentNo" + noticeCommentNo); */

/* var xhttp = new XMLHttpRequest();
xhttp.open("GET", "/babmukja/comment/comment-list.do", true);
xhttp.onreadystatechange = function() {
  if (xhttp.readyState == 4 && xhttp.status == 200) {
    document.getElementById("Context").innerHTML = xhttp.responseText;
  }
}; */

var noticeNo = ${notice.noticeNo};
var data ={};
var content = $("#content").val();
var secretAt ="n";
data.noticeNo = noticeNo;
data.content = content;
data.secretAt = secretAt;
//댓글 목록 
function commentList(){
	$.ajax({
	   url: '/babmukja/comment/comment-list.do',
	   type: 'GET',
	   data: data,
	   enctype: 'multipart/form-data',
	   success: function(data){
		   $('[name=content]').val('');
		   console.dir(data)
/* 	       alert("ajax data 성공" + data);; */
	       /* alert(data["content"]); */
	       if(data.length > 0){
	       $(".commentList").html("");    
	       for(let i=0; i < data.length; i++){
	    	 $(".commentList").append(  
	    	             '<div class="commentArea" id="commentArea'+i+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px; color:blue;">'
	    			    +'<div class="commentContent">' /* <div class="avatar"><span class="user"><img data-role="user-avatar" src="https://c.disquscdn.com/next/embed/assets/img/noavatar92.7b2fde640943965cc88df0cdee365907.png" alt="아바타"></span></div>' */
	    			    +'<p> 댓글 : ' + data[i].content + '  <a style="float:right;"></a>' /* <c:if test="{sessionScope.user.memName != null}"> </c:if> */  
	    			    +'<a href="'+ data[i].noticeCommentNo +'" style="float:right;"><button id="commentUpdate">수정</button></a>'
	    			    +'<a onclick="commentDelete('+ data[i].noticeCommentNo +');" style="float:right;"><button id="commentDelete">삭제</button>&nbsp;</a></p></div></div>'
	    	     ); /* return false; */
	    	 }  
	        } else {
	    	   $(".commentList").html( 
	    			   '<div class="commentArea" style="border-bottom:1px solid darkgray; color: red; margin-bottom: 15px;">'
		    			 +'<div class="commentContent"> <p> 댓글 : ' + "등록된 댓글이 없습니다." + '</p></div></div>');
	       } 	             
	   } 
    }); 
}	 

//댓글 등록
$("#submitComment").click(function() {  
	// alert("ajax");
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	console.log(" ajax데이터 들어감");
	
	 /*  $("#secretAt").click(function(){
		var content = $("#content").val();
		var noticeNo = "${comment.noticeNo}"
		var secretAt ="n";
		if($("#secretAt").is(":checked")){
			secretAt = "y";
		} 
   	  $("#secretAt").html("비밀 댓글입니다.");
        	});  */
    if(confirm("등록하시겠습니까?")){
	$.ajax({
	   url : '/babmukja/comment/comment-insert.do',
	   type : 'post',
	   data : insertData,
	   success : function(data){
	       if(data == 1) {
	    	   alert("등록되었습니다.");
	           commentList("1"); //댓글 작성 후 댓글 목록 reload 
	           $('[name=content]').val('');     	     
		  } 		             
	    }
	 });
   }
 }); 

//댓글 수정폼 - 댓글 내용 출력을 input 폼으로 변경 
	 $(document).on("click", "button[id='commentUpdate']", function(){
         let noticeCommentNo = $(this).parent().attr("href");
         let commentAreaId =$(this).parent().parent().parent().parent().attr("id");
         console.log(commentAreaId);
         
         $(this).parent().parent().parent().html('<br><div class="input-group">'
	   		   	 + '<input type="text" class="form-control" placeholder="수정할 내용을 입력하세요." style="width:90%;border-radius:5px 5px 5px 5px;" name="content_'+noticeCommentNo+'" value="'+content+'"/>'
	   		   	 + '<span class="input-group-btn">&nbsp;&nbsp;&nbsp;<button class="btn btn-default" type="button" onclick="commentUpdate('+noticeCommentNo+', '+commentAreaId+');">수정</button>&nbsp;</span>'
	   		   	 + '<span class="input-group-btn">&nbsp;<button class="comment_cancel" type="button">취소</button>&nbsp;</span>'
	   		   	 + '</div>');
		 return false; 
	     }); 
  
//댓글 수정
    function commentUpdate(noticeCommentNo, commentAreaId){
	var updateContent = $('[name=content_'+noticeCommentNo+']').val(); 
	var data ={};
	  data.noticeCommentNo = noticeCommentNo; 
	  data.content = content;
	  
	if(confirm("수정하시겠습니까?")){		
	 console.log("ajax 수정데이터 들어감");
	 $.ajax({
	    url : '/babmukja/comment/comment-update.do',
	    type : 'post',
	    data :{'content' : updateContent, 'noticeCommentNo' : noticeCommentNo},
	    success : function(data){
	   // if(data == 1) commentList(noticeCommentNo); 
	     console.dir(data);  
	  
		 let a ='<div class="commentContent"> <p> 댓글 : ' + data.content + '  <a style="float:right;"></a>'
		 +'<a href="'+ data.noticeCommentNo +'" style="float:right;"><button id="commentUpdate">수정</button></a>'
		 +'<a onclick="commentDelete('+ data.noticeCommentNo +');" style="float:right;"><button id="commentDelete">삭제</button>&nbsp;</a></p></div>'
	    
		 $(commentAreaId).html(a);
	     alert("수정되었습니다.");
	  }
   });
  } 
}

 // 댓글 수정취소
	$(document).on("click", ".comment_cancel", function() {
		commentList();	
	});

//댓글 삭제 
 function commentDelete(noticeCommentNo){
	 alert("noticeCommentNo" + noticeCommentNo)
	 var data ={};
	 data.noticeCommentNo =noticeCommentNo; 
		$(document).on("click", "button[id='commentDelete']", function(){
			/* var noticeCommentNo = $(this).parent().attr("onclick");
			 console.log("noticeCommentNo" + noticeCommentNo);
			 if(noticeCommentNo > 0){
				 alert("댓글이 있는 게시물은 삭제 할 수 없습니다.")
				 return;}	 */
		$(this).parent().parent().parent().parent().remove(); });
	if(confirm("삭제하시겠습니까?")){
	$.ajax({
	   url : '/babmukja/comment/comment-delete.do',
	   type : 'POST',
	   data:data,
	   success : function(data){
	       if(data == 1) {
    	   alert("삭제되었습니다.");
           commentList(); //댓글 삭제후 목록 출력 
	    }
	   }     
	 });
   }
 }	

$(document).ready(function(){
commentList(); //페이지 로딩시 댓글 목록 출력 
});    
</script>  
</body>
</html>