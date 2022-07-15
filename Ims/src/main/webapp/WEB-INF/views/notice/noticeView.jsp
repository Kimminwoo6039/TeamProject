<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>noticeView</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<script src="<c:url value="${pageContext.request.contextPath}/resources/js/raphael.min.js" />"></script>
	<script src="<c:url value="${pageContext.request.contextPath}/resources/js/morris.min.js" />"></script>
	<script src="<c:url value="${pageContext.request.contextPath}/resources/js/morris-data.js" />"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	/* 	$(function(){
			$("#delete").on(click, function(){
				alert('삭제');
				
				location.href = "/shop/notice/Delete.do/${vo.n_bidx}";	
			});
			
			
		});
		 */
	</script>
</head>

<%@ include file="../include/menu.jsp" %>
<body class="text-center">
<form name="moveForm" method="get">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="PerPageNum" value="${pageMaker.cri.PerPageNum}">
	<input type="hidden" name="n_bidx" value="${vo.n_bidx}">
<div class="container">
	<table class="table">
		<tr>
		<td>
			<p class="text">${vo.n_title}</p>
			<td>
		</tr>
		<tr>
			<td><p class="text">${vo.n_content}</p><br/>
			
				<img src="/shop/resources/images/${vo.filename}" id="filename" width="500px" height="500px;"/>
				<%-- <c:choose>
					<c:when test="${vo.filename }">
						<img src="/shop/resources/images/${vo.filename}" id="filename" width="500px" height="500px;"/>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose> --%>
			</td>
		</tr>
		<tr>
			<td>
			<a class="btn btn-outline-secondary" href="/shop/notice/Modify.do/${vo.n_bidx}">수정하기</a>
			
			<input class="btn btn-outline-secondary" type="submit" name="delete" value="B!삭제" onclick="delete()">
			<a class="btn btn-outline-secondary" id="del" href="/shop/notice/Delete.do/${vo.n_bidx}">삭제하기</a>
			
			<a class="btn btn-outline-secondary" href="<c:url value='/notice/List.do'/>">돌아가기</a>
			<a class="btn btn-outline-secondary" href="<c:url value='/'/>">HOME</a>
			</td>
		</tr>
	</table>
	<script>
	//삭제하기 클릭 시 창 띄우기 
		$(function(){
			$("del").on(click, function(){
				confirm("삭제하시겠습니까?");
				
			});
		});
	</script>
</div>
</form>	
</body>
</html>