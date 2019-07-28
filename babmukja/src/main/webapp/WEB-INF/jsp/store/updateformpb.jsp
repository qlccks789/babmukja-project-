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
    <title>PB스토어 상품 등록</title>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/insertformpb.css"/>">
</head>
<body>
    <div id="writeform-header">상품 수정</div>
    <div id="paragraph">PB 상품을 수정해주세요</div>
    <div id="editorjs">
            <input type="text" id="name" value="${storepb.name}">
            <input type="text" id="price" value="<fmt:formatNumber value="${storepb.price}" groupingUsed="true"/>">
            <div id="hiddenValue" style="display:none">${storepb.content}</div>
            <div id="hiddenNo" style="display:none">${storepb.pbNo}</div>
        </div>
    <div id="buttonWrapper">
        <button>저장</button>
    </div>
    
    <script>
		let saveUrl = "<c:url value="/admin/pbstoreselectlist.do"/>";
    </script>
    <script src="<c:url value="/resources/js/store/updateformpb.js"/>"></script>
</body>
</html>