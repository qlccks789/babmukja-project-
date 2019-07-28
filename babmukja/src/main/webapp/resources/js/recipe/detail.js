/**
 * 레시피 상세
 */
	
    $("#more-post").click(function () {
    	location.href = url;
    });
    $("#go-back").click(function () {
    	location.href = remenu;
    });
    // 좋아요 기능
    $(".recipeLike").click(function () {
    	if(session != "") {
	    	$.ajax({
	    		url : "like.do",
	    		data : {
	    			'recipeNo' : recipeNo,
	    			'memNo' : memNo
	    		},
	    		success : function (result) {  
	    			if(result.status == 'Y') {
	    				$(".recipeLike").css({
	    					background : "#7db341",
		    				color : "white"		    				    
	    				});	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else if(result.status == 'N') {
	    				$(".recipeLike").css({	    					
	    				    background: "#eee",
	    			    	color: "#bbb"
	    				});
	    				
	    				$(".likeCnt").html(result.cnt);
	    			} else {
	    				$(".recipeLike").css({
	    					background : "#7db341",
		    				color : "white"		    				    
	    				});	    				
	    				$(".likeCnt").html(result.cnt);
	    			}
	    		}
	    	});
    	} else alert("로그인 후 이용가능합니다.");
    });
    
    // 팔로우 기능
    $(".follow").click(function () {  	
		if(memNo != recipememNo && session != '') {
		    	$.ajax({
		    		url : "follow.do",
		    		data : {
		    			'followMemNo': recipememNo,
		    			'followerMemNo':  memNo
		    		},
		    		success : function(result) {		    		
		    			if(result == 1) {
			    			$(".follow").css({
			    				background : "#7db341",
			    				color : "white"	
			    			});
		    			} else if(result == 0) {
		    				$(".follow").css({
		    					background : "#eee",
		    			    	color: "#777"
			    			});
		    			} else alert("로그인 후 이용가능합니다.");
		    		}
		    	});
			} 
		if(memNo == recipememNo) {
			alert("자신은 팔로우 할 수 없습니다.");
		}
		
    	});
   	 	
    
    $("#comment-nope").click(function () {
    	alert("로그인 후 이용가능합니다.");
    	$(".comment-input").html("");
    });
    
    // 댓글 등록하기
     $("#comment-submit").click(function () { 
    	 if($(".comment-input").val() == null || $(".comment-input").val() == '') {
    		 alert("댓글 내용을 입력해주세요.");
    		 return;
    	 }
    	$.ajax({
	    		type: "post",
	    		url : "recipeCommentWrite.do",
	    		data : {
	    				recipeNo : $("input[name='no']").val(),
	    				score : checkedValue,
	    				content : $(".comment-input").val()
	    		},
				success : function(result) {
	    			let html = "";	
	    		
	    	 		html +=  '<div class="comment-other-wrapper" id=' + result.recipeReviewNo + '>'
				    	 		if (result.memImgPath != null) {
			 						html += '<img class="other-profile" src=' + userDefault + '>';
			 					} else {
			 						html += '<img class="other-profile" src=' + profile + '>';
			 					}
	    	 			html	+='<div class="other-content-wrapper">'
	    	 					+'<input type="hidden" class="reviewNo" value=' + result.recipeReviewNo + '>' 
	    	 					+'<div>'
	    	 					+'<div class="other-id">'+ result.memNickname +'</div>'
	    	 					+'<div class="other-rating">' 
	    	 					+'<div class="stars">'
								+'<div class="backStar"></div>'
								+'<div class="frontStar-wrapper">'
								+'<div class="frontStar" style="width:'+result.score*24+'px;"></div>'
								+'</div>'		
								+'</div>'	
	    	 					+'</div>'
	    	 					+'<div class="other-date">' +  dateFormat(new Date(result.regdate)) + '</div>'
	    	 					+'</div>'
	    	 	     			+'<div class="other-content" id=c' + result.recipeReviewNo + '>' + result.content + '</div>'
	    	 	     			if(memNo != result.memNo) {
	    	 	     				html += '<div><button class="updateComment" id="updateComment">수정</button><button class="deleteComment">삭제</button></div>';
	    	 	     			}
	    	 	  
	    	 	     html	+= '</div></div>';
		    	 	     				 	 
		    	 	 $(".comment-input").val("");		
		    	 	 $("#h5").html("");
		    	 	 $("#comment-other").prepend(html);
		    	 	 $("#comment-other").html("");
					commentList(1);
    			}
    		})
    	});
     
     // 댓글 목록 불러오기
     function commentList(pageNo){
    	 pageNo = pageNo - 1;
    	 let index = pageNo * 5;
	     $.ajax({    	 
		 		url: "recipeCommentList.do"	,
		 		data : {
		 			recipeNo : $("input[name='no']").val(),
		 			index : index,
		 			pageNo : pageNo
		 		}
		 	})
		 	.done(function (result) {
		 		let loginMemNo = memNo;
		 		if(result.comment.length == 0) {	 			
		 			$("#comment-other").html("<h5 id='h5'>댓글을 작성해주세요.</h5>");
		 		}
		 		let html = "";	
		 		for(let i = 0; i < result.comment.length; i++) {
		 			let date = new Date(result.comment[i].regdate);
		 			html += '<div class="comment-other-wrapper" id=' + result.comment[i].recipeReviewNo + '>'
				 			if (result.comment[i].memImgPath == null) {
		 						html += '<img class="other-profile" src=' + userDefault + '>';
		 					} else {
		 						html += '<img class="other-profile" src="/babmukja/member/download.do?path=' + result.comment[i].memImgPath + '&sysname=' + result.comment[i].memImgSysname + '">';
		 					}		 			
		 			html	+='<div class="other-content-wrapper">'
		 					+'<input type="hidden" class="reviewNo" value=' + result.comment[i].recipeReviewNo + '>' 
		 					+'<div>'
		 					+'<div class="other-id">'+ result.comment[i].memNickname +'</div>'	
		 					+'<div class="stars">'
							+'<div class="backStar"></div>'
							+'<div class="frontStar-wrapper">'
							+'<div class="frontStar" style="width:'+result.comment[i].score*24+'px;"></div>'
							+'</div>'		
							+'</div>'
		 					+'<div class="other-date">' + dateFormat(date)+ '</div>'
		 					+'</div>'
		 	     			+'<div class="other-content" id=c' + result.comment[i].recipeReviewNo + '>' + result.comment[i].content + '</div>';
		 	     			if (loginMemNo == result.comment[i].memNo) {	 	     		
		 	     				html += '<div><button class="updateComment" id="updateComment">수정</button><button class="deleteComment">삭제</button></div>'
		 					}
		 	     			html += `</div></div>`; 	     			
		 	     		
		 			}	
		 	 		$("#comment-other").append(html);
		 	 		printPaging(result.pageResult);
		 	});
     }
     
     $(document).on("click","#comment-page a",function(e){
         e.preventDefault();
         page = $(this).attr("href");         
         $("#comment-other").html("");
         commentList(page);
      });
     

     // 페이징 함수
     function printPaging(page) {
    	 console.log(page);
    	 var str = "";
    	 if(page.prev) {
    		 str += "<div class='comment-prev'><a href='"+ (page.beginPage - 1) +"'><img class='left-arrow' src= " + leftArrow + "></a></div>";
    	 }
		 for(var i = page.beginPage; i <= page.endPage; i++) {
			 if(page.pageNo == (i-1)) {
				 str += "<div class ='current-page'><a href='"+ i +"'>" + i + "</a></div>";
			 } else {
				 str += "<div class='pagination'><a href='"+ i +"'>" + i + "</a></div>";				 
			 }
		 }
		 if(page.next) {
			 str += "<div class='comment-next'><a href='"+ (page.endPage + 1) +"'><img class='right-arrow' src=" + rightArrow + "></a></div>";
		 }
		 $("#comment-page").html(str); 
	}
     
     // 댓글 수정 버튼 이벤트
     $(document).on("click",".updateComment",function () {
    	 let no = $(this).parent().parent().find(".reviewNo").val();
    	 let html = "";
  		$.ajax({
 			url : "commentUpdateForm.do",
 			data : "no=" + no
 		}).done (function (data) {
 			 $("#c" + no).html(` <input type="hidden" name="reviewNo" class="reviewNo" value= `+ data.recipeReviewNo + `>
	                    	    <input type="hidden" name="no" value="`+ recipeNo + `"/>     
	                    		<textarea class="comment-updateform">`+data.content+`</textarea>                			  
	                  			 <button class="comment-update">
	                  			 	<img src=` + comments + `>
	                  			 </button>                  			
                  			 	<button class="comment-exit">
                  			 		<i class="far fa-times-circle"></i>
                  			 	</button>
                  			 </div>`); 
 		}).fail(function(xhr) {
 			alert("오류 발생");
 		})	
     });
     
     // 댓글 수정 취소
     $(document).on("click", ".comment-exit", function () {
    	 let no = $(this).parent().find(".reviewNo").val();
    	
    	 $.ajax({
    		 url : "returnReviewData.do",
    		 data : "no=" + no
    	 }).done(function (result) {    		 	    		
 	 		 $("#c" + no).html('<div class="other-content">' + result.content + '</div>');		
    	 })    	 
     });
     
     // 댓글 수정
     $(document).on("click", ".comment-update", function () {
    	 let no = $(this).parent().parent().find(".reviewNo").val();   	 
    	
    	 $.ajax({
    		 url : "updateComment.do",    		 
    		 data : {
    			recipeReviewNo : $("input[name='reviewNo']").val(),
 				score : $("input[name='reviewStars']:checked").val(),
				content : $(".comment-updateform").val()
				}
    		
    	 }).done(function (result) { 	
    		 let html = "";
			 html += '<input type="hidden" class="reviewNo" value=' + result.recipeReviewNo + '>'  					
 	     			+'<div class="other-content" id=' +result.recipeReviewNo + '>' + result.content + '</div>'; 
   		 	$("#c" + no).html(html);
    	 })
     });
     
 	
 	// 댓글 삭제하기
 	$(document).on("click", ".deleteComment", function () {
 		let num = $(this).parent().parent().find(".reviewNo").val();
 		$.ajax({
 			url : "commentDelete.do",
 			data :"no=" + num
 		}).done(function (result) {    		
	    	$("#"+ num).html("");
	    	$("#comment-other").html("");
			commentList(1);
 			if($(".other-content").length == 1 ) {
 				$("#"+ num).html("");
 				$("#comment-other").html("<h5 id='h5'>댓글을 작성해주세요.</h5>");
 			} 		
 		})  
 	});
 		
     
     	// timestamp 날짜형식 바꾸는 함수
     	function dateFormat(date){
    	    function pad(num) {
    	        num = num + '';
    	        return num.length < 2 ? '0' + num : num;
    	    }
    	    return date.getFullYear() + '.' + pad(date.getMonth()+1) + '.' + pad(date.getDate());
    	}
     
     	// 레시피 삭제하기
        const value = $("#hiddenValue").text();
    	$("#delete-button").click(function () {    		
    		if(confirm("삭제하시겠습니까?") == true){
    	        alert("삭제되었습니다");
    	    }
    	    else {
    	        return false;
    	    }
    	});

    	
        $(document).ready(function() {
            $(".comment-input").keyup(function (e){
            $(this).css('height', 'auto' ).height( this.scrollHeight );
            });
        });
        
        const editor = new EditorJS({
            holderId: 'post-body',

            autofocus: false,
            data: JSON.parse(value),
            tools: { 
                warning: {
                    class: Warning,
                    inlineToolbar: true,
                },
     
                table: {
                    class: Table,
                    inlineToolbar: true,
                },                       
                quote: {
                    class: Quote,
                    inlineToolbar: true,
                },
				image: {
                    class: ImageTool,
                },            

                header: {
                    class: Header,
                }, 
                checklist: {
                    class: Checklist,
                },
                linkTool: {
                    class: LinkTool,
                },
                marker: {
                    class: Marker,
                },
                list: {
                    class: List,
                },
                embed: {
                    class: Embed,
                }
            }
        });
		
       function myTimeWait(){	   
    	   	$("#post-body").append($("<div id='recipe-cover'></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
       }
       let mOverValue = 0;
       let checkedValue = 5;
       let $checkStar = $(".check-frontStar");
		 $(".check-stars").mouseover(function(e){
	            let x,y;
	            $(this).mousemove(function(e){
	                let x = e.offsetX;
	                if(x <= 24){
	                	mOverValue = 1;
	                }else if(x <= 48){
	                	mOverValue = 2;
	                }else if(x <= 72){
	                	mOverValue = 3;
	                }else if(x <= 96){
	                	mOverValue = 4;
	                }else if(x <= 120){
	                	mOverValue = 5;
	                	
	                }else{
	                	$checkStar.css({width: "0px"});
	                	mOverValue = 0;
	                }
	            })   
	        }).click(function(){
		       	checkedValue = mOverValue;
	           	let widthVal = checkedValue * 24;
	           	$checkStar.css({width: widthVal + "px"});
           });
		 
		 
		 commentList(1);