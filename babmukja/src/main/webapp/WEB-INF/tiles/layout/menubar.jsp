<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/menubar.css"/>">
    
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <title>BABMUKJA</title>
</head>
<body>

	<div id="menubarContainer" class="opacity">
        <span id="home">BABMUKJA</span>
        <div id="menuContent">
            <ul>
                <li><a id="menu0" class="menu" href="#">About us</a></li>
                <li><a id="menu1" class="menu" href="<c:url value="/recipe/main.do"/>">레시피</a></li>
                <li><a id="menu2" class="menu" href="<c:url value="/store/mainpb.do"/>">스토어</a></li>
                <li><a id="menu3" class="menu" href="<c:url value="/meetup/main.do"/>">쿠킹 미팅</a></li>
            </ul>
        </div>
        
        <span id="sign">
            
            <i class="fas fa-caret-up fa-3x" style="display: none;"></i>
            <c:if test="${sessionScope.user ne null}">
            	<c:choose>
            		<c:when test="${user.memImgPath ne null}">
	            		<img id="user_profile_images" src="/babmukja/member/download.do?path=${user.memImgPath}&sysname=${user.memImgSysname}">
            		</c:when>
            		<c:otherwise>
            			<img id="profile-picture" src="/babmukja/resources/images/default/userdefault.png">
<!-- 			            <span id="profilePic-wrapper"> -->
<!-- 			                <i class="fas fa-user-circle fa-3x"></i> -->
<!-- 			            </span> -->
            		</c:otherwise>
            	</c:choose>
		        <a id="nickName" href="#">${user.memNickname}</a>
	         	<a id="logout" href="<c:url value="/member/logout.do"/>">로그아웃</a>
<%-- 		        <a id="pbcart" href="<c:url value='/store/buyList.do?memNo=${user.memNo}'/>"><img class="cartIcon" src="<c:url value='/resources/images/icons/payment.png'/>"></a> --%>
		        <a id="pbcart" href="<c:url value='/store/cartpb.do?memNo=${user.memNo}'/>"><img class="cartIcon" src="<c:url value='/resources/images/icons/cart.png'/>"></a>
	            <a href="<c:url value='/member/mypage.do?memNickname=${user.memNickname}'/>"><img class="cartIcon" src="<c:url value='/resources/images/icons/mykitchen.png'/>"></a>
	        </c:if>
	        
	        <c:if test="${sessionScope.user eq null}">
	         	<a id="login" href="<c:url value="/member/loginform.do"/>">로그인</a>
        		<a id="signup" href="<c:url value="/member/signupform.do"/>">회원가입</a>
	        </c:if>
        </span>
        <div id="optionalMenu1" class="optionalMenubar opacity">
            <ul>
                <li><a href="<c:url value="/recipe/cadetailall.do"/>">전체</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=1"/>">한식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=2"/>">중식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=3"/>">일식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=4"/>">양식</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=5"/>">동남아</a></li>
                <li><a href="<c:url value="/recipe/cadetail.do?country=6"/>">기타국가</a></li>

            </ul>
        </div>
        <input type="hidden" name="hiddenmanager" value="${sessionScope.user.managerAt}"/>
		<c:if test="${sessionScope.user.managerAt == 1}">
	        <div id="optionalMenu2" class="optionalMenubar opacity">
	            <ul>
	                <li><a href="<c:url value="/admin/pbstoreselectlist.do"/>">상품조회</a></li>
	                <li><a href="<c:url value="/admin/insertformpb.do"/>">상품등록</a></li>
	            </ul>
	        </div>
		</c:if>
