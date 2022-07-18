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
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">

<style>
.white-link{color:#fff;}
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<script>





/* function selChange() {
	var sel = document.getElementById('perPageNum').value;
	location.href="List.do?page=${pageMaker.cri.page}&perPageNum="+sel;
} */
</script>
</head>

<%@ include file="../../include/menu.jsp" %>
<body class="text-center">


<form name="moveForm" method="get">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form>
	<div class="container">
	<div class="">
	<div class="text-left">
		<span class="h3">공지사항l</span>
		<span class="h5">Im`s의 소식을 알려드립니다.</span>
	</div>
	<!-- 검색기능 -->
	
				<form class="navbar-form" autocomplete="off" action="/shop/board/notice/List.do" method="post">
				
					<div class="input-group" style="display: flex;">
						<div class="form-group navbar-left" style="display: flex;">	
							<select class="form-control" name="type" id="type" style="width:150px;">
						        <option value="title" 
									<c:if test="${map.search_option == 'title'}">selected</c:if>
									        >제목</option>
						        <option value="content" 
									<c:if test="${map.search_option == 'content'}">selected</c:if>
									        >내용</option>
						      	<option value="all" selected 
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
	
	<c:if test="${sessionScope.name == '관리자'}">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/board/notice/Write.do'">글쓰기</button>
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
		<%-- <div style="float:right;">
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
	<section class="ftco-section">
	<div class="table-wrap">
	<table class="table myaccordion table-hover" id="accordion">
		<thead>
			<tr>
				<td>번호</td>
				<td style="width:650px;">제목</td>
				<td style="width:300px;">작성일</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<!-- 리스트 시작 -->
			<%-- 	<c:choose>
					<c:when test="${admin_name eq '관리자'}"> --%>
						<c:forEach var="nList" items="${list}">
							<tr>
								<td>${nList.bidx}</td>
								<td class="text-left"><a href="/shop/board/notice/View.do/${nList.bidx}">${nList.title}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.regdate }" />
								</td>
								<td></td>
							</tr>
						</c:forEach>	
					<%-- </c:when>
					
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
					    	<td style="display:none;" colspan="4" id="collapseOne" class="collapse show acc" data-parent="#accordion">
					    		<div>
					    		<p>${nList.n_content}</p>
					    		<c:choose>
					    			<c:when test="${nList.filename != null}">
					    				<img src="/shop/resources/images/${nList.filename}"/>
					    			</c:when>
					    			<c:when test="${nList.filename == null}">
					    				<p/>
					    			</c:when>
					    		</c:choose>
					    		</div>
					    	</td>
					    </tr>
					    </c:forEach>	
					</c:when>
				</c:choose> --%>
			<!-- List 끝 -->
		</tbody>
	</table>
	<!-- <script type="text/javascript">
	$('#collapseDiv').collapse("toggle");
	</script>
	
  <div class="panel panel-primary">
    <div class="panel-heading" id="panel-head">


      <a data-toggle="collapse" data-target="#collapseDiv" class="white-link" id="toggle">Records Added
                        <span class="indicator glyphicon glyphicon-chevron-down pull-left pad-right" id ="glyphicon"></span>
                    </a>

    </div>


    <div id="collapseDiv" class="panel-collapse collapse">
      <div class="panel-body">
	
	
	 </div>
	 </div>
	 </div>
	 
	 <script> -->
	<!-- 
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Collapsible Group Item #1
        </a>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
	 </div>-->
	 </div> 
	<!-- 
/* 	 $('.collapse').collapse()
	 $('#myCollapsible').collapse({
		  toggle: false
		})
	 $('#myCollapsible').on('hidden.bs.collapse', function () {
  // do something…
}) */
	 </script> -->
	</section>
	
	<div class="example" style="display: block; text-align: center;">
		<nav aria-label="...">
			
					 <ul class="pagination justify-content-center" id="pageInfo">
					 <!-- 처음페이지로 이동하기 -->
						<c:choose>
							<c:when test="${pageMaker.cri.page != 1}">
								<li class="page-item">
									<a class="page-link" href="/shop/board/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="/shop/board/notice/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- 항상 이전페이지가 보이게 -->
						<c:choose>
							<c:when test="${pageMaker.prev == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/board/notice/List.do?page=${pageMaker.startPage - 1}">Previous</a>
								</li>
							</c:when>
							<c:when test="${pageMaker.prev == false}">
							<li class="page-item disabled">
								<a class="page-link" href="/shop/board/notice/List.do?page=${pageMaker.startPage - 1}">Previous</a>
							</li>
							</c:when>
						</c:choose>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${num == pageMaker.cri.page}">
									<li class="page-item active">
										<a class="page-link" href="/shop/board/notice/List.do?page=${num}">${num}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="/shop/board/notice/List.do?page=${num}">${num}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pageMaker.next == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/board/notice/List.do?page=${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:when>
						</c:choose>
						
						<!-- 마지막페이지로 이동하기 -->
						<c:choose>
							<c:when test="${pageMaker.cri.page < pageMaker.endPage}">
								<li class="page-item">
									<a class="page-link" href="/shop/board/notice/List.do?page=${pageMaker.endPage}&perPageNum=${pageMaker.cri.perPageNum}">End</a>
								</li>
							</c:when>
							
						</c:choose>
					</ul>
				
			
		</nav>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/'">돌아가기</button>
	</div>
	</div><%-- 
	<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script> --%>
 
</body>
</html>