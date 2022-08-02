<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${ct== 'notice'}">
		<title>noticeModify</title>
	</c:when>
	<c:when test="${ct== 'qna'}">
		<title>qnaModify</title>
	</c:when>
</c:choose>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<style>
		
</style>
<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
		
		
	$(function(){
		var fm = document.frm;
	
		$("fm").on('submit' , function(){
			alert('1');
			var category = $("#category").val();
			var title = $("#title").val();
			var name = $("#name").val();
			var content = $("#content").val();
			
			if(category  == ""){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;	
				
			}else if(title == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#title").focus();
				return false;	
				
			}else if(name == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#name").focus();
				return false;		
				
			}else if(content == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#content").focus();
				return false;	
				
			}
		});
	});
});	
	
	
</script>
</head>
<%@ include file="../include/menu.jsp" %>
<body class="text-center">

<c:if test="${sessionScope.name == null}">
	<script type="text/javascript">	
		alert("유효하지 않은 접근입니다.");
		location.href="/shop/"
	</script>	
</c:if>

<form class="form-horizontal" id="frm_Search" name="moveForm" method="post" action="/shop/board/${ct}/list.do" enctype="multipart/form-data">
<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
<input type="hidden" name="nowPage" value="${pageMaker.page}">
<input type="hidden" name="cntPerPage" value="${pageMaker.PerPageNum}">
<input type="hidden" name="bidx" value="${vo.bidx }">
<input type="hidden" name="ct_idx" value="${ct_idx}">
<input type="hidden" name="ct" value="${ct}">
</form>	
	
<!-- 제목 -->
<form class="form-horizontal" id="frm" name="moveForm" method="post" action="/shop/board/${ct}/update.do" enctype="multipart/form-data">
<input type="hidden" name="bidx" value="${vo.bidx }">
<div class="container">
	<div class="input-group">
		<select id="category" name="ct_idx" class="form-control col-sm-2" aria-label="Default select example">
			<option value="">카테고리</option>
			<option value="0" <c:if test="${ct=='notice'}"><c:out value="selected">selected</c:out></c:if>>공지사항</option>				
			<option value="1" <c:if test="${ct=='qna'}"><c:out value="selected">selected</c:out></c:if>>qna</option>				
			<option value="2" >1:1문의</option>
		</select>
		<input type="text" class="form-control col-sm-8" id="title" placeholder="title" name="title" value="${vo.title }" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
		<div id="title_result"></div>
		<!-- 작성자 -->
		<input type="text" class="form-control col-sm-2" id="name" readonly="readonly" value="${vo.member_id }" name="member_id" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
		<div id="writer_result"></div>
	</div>

<!--  -->
	<div>
		<textarea style="height:400px;" class="form-control" name="content" rows="" cols="" id="content" >${vo.content}</textarea>
		<div id="content_result"></div>
		<input type="file" accept='image/jpg,impge/png,image/jpeg,image/gif' class="bg-light form-control" multiple="multiple" name="files">    
		<img alt="" src="/shop/resources/images/${vo.filename}">
	</div>
</div>
<div class="container">
	<div class="pt-1 text-right"> 
		
		<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="submit" value="글수정"/>
		
		<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='/shop/board/${ct}/List.do'"/>
		
		 <button class="btn btn-outline-secondary" id="modi" type="submit">수정완료</button>
	</div>
</div>
</form>
</body>
</html>