<!--         <div id="optionalMenu3" class="optionalMenubar opacity"> -->
<!--             <ul> -->
<!--                 <li><a href="#">쿠킹미팅1</a></li> -->
<!--                 <li><a href="#">쿠킹미팅2</a></li> -->
<!--                 <li><a href="#">쿠킹미팅3</a></li> -->
<!--                 <li><a href="#">쿠킹미팅4</a></li> -->
<!--             </ul> -->
<!--         </div> -->
    </div>
    <div id="chatContainer">
        <div id="memberSearchForChat">
            <input type="text" name="member">
            <i class="fas fa-search fa-2x" id="memberSearch"></i>

        </div>
        <div id="chatProfile-wrapper">

	        <%-- <div class="chatProfile">
	            <img src="<c:url value="/resources/images/profile11.jpg"/>">
	            <p>
	                <b class="recvId">테스트계정</b> <b class="sendMsgTime">1분전</b>
	                <br>
	                <b id="hightlight2">#채식주의자</b>
	            </p>
	        </div>
	         --%>
        </div>
        <div id="closeChatContainer">
                <i class="fas fa-chevron-up"></i>
        </div>
    </div>
    <div class="chatbox-holder">

    </div>
    <!-- <script src="http://192.168.0.53:10001/socket.io/socket.io.js"></script> -->

    <script>
	    window.onload = function(){
	    	if($(".swiper-container").height() == undefined){
		         menubarCon.removeClass("opacity");        
		         optCon.removeClass("opacity");         
		         menubarCon.addClass("non-opacity");
		    	 optCon.addClass("non-opacity");
	
		      }
	    }

	
	    
        let menu = [$("#menu1"),$("#menu2"),$("#menu3")];
        let opMenu = [$("#optionalMenu1"),$("#optionalMenu2")];

        let loginUser = $("#nickName").text();
        
        for(let i=0;i<=1;i++){
            menu[i].mouseenter(function(){
                opMenu[i].css({top:"60px"});
                for(let j=0; j<=2;j++){
                    if(j == i) continue;
                    opMenu[j].css({top:"-300px"});
                }
            });
        }
        $("#menubarContainer").mouseleave(function(){
            $(".optionalMenubar").css({top:"-300px"});
            }
        );
        
		$("#home").click(function(){
			location.href="<c:url value="/recipe/main.do"/>";
		});
		
	    let menubarCon = $("#menubarContainer");
	    let optCon = $(".optionalMenubar"); 

	    $(window).scroll(function() {

	      if($(this).scrollTop() < $(".swiper-container").height()){

	         menubarCon.addClass("opacity");
	         menubarCon.removeClass("non-opacity");        

	      }else{

	    	 menubarCon.removeClass("opacity");         
	         menubarCon.addClass("non-opacity");         
	      }
	      
	      if($(this).scrollTop() < $(".swiper-container").height()-59){

	    	 optCon.addClass("opacity");
	    	 optCon.removeClass("non-opacity");        

	      }else{

	    	 optCon.removeClass("opacity");         
	    	 optCon.addClass("non-opacity");         
	      }
	         

	    });
	    

	      $("#profilePic-wrapper").click(function(){
	    	  console.log("로그인 유저: " + loginUser);
	  	    if(loginUser!= ""){		    	
		        $(".fa-caret-up").css({display:"inline-block"});
		        $("#chatContainer").slideDown();
		    }else{
		    	location.href="<c:url value="/member/loginform.do"/>";
		    }
	  	    
		    });
	      
		   $("#closeChatContainer").click(function(){
		       $(".fa-caret-up").css({display:"none"});
		       $("#chatContainer").slideUp();
		   });
		    
