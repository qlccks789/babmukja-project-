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
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipemain.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/js/dist/css/swiper.min.css"/>">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modernizr.2.5.3.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/hash.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/turn.min.js"/>"></script>
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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>밥먹자 레시피</title>
</head>
<body>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            <div></div>
            <p>"BABMUKJA RECIPE"</p>
            <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>
            <img src="<c:url value="/resources/images/f2.jpg"/>"/>
            </div>
            
            <div class="swiper-slide">
                <div></div>
                <p>"자라보고 놀란 가슴 <br> 솥뚜껑 삼겹살로 달랜다."</p>
              <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>                
                <img src="<c:url value="/resources/images/f8.jpg"/>"/>
            </div>
            
            <div class="swiper-slide">
                <div></div>
            <p>"둘이 먹다 하나 죽었으면 좋겠다."</p>
           <c:choose>
            	<c:when test="${sessionScope.user ne null}">
		          <div id="writeform-button" onclick="location.href='writeform.do'">레시피 작성하러가기</div>	            	
            	</c:when>
            	<c:otherwise>
		          <div class="writeno-button">레시피 작성하러가기</div>	  
            	</c:otherwise>
            </c:choose>
            <img src="<c:url value="/resources/images/f7.jpg"/>"/>
            </div>
            
        </div>
        <!-- Add Scrollbar -->
        <div class="swiper-scrollbar"></div>
        
    </div>
    <div id="main-body">
        <div id="sector1">
            <div id="sec1-content1">
                <div id="sec1-content1-wrapper">
                    <div>"이달의 레시피"</div>
                    <div>
                    
                        <div id="sticker"></div>
                        	<a href="detail.do?no=${win.recipeNo }" id="sec1-content1-wrapper-img" style="display:block; width:600px; height:400px; background:url(${win.imgPath});background-size:cover;background-repeat: no-repeat;box-shadow: 7px 7px 9px 1px black;"></a> 
                        <div id="sticker2"></div>
                    </div>                    
                    <div id="monthrecipe-keyword">#${win.keyword}</div>
                </div>
            </div>
            <div id="sec1-content2">
                <div id="sec1-content2-wrapper">
                    <div>만든 이 
                    	<span id="monthly-profile-wrapper">
                    	<c:choose>
		                	<c:when test="${win.memImgPath == null}">
		                    	<img id="monthly-profile" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
		                	</c:when>
		                	<c:otherwise>					                	
		                    	<img id="monthly-profile" src="${pageContext.request.contextPath}/member/download.do?path=${win.memImgPath}&sysname=${win.memImgSysname}">
		                	</c:otherwise>
	                	</c:choose>
                    	</span>
                    </div>
                    <div id="paragraph">
                    	<c:forEach var="c" items="${comment }">
                    		<div style="background:url(/babmukja/resources/images/chalkstar.png); width:${30 * c.score}px; height:34px; float:right;"></div>
	                    	
	                    	<p>${c.content}</p> - ${c.memNickname} -     
	                    	<br>               	
                    	</c:forEach>
                    </div>
                    <div>
                <c:forEach var="w" items="${winner }">
                        <div>${w.title }<br>
                        	<a href="detail.do?no=${w.recipeNo }">
	                        	<c:choose>
				                	<c:when test="${w.imgPath == null || w.imgPath == ''}">
				                    	<img src="<c:url value="/resources/images/default.png"/>">					                	
				                	</c:when>
				                	<c:otherwise>					                	
				                    	<img src="${w.imgPath}">
				                	</c:otherwise>
		                		</c:choose>
                        	</a>
                        </div>    
                 </c:forEach>
                        <div style="margin-left:10px;">
                        	더 보기 
                        	<b>↓</b>
                        	<div>
	                        	<img id="bottle" src="<c:url value="/resources/images/bottle.png"/>" style="width:40px; height: 110px;">
                        	</div>
                        </div>
                    </div>
                    <div>${win.memNickname }</div>
                </div>
            </div>
        </div>
        
        <div class="boundary"></div>
        <div id="sector2">
            <div id="sector2-header">
                <div></div>
                <div>
                       인기 키워드
                </div>
                <div></div>
               <input type="hidden" name="countryrank" value="${countryrank}">
               <input type="hidden" name="situationrank" value="${situationrank}">
               <input type="hidden" name="levelrank" value="${levelrank}">
               <input type="hidden" name="typerank" value="${typerank}">
            </div>
            <div id="sector2-body">
                   <div id="recipe-book-container">
                    <div id="recipe-book1" class="recipe-book"></div>
                    <div id="recipe-book2" class="recipe-book"></div>
                    <div id="recipe-book3" class="recipe-book"></div>
                    <div id="recipe-book4" class="recipe-book"></div>
                    <p>밥먹자 레시피<br> 키워드로 원하는 레시피를 찾아보세요!</p>
                    
                </div>

            </div>
        </div>
         <!-- modal -->
    <div id="turnModal" class="modal fade" tabindex="-1" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>       
                    <p>인기 키워드 1</p>       
                </div>
                <div class="modal-body">
                    <div id="turnJsDiv">
                      <div id="turnJs">
                         <div ignore="1" class="next-button"></div>
                         <div class="hard" id="resultImage"></div>                         
                         <div class="pageX" id="page1"></div>
                         <div class="pageX" id="page2"></div>
                         <div class="pageX" id="page3"></div>
                         <div class="pageX" id="page4"></div>
                         <div ignore="1" class="previous-button"></div>
                      </div>
                </div>
                </div>
                <div class="modal-footer">                    
                </div>
            </div>
        </div>
    </div>    
       
        <div class="boundary"></div>
        <div id="sector3-mid">
        </div>
        <div id="sector3">
            <div id="sector3-body">
            
               <c:forEach var="list" items="${recipe}">
               
                   <div class="profile-container">
                       <div class="profile-pic-box">
                           <div>
	                           <c:choose>
				                	<c:when test="${list.memImgPath == null}">
				                    	<img class="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
				                	</c:when>
				                	<c:otherwise>					                	
				                    	<img class="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${list.memImgPath}&sysname=${list.memImgSysname}">
				                	</c:otherwise>
		                		</c:choose>
                           </div>
                           <div class="profile-name">
                               <p>   
                            <fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd" />
                           <br>
                                  ${list.title}
                           <br>
                                  ${list.memNickname}
                               </p>
                           </div>
                       </div>
                       <div class="recipe-pic-box">
                           <a href = "detail.do?no=${list.recipeNo }">
                            <c:choose>
			                	<c:when test='${list.imgPath == "" || list.imgPath == null || list.imgPath == "undefined"}'>
			                    	<img src="<c:url value='/resources/images/default.png'/>">					                	
			                	</c:when>
			                	<c:otherwise>					                	
		                           	<img src="${list.imgPath}" onerror='this.src="${pageContext.request.contextPath}/resources/images/default.png"'>
			                	</c:otherwise>
	                		</c:choose>
                           	</a>
                       </div>
                       <div class="recipe-info">
                           <i class="fas fa-heart fa-2x">${list.likeCnt }</i>
                           <i class="fas fa-scroll fa-2x">${list.scrapCnt }</i>
                           <i class="fas fa-eye fa-2x">${list.viewCnt }</i>
                       </div>
                   </div>
               </c:forEach>
                
            </div>
            <div id="sector3-header"></div>
        </div>
    </div>
    
<script src="<c:url value="/resources/js/dist/js/swiper.min.js"/>"></script>
<script>    
	let url = "<c:url value='/member/mypage.do?memNickname=${win.memNickname}'/>";   
</script>
<script src="<c:url value="/resources/js/recipe/main.js"/>"></script>
</body>
</html>