<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${ct == 'notice' }">
		<title>noticeWrite</title>
	</c:when>
	<c:when test="${ct == 'qna' }">
		<title>qnaWrite</title>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
		
</style>

<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#submit").on('click' , function(){
			
			let category = $("#category").val();
			let title = $("#title").val();
			let name = $("#name").val();
			let content = $("#content").val();
			let dq_ct = ${"#dq_ct"}.val();
			
			
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
				
			}else if(dq_ct_idx == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#dq_ct_idx").focus();
				return false;	
				
			}
		});
	});
	
	
</script>
</head>
<%@ include file="../include/menu.jsp" %>
<body class="text-center">
<c:choose>
	<c:when test="${ct == notice or ct == qna}">
		<c:if test="${sessionScope.name != '관리자'}">
			<script>
			alert("유효하지 않은 접근입니다.");
			location.href="/";
			</script>
		</c:if>
	</c:when>
	
</c:choose>


	<form class="form-data" id="form" action="${pageContext.request.contextPath}/board/${ct}/WriteProcess.do" method="post" enctype="multipart/form-data">
		
			
		<div class="container">
		<!-- 제목 -->
		<div class="form-group">
			<div class="input-group">
				<c:choose>
					<c:when test="${ct == 'dq' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="2" <c:if test="${ct=='dq'}"><c:out value="selected">selected</c:out></c:if>>1:1문의</option>
						</select>
					</c:when>
					<c:when test="${ct == 'notice' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="0" <c:if test="${ct=='notice'}"><c:out value="selected">selected</c:out></c:if>>공지사항</option>				
						</select>
					</c:when>
					<c:otherwise>
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="1" <c:if test="${ct=='qna'}"><c:out value="selected">selected</c:out></c:if>>qna</option>				
						</select>
					</c:otherwise>
				</c:choose>
				<!-- s :문의 유형 -->
				<c:if test="${ct=='dq'}">
					<select id="dq_ct_idx" name="dq_ct_idx" class="form-control col-2" aria-label="Default select example">
						<option value="10">환불문의</option>
						<option value="11">교환문의</option>
						<option value="12">AS문의</option>
						<option value="13">배송문의</option>						
					</select>
				</c:if>
				<!-- e :문의유형 -->
				<input type="text" class="form-control col-auto" id="title" placeholder="제목을 입력하세요" name="title" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="title_result"></div>
				<!-- s:hidden여부 -->
				<c:if test="${ct == 'dq'}">
					<div class="form-check form-switch form-control col-1">
						<input class="form-check-input" type="checkbox" value="1" id="flexSwitchCheckDefault" name="hidden" id="hidden">
						<label class="form-check-label" for="flexSwitchCheckDefault">
						비밀글
						</label>
					</div>
				</c:if>
				<!-- e:hidden여부 -->
				<!-- 작성자 -->
				<input type="text" class="form-control col-sm-2" id="name" placeholder="작성자" readonly="readonly" value="${sessionScope.userid}" name="member_id" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="writer_result"></div>
			</div>
			
			
		<!--  -->
			<textarea style="height:400px;" class="form-control" name="content" rows="" cols="" id="content" placeholder="내용을 입력하세요"></textarea>
			<div id="content_result"></div>
		
            <input type="file" accept='image/jpg,impge/png,image/jpeg,image/gif' class="bg-light form-control" multiple="multiple" name="files">        
        </div>
		
		<div class="form-group pt-1 text-right">
		
			<input class="btn btn-outline-secondary" id="submit" type="submit" value="글작성"/>
			
			<input class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/board/${ct}/List.do'"/>
			
		</div>
		</div>
	</form>

</body>
</html>