// 	      console.log($(this).scrollTop()+" , " + $(".swiper-container").height());
		    let socket;  

	        let reciever = "";

	        let recvHtml = "";
	        let wholeMsg = "";

	        let chatKey = ["a","b","c"];
	        let chatList = {};
	        
	        $(document).on("click",".msgBtn",function () {
	            // 서버로 데이터 전송
	            let sData = $(this).siblings("#msg").val();
	            let thisParent = $(this).parent().parent();
	            socket.emit("msg", {recvId : thisParent.find("#reciever").text(), 
	                                sendId : loginUser,
	                                sendMsg : sData
	                               }
	                        );
	            recvHtml = '<div class="message-box-holder">'
	                      	+'<div class="message-box">'
						  	+ sData
	                      	+'</div>'
	                      	+'</div>';
	            thisParent.find(".chat-messages").append(recvHtml);    
	            $("#msg").val("");
	        });

	        $(document).on("click",".chatProfile",function(){
	            let chatReciever = $(this).children("p").children(".recvId").text();
	            let cKey = "";
	            for(key in chatList){
	                if(chatList[key] == chatReciever){
	                    return;
	                }
	            }
	            if(chatKey.length == 0){
	                alert("채팅방은 세개까지 열 수 있다.");
	                return;
	            }else{
	                cKey = chatKey.pop();
	            }
	            
	            
	            chatList[cKey] = chatReciever;
	            // console.log(chatKey);
	            // console.log(chatList);

	            let img = $(this).children("img").attr("src");

	            let chatHtml = 
	                '<div class="chatbox">'
	                +'<div class="chatbox-top">'
	                +    '<div class="chatbox-avatar">'
	                +    '<a target="_blank" href="#"><img src="'+img+'" /></a>'
	                +    '</div>'
	                +    '<div class="chat-partner-name">'
	                +        '<span class="status online"></span>'
	                +        '<a target="_blank" href="#" id="reciever">'+chatReciever+'</a>'
	                +    '</div>'
	                +    '<div class="chatbox-icons">'
	                +        '<a href="javascript:void(0);"><i class="fa fa-minus"></i></a>'
	                +        '<a href="javascript:void(0);"><i id="'+cKey+'" class="fa fa-close"></i></a>'       
	                +    '</div>'      
	                +'</div>'
	                +'<div class="chat-messages">'
	                +'</div>'
	                +'<div class="chat-input-holder">'
	                +    '<textarea class="chat-input" id="msg"></textarea>'
	                +    '<input type="submit" value="전송" class="message-send msgBtn"/>'
	                +'</div>'
	                +'</div>'
	            ;
	            $(".chatbox-holder").append(chatHtml);

	        });
	        $(document).on('click','.fa-minus',function(){
	                $(this).closest('.chatbox').toggleClass('chatbox-min');
	        });
	        $(document).on('click','.fa-close',function(){
	                $(this).closest('.chatbox').hide();
	                let cKey = $(this).attr("id");
	                chatKey.push(cKey);
	                delete chatList[cKey];
	                // console.log(chatKey);
	                // console.log(chatList);
	        });
	    /*     $(document).on('click','.chatbox',function(){
	             // 연결 요청 : 서버 접속하기
	            let chatbox = $(this);
	            socket = io.connect("http://192.168.0.53:10001");
// 	            console.dir(socket);


	            socket.emit("login",loginUser);

	            socket.on("msg", function (data) {
	            	chatbox.find(".chat-messages").append(data);
	            });
	        }); */
	        
	        
	        
	        
	        $("input[name='member']").keyup(function(){
	        	let txt = $(this).val();
	        	$("#chatProfile-wrapper").html("");
	        	
	        });
	        
	        $("#memberSearch").click(function(){
	        	$("#chatProfile-wrapper").html("");

	        	$.ajax({
	        		type:"GET",
	        		url : "/babmukja/member/searchmember.do",
	        		data: {nick : $("input[name='member']").val()}
	        	}).done(function(response){
	        		let chatListWrapper = $("#chatProfile-wrapper");
	        			let profiles = "";
	        		for(let member of response){
	        			console.log(member.memNickname);
	        	        profiles += '<div class="chatProfile">'
				    	         +	'<img src="">'
				    	         +	'<p>'
				    	         +    	'<b class="recvId">'+member.memNickname+'</b> <b class="sendMsgTime">1분전</b>'
				    	         +    	'<br>'
				    	         +    	'<b id="hightlight1">'+'키워드'+'</b>'
				    	         +	'</p>'
				    	        +'</div>';
	        		}
	        		chatListWrapper.append(profiles);
	        	});
	        });
	        
    </script> 
</body>
</html>