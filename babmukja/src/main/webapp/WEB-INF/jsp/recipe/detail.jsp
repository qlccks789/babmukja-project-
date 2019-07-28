<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipe-detail.css"/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
    <script src="<c:url value="/resources/js/html2canvas/html2canvas.js"/>"></script>
    <script src="<c:url value="/resources/js/html2canvas/jquery.plugin.html2canvas.js"/>"></script>
    
    <title>Document</title>
</head>
<input type="hidden" value="${sessionScope.user.memNo}" name="memNo">
<body onload="myTimeWait()">
	
<%--     <input id="hiddenValue" type="text" value="${inputData}"/> --%>
	
    <div id="body"><!-- 전체 body start -->
        <!---------------------------------------------------------------------------------------->
        <div id="left-body"><!-- left-body start -->

            
            <div id="post-info"><!-- post-info start -->
            	
                <div id="keyword-container">
	                	<div class="keyword-wrapper">#${keyword.country}</div>
	                	<div class="keyword-wrapper">#${keyword.situation}</div>
	                	<c:forEach var="caution" items="${cautions}">
	                		<div class="keyword-wrapper">#${caution}</div>
	                	</c:forEach>
	                	<div class="keyword-wrapper">#${keyword.level}</div>
	                	<div class="keyword-wrapper">#${keyword.time}</div>
	                	<div class="keyword-wrapper">#${keyword.type}</div>
	                	
                </div>
                <div id="post-date"><fmt:formatDate value="${recipe.regDate}" pattern="yyyy.MM.dd"/></div>
            </div><!-- post-info end -->
            <h2>${recipe.title}</h2>

            <div id="hiddenValue" style="display:none">${recipe.content}</div>
            <!-- post-body start -->
	        <div id="post-body"></div>	        
	        <c:choose>
            	<c:when test="${sessionScope.user.memNo eq recipe.memNo}">
	            	<div id="a-button">
	            		<a href="<c:url value="/recipe/updateform.do?no=${recipe.recipeNo }"/>"><i class="far fa-edit"></i>수정</a>
	            		<a id="delete-button" href="<c:url value="/recipe/delete.do?no=${recipe.recipeNo }"/>"><i class="far fa-trash-alt"></i>삭제</a>	            	
	            	</div>
            	</c:when>
            </c:choose>
            <!-- post-body end -->
             <!------------------------------------------------------------------------------------------------>
           
            <div id="comment-body"><!-- comment-body start -->
                <div id="comment-header">댓글&nbsp;<i class="far fa-comments"></i></div>                
                <div id="comment-container"><!-- comment-container start -->
                    <div id="comment-mine"><!-- comment-mine start -->
                    <c:choose>
                    	<c:when test="${sessionScope.user != null }">
	                        <c:choose>
			                	<c:when test="${sessionScope.user.memImgPath == null}">
			                    	<img id="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
			                    	<img id="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${sessionScope.user.memImgPath}&sysname=${sessionScope.user.memImgSysname}">
			                	</c:otherwise>
		                	</c:choose>
							<div id="comment-nick">
								${sessionScope.user.memNickname }
							</div>                    
                    	</c:when>
                    	<c:otherwise>
                    		<img src="<c:url value='/resources/images/default/userdefault.png'/>">
                    		<div id="comment-login">
								로그인 후 이용해주세요.
							</div>
                    	</c:otherwise>
                    </c:choose>        
                        <div id="comment-input-wrapper">
	     					<div class="check-stars">
								<div class="check-backStar"></div>
								<div class="check-frontStar-wrapper">
									<div class="check-frontStar"></div>
								</div>
							</div>
							
		                    <input type="hidden" name="no" value="${recipe.recipeNo}"/>     
                            <textarea class="comment-input"></textarea>
                        <c:choose>
                        	<c:when test="${sessionScope.user ne null}">
	                        	<button id="comment-submit"><img src="<c:url value='/resources/images/comments.png'/>"></button>                        	
                        	</c:when>
                        	<c:otherwise>
                        		<button id="comment-nope"><img src="<c:url value='/resources/images/comments.png'/>"></button>
                        	</c:otherwise>
                        </c:choose>                       
                        </div>
                        
                    </div><!-- comment-mine end -->

                    <div id="comment-other"><!-- comment-other start -->
                       
                    </div><!-- comment-other end -->
                    <div id="comment-page"></div>
                </div><!-- comment-container end -->
            </div><!-- comment-body end -->   
    	</div><!-- left-body end -->
        

        <!------------------------------------------------------------------------------------------------>
        <div id="right-body"><!-- right-body start -->            
            <div id="content-wrapper"><!-- content-wrapper start -->
                <div id="content-info"><!-- content-info start -->
                    <div id="content-button-wrapper"><!-- content-button-wrapper start -->
                    
                     <c:choose>
                        	<c:when test="${likeStatus eq 'Y' }">
                        		  <button id="likeNo" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:when>
                        	<c:when test="${likeStatus eq 'N' }">
                        		  <button id="likeYes" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:when>
                        	<c:otherwise>
                        		  <button id="likeLogin" class="recipeLike">
	                        		  <i class="fas fa-hand-holding-heart"></i> 
	                        		  <b class="likeCnt">${recipe.likeCnt}</b>
                        		  </button>
                        	</c:otherwise>
                        </c:choose>
                        <input type="hidden" name="scrap-status" value="${scrapStatus}">      
                    	<c:choose>
                    		<c:when test="${scrapStatus eq 'Y'}">
		                        <button class="recipeScrap" style="color:white;background-color:#7db341;"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		                    			
                    		</c:when>
                    		<c:when test="${scrapStatus eq 'N'}">
		                        <button class="recipeScrap"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		
                    		</c:when>
                    		<c:otherwise>
		                        <button class="recipeScrap"><i class="fas fa-scroll"></i> <b>${recipe.scrapCnt}</b></button>                    		
                    		</c:otherwise>
                    	</c:choose>
                    </div><!-- content-button-wrapper end -->
                </div><!-- content-info end -->

                <div id="writer-info"><!-- writer-info start -->

                    <div id="profile-wrapper"> <!-- profile-wrapper start -->
                        <c:choose>
		                	<c:when test="${recipe.memImgPath == null}">
		                    	<img id="profile-img" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
		                	</c:when>
		                	<c:otherwise>					                	
		                    	<img id="profile-img" src="${pageContext.request.contextPath}/member/download.do?path=${recipe.memImgPath}&sysname=${recipe.memImgSysname}">
		                	</c:otherwise>
	                	</c:choose>
                        <div id="profile-id">
                            <div>${recipe.memNickname }</div>
                        </div>                   
                        <c:choose>
                        	<c:when test="${followStatus eq 'Y' }">
                        		 <button id="followNo" class="follow">팔로우</button> 
                        	</c:when>
                        	<c:when test="${followStatus eq 'N' }">
                        		<button id="follow" class="follow">팔로우</button>
                        	</c:when>
                        	<c:otherwise>
                        		<button id="followLogin" class="follow">팔로우</button>   
                        	</c:otherwise>
                        </c:choose>                                
                    </div><!-- profile-wrapper end -->

                    <div id="writer-post"><!-- writer-post start -->
                    <c:forEach var="m" items="${memRecipe}">
                        <a href="detail.do?no=${m.recipeNo }">
	                        <c:choose>
			                	<c:when test="${m.imgPath == null || m.imgPath == '' || m.imgPath == 'undefined'}">
			                    	<img id="post-img1" src="<c:url value="/resources/images/default.png"/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
			                    	<img id="post-img1" src="${m.imgPath }" onerror='this.src="${pageContext.request.contextPath}/resources/images/default.png"'>
			                	</c:otherwise>
	                		</c:choose>
                        </a>
                    </c:forEach>
                    </div><!-- writer-post end -->
                    <button id="more-post">더 보기 <i class="fas fa-caret-down fa-1x"></i> </button>
                    <br>
                    <button id="go-back">메뉴로 돌아가기 </button>
                </div><!-- writer-info end -->
            </div><!-- content-wrapper end -->            
        </div><!-- right;body end -->
    </div> <!-- 전체 body end -->
    
	
	<input type="hidden" name="img_val" id="img_val" value="" /> 
	<!-- scrap modal -->
   	<div class="modal fade" id="modal-scrap" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
			<div class="modal-content" id="recipe-content" style="width:900px; height: 700px;margin:0 auto;">
				
					<div id="modal-container">
				        <div id="scrapbook-wrapper-sec1">
				            <p>${sessionScope.user.memNickname}'s 스크랩북</p>
				        </div>
				        <div id="scrapbook-wrapper-sec2">
				        </div>
				        <div id="scrapbook-wrapper-sec3">

				        </div>
				        <div id="scrapbook-wrapper-sec4">
				            <button id="scrapbook-wrapper-sec4-button1">등록</button>
				            <button id="scrapbook-wrapper-sec4-button2">취소</button>
				        </div>
				    </div>
				    
			</div>
		</div>
	</div>
	
	<script src="<c:url value="/resources/js/html2canvas/recipe-capture.js"/>"></script>
    <script>
	    let url = "<c:url value='/member/mypage.do?memNickname=${recipe.memNickname}'/>";
	    let remenu = "<c:url value='/recipe/cadetailall.do'/>";
	    let session = '${sessionScope.user}';
	    let recipeNo = '${recipe.recipeNo}';
	    let memNo = '${sessionScope.user.memNo}';
	    let recipememNo = '${recipe.memNo}';
	    let comments = "<c:url value='/resources/images/comments.png'/>";
	    let userDefault = "<c:url value='/resources/images/default/userdefault.png'/>";
	    let leftArrow = "<c:url value='/resources/images/icons/left-arrow.png'/>";
	    let rightArrow = "<c:url value='/resources/images/icons/right-arrow.png'/>";
	    let profile = "${pageContext.request.contextPath}/member/download.do?path=${sessionScope.user.memImgPath}&sysname=${sessionScope.user.memImgSysname}";
    </script>
	<script src="<c:url value="/resources/js/recipe/detail.js"/>"></script>
    
</body>
</html>