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
/* 
$(function(){
	$("#p_on").on("click", function(){
		$("#s_off").show();
		$("#p_on").attr("id", "p_off");
		$("#s_off").attr("id", "s_on");
	});
	
}); 
*/

/* 
function dis4(){
	if($('#dis4').css('display') == 'none'){
		$('#dis4').show();
	}else{
		$('#dis4').hide();
	}
}
function dis3(){
	if($('#dis3').css('display') == 'none'){
		$('#dis3').show();
	}else{
		$('#dis3').hide();
	}
}
function dis2(){
	if($('#dis2').css('display') == 'none'){
		$('#dis2').show();
	}else{
		$('#dis2').hide();
	}
}
function dis1(){
	if($('#dis1').css('display') == 'none'){
		$('#dis1').show();
	}else{
		$('#dis1').hide();
	}
}
 */
	// 5개, 10개, 15개, 20개 보기 변경 스크립트
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/shop/notice/List.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
 
// 검색기능 스크립트
/* 
$(".form-control").on("click", function(e){
	e.preventDefault();
	let var = $("input[name='keyword']").val();
	moveForm.find("input[name='keyword']").val(val);
	moveForm.find("input[name=nowPage]").val(1);
	moveForm.submit();
});
 */
function getSearchList(){
	$.ajax({
		type: 'GET',
		url : "/getSearchList",
		data : $("form[name=search_form]").serialize(),
		success : function(result){
			//테이블 초기화
			$('.table > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str+="<td>${nList.n_bidx }</td>";
					str+="<td><a href = '/shop/notice/View.do/${nList.n_bidx}'>${nList.n_title}</a></td>";
					str+="<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" /></td>";
					str+="</tr>"
					$('.table').append(str);
        		})				 
			}
		}
	})
}
</script>
</head>
<body class="text-center"><%-- 
<input type="hidden" name="nowPage" <c:out value='value="${paging.nowPage}"'/>>
<input type="hidden" name="cntPerPage" <c:out value='value="${paging.cntPerPage}"'/>> --%>
<input type="hidden" >
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
	
	<form id="Search_form" autocomplete="off">
		<div class="row">
			<div class="col col-lg-3">
				<div class="input-group mb-4">
					<select class="form-control" name="type" style="width:150px;">
						<option selected value="">선택</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="hidden" name="keyword">
					<input type="text" class="form-control" onclick="getSearchList()" aria-label="Recipient's username" aria-describedby="button-addon2" name="keyword" id="keyword" value="">
					<button class="btn btn-outline-dark" type="submit" id="btn_Search"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			<div class="col">
				<a class="text-dark" href="#">1:1문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">상품문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">고객 의견 게시판</a>
			</div>
		</div>
	</form>
		<!--  -->
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/notice/Write.do'">글쓰기</button>
		
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-between">
		<div>
		<%-- <c:choose>
			<c:when test="${not empty keyword}">
				<p><strong>${keyword}</strong> 키워드로 검색된<strong>${paging.total}개의 게시물이 있습니다.</strong></p>
			</c:when>
			<c:otherwise>
				<p>현재 <strong>${paging.total}</strong>개의 게시물이 있습니다.</p>
			</c:otherwise>
		</c:choose> --%>
		</div>
		<div  style="float:right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">			
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄보기</option>	
			</select>
		</div>
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
				
					<c:forEach var="nList" items="${viewAll}">

						<tr id="show" onclick="dis4()">
							<td>${nList.n_bidx }</td>
							<td class="text-left"><a href="/shop/notice/View.do/${nList.n_bidx}">${nList.n_title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" />
							</td>
						</tr>
						<tr id="dis4" style="display:none"><!-- style="display:none"  ==  class="d-none"-->
							<td colspan=3 class="text-left">
							${nList.n_content}
							</td>
						</tr>
					</c:forEach>
				

			</tbody>
	</table>
	
	
	<div class="example" style="display: block; text-align: center;">
		<nav aria-label="...">
			<ul class="pagination justify-content-center" id="pageInfo">
				<!-- 처음페이지로 이동하기 -->
				<c:choose>
					<c:when test="${paging.nowPage != 1}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?firstPage=${paging.firstPage}&cntPerPage=${paging.cntPerPage}">first</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?firstPage=${paging.firstPage}&cntPerPage=${paging.cntPerPage}">first</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 항상 이전버튼이 보이게 -->
				<c:choose>
					<c:when test="${paging.startPage != 1}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">Prev</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">Prev</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!--  -->
				<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<li class="page-item active" aria-current="page">
								<a class="page-link">${p}</a>
							</li>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<li class="page-item">
								<a class="page-link" href="/shop/notice/List.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 항상 다음버튼이 보이게 -->
				<c:choose>
					<c:when test="${paging.endPage != paging.lastPage}">
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 마지막페이지로 이동하기 -->
				<c:choose>
					<c:when test="${paging.nowPage eq paging.lastPage}">
						<li class="page-item disabled">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">END</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">END</a>
						</li>					
					</c:otherwise>
				</c:choose>
					
				<!--  -->
				
				<%-- 
				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item">
						<a class="page-link" href="/shop/notice/List.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
					</li>
				</c:if>
				 --%>
			</ul>
		</nav>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/'">돌아가기</button>
	</div>
	</div>

</body>
</html>