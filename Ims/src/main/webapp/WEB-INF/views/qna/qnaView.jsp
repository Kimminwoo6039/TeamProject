<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>qnaView</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
	//삭제하기 클릭 시 창 띄우기 
		/* $(function(){
			$("#del").on(click, function(){
				confirm("삭제하시겠습니까?");
				
				return;
			});
			href="/shop/qna/Delete.do/${vo.q_bidx}";
		}); */
	</script>
	
</head>

<%@ include file="../include/menu.jsp" %>
<body class="text-center">
<form name="moveForm" method="get">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="PerPageNum" value="${pageMaker.cri.PerPageNum}">
	<input type="hidden" name="q_bidx" value="${vo.q_bidx}">
<div class="container">
	<table class="table">
		<tr>
		<td>
			<p class="text">${vo.q_title}</p>
			<td>
		</tr>
		<tr>
			<td><p class="text">${vo.q_content}</p><br/>
				<!-- 만약 이미지가 없을 때 엑박 처리되는 형상 제거 -->
				<c:choose>
					<c:when test="${vo.filename == '-' or vo.filename == 'noimg'}">
						<img src="/shop/resources/images/${vo.filename}" id="filename" width="0" height="0"/>
					</c:when>
					<c:otherwise>
						<img src="/shop/resources/images/${vo.filename}" id="filename" width="500px" height="500px;"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>
			<a class="btn btn-outline-secondary" href="/shop/qna/Modify.do/${vo.q_bidx}">수정하기</a>
			<a class="btn btn-outline-secondary" href="/shop/qna/Delete.do/${vo.q_bidx}">삭제하기</a>
			<a class="btn btn-outline-secondary" href="<c:url value='/qna/List.do'/>">돌아가기</a>
			<a class="btn btn-outline-secondary" href="<c:url value='/'/>">HOME</a>
			</td>
		</tr>
	</table>
</div>
</form>	
</body>
</html>