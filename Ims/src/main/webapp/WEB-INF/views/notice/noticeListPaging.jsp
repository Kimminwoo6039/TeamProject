<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>noticeList</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<style>

<!-- 게시판 페이징 색상 파란색에서 회색으로 변경 -->
.pagination > li > a, .pagination > li > span{
     color:black !Important;       
}
.page-link {
  Color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 Color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus,
.page-link:hover {
  Color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

<!-- ! -->
</style>
<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>





/* function selChange() {
	var sel = document.getElementById('perPageNum').value;
	location.href="List.do?page=${pageMaker.cri.page}&perPageNum="+sel;
} */
</script>
</head>
<body class="text-center">

<%@ include file="../include/menu.jsp" %>

<form name="moveForm" method="get">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form>
<div class="py-3"></div><!-- padding y축 공백 -->
	<div class="h2">로고</div>
	<div class="py-3"></div><!-- padding y축 공백 -->
	<div class="container">
	<nav class="row">
		<div class="col-md-3"><a class="text-dark" href="#">메뉴1</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴2</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴3</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴4</a></div>
	</nav>
	<div class="py-5"></div><!-- padding y축 공백 -->
	<div class="py-5"></div><!-- padding y축 공백 -->
	<div class="">
	<div class="text-left">
		<span class="h3">공지사항l</span>
		<span class="h5">Im`s의 소식을 알려드립니다.</span>
	</div>
	<!-- 검색기능 -->
	
				<form class="navbar-form" autocomplete="off" action="/shop/notice/List.do" method="post">
				
					<div class="input-group" style="display: flex;">
						<div class="form-group navbar-left" style="display: flex;">	
							<select class="form-control" name="type" id="type" style="width:150px;">
						        <option value="title" 
									<c:if test="${map.search_option == 'title'}">selected</c:if>
									        >제목</option>
						        <option value="content" 
									<c:if test="${map.search_option == 'content'}">selected</c:if>
									        >내용</option>
						      	<option value="all" 
									<c:if test="${map.search_option == 'all'}">selected</c:if>
									        >내용+제목</option>
					   		</select>
							<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name="keyword" value="${paging.spvo.keyword}">
						</div>
						<div class="input-group-btn">
							<button class="btn btn-outline-dark" type="submit" id="btn_Search"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</form>
		<div class="">
			<div class="">
			</div>
			<div class="">
				<a class="text-dark" href="#">1:1문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">상품문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">고객 의견 게시판</a>
			</div>
		</div>
	
		<!--  -->
	</div>
	
	<c:if test="${admin_name == '관리자'}">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/notice/Write.do'">글쓰기</button>
		</div>
	</c:if>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-between">
		<div>
		<c:choose>
			<c:when test="${not empty pageMaker.cri.keyword}">
				<p><strong>${pageMaker.cri.keyword}</strong> 키워드로 검색된 <strong>${pageMaker.totalCount}개의 게시물이 있습니다.</strong></p>
			</c:when>
			<c:otherwise>
				<p>현재 <strong>${pageMaker.totalCount}</strong> 개의 게시물이 있습니다.</p>
			</c:otherwise>
		</c:choose>
		</div>
		<%-- <div  style="float:right;">
			<select id="perPageNum" name="sel" onchange="selChange()">			
				<option value="5"
					<c:if test="${pageMaker.cri.perPageNum == 5}">selected</c:if>>5줄보기</option>
				<option value="10"
					<c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10줄보기</option>
				<option value="15"
					<c:if test="${pageMaker.cri.perPageNum == 15}">selected</c:if>>15줄보기</option>
				<option value="20"
					<c:if test="${pageMaker.cri.perPageNum == 20}">selected</c:if>>20줄보기</option>	
			</select>
		</div> --%>
	</div>
	<table class="table">
		<thead>
			<tr>
				<td>번호</td>
				<td style="width:650px;">제목</td>
				<td style="width:300px;">작성일</td>
			</tr>
		</thead>
		<tbody>
		<!--  -->
		<tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		      <td scope="row">1</td>
		      <td>Laptop Technology AS2020</td>
		      <td>
		      	<i class="fa" aria-hidden="true"></i>
        	</td>
		    </tr>
		    <tr>
		    	<td colspan="3" id="collapseOne" class="collapse show acc" data-parent="#accordion">
		    		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
		    	</td>
		    </tr>
		<!--  -->
				<!-- List 시작 
					<c:choose>
					
						<c:when test="${admin_name eq '관리자'}">
							<c:forEach var="nList" items="${list}">
								<tr>
									<td>${nList.n_bidx }</td>
									<td class="text-left"><a href="/shop/notice/View.do/${nList.n_bidx}">${nList.n_title}</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" />
									</td>
									<td></td>
								</tr>
							</c:forEach>	
						</c:when>
						
						<c:when test="${admin_name != '관리자' or member_name eq null}">
						<c:forEach var="nList" items="${list}">
							<tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								<td scope="row">${nList.n_bidx }</td>
						    	<td>${nList.n_title}</td>
						   		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" /></td>
						   		<td>
								<i class="fa" aria-hidden="true"></i>
				        		</td>
						    </tr>
						    <tr>
						    	<td colspan="4" id="collapseOne" class="collapse show acc" data-parent="#accordion">
						    		<p>${nList.n_content}</p>
						    	</td>
						    </tr>
						    </c:forEach>	
						</c:when>
					</c:choose>
					
						<%-- <c:forEach var="nList" items="${list}">

						<tr id="show" onclick="dis${nList.n_bidx}()">
							<td>${nList.n_bidx }</td>
							<!-- <td class="text-left"><a href="/shop/notice/View.do/${nList.n_bidx}">${nList.n_title}</a></td> -->
							<td class="text-left">${nList.n_title}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" />
							</td>
						</tr>
						<tr id="dis${nList.n_bidx}()" style="display:none"><!-- style="display:none"  ==  class="d-none"-->
							<td colspan=3 class="text-left">
							${nList.n_content}
							</td>
						</tr>
					</c:forEach> --%>
				<!-- List 끝 -->
			</tbody>
	</table>
	
	
	<div class="example" style="display: block; text-align: center;">
		<nav aria-label="...">
			<ul class="pagination justify-content-center" id="pageInfo">
				<%-- 
				<!-- 처음페이지로 이동하기 -->
				<c:choose>
					<c:when test="${pageMaker.page != 1}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 항상 이전버튼이 보이게 -->
				<c:choose>
					<c:when test="${pageMaker.startPage != 1}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.startPage - 1}&perPageNum=${pageMaker.cri.perPageNum}">Prev</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.startPage - 1}&perPageNum=${pageMaker.cri.perPageNum}">Prev</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!--  -->
				<c:forEach var="p" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<c:choose>
						<c:when test="${p == pageMaker.Page}">
							<li class="page-item active" aria-current="page">
								<a class="page-link">${p}</a>
							</li>
						</c:when>
						<c:when test="${p != pageMaker.Page}">
							<li class="page-item">
								<a class="page-link" href="/shop/notice/List.do?page=${p }&perPageNum=${pageMaker.cri.perPageNum}">${p}</a>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 항상 다음버튼이 보이게 -->
				<c:choose>
					<c:when test="${pageMaker.next != pageMaker.endPage}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage+1 }&perPageNum=${pageMaker.cri.perPageNum}">Next</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage+1 }&perPageNum=${pageMaker.cri.perPageNum}">Next</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 마지막페이지로 이동하기 -->
				<c:choose>
					<c:when test="${pageMaker.page eq pageMaker.endPage}">
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage}&perPageNum=${pageMaker.cri.perPageNum}">End</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage}&perPageNum=${pageMaker.cri.perPageNum}">End</a>
						</li>					
					</c:otherwise>
				</c:choose>
					 --%>
					 
					 <ul class="pagination justify-content-center" id="pageInfo">
					 <!-- 처음페이지로 이동하기 -->
						<c:choose>
							<c:when test="${pageMaker.cri.page != 1}">
								<li class="page-item">
									<a class="page-link" href="/shop/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="/shop/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- 항상 이전페이지가 보이게 -->
						<c:choose>
							<c:when test="${pageMaker.prev == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.startPage - 1}">Previous</a>
								</li>
							</c:when>
							<c:when test="${pageMaker.prev == false}">
							<li class="page-item disabled">
								<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.startPage - 1}">Previous</a>
							</li>
							</c:when>
						</c:choose>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?page=${num}">${num}</a>
						</li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pageMaker.next == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:when>
							<c:when test="${pageMaker.next == false}">
								<li class="page-item disabled">
									<a class="page-link" href="/shop/notice/List.do?page=${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:when>
						</c:choose>
					</ul>
				
			</ul>
		</nav>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/'">돌아가기</button>
	</div>
	</div>

</body>
</html>