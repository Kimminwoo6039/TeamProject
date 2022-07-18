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
<title>qnaList</title>
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
function dis5(){
	if($('#dis5').css('display') == 'none'){
		$('#dis5').show();
		$('#dis4').hide();
		$('#dis3').hide();
		$('#dis2').hide();
		$('#dis1').hide();
		$("#ico5").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow2.png");
		$("#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
		
	}else{
		$('#dis5').hide();
		$("#ico5,#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
		
	}return;
}	
function dis4(){
	if($('#dis4').css('display') == 'none'){
		$('#dis4').show();
		$('#dis5').hide();
		$('#dis3').hide();
		$('#dis2').hide();
		$('#dis1').hide();
		$("#ico4").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow2.png");
		$("#ico5,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}else{
		$('#dis4').hide();
		$("#ico5,#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
		
	}return;
}
function dis3(){
	if($('#dis3').css('display') == 'none'){
		$('#dis3').show();
		$('#dis4').hide();
		$('#dis5').hide();
		$('#dis2').hide();
		$('#dis1').hide();
		$("#ico3").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow2.png");
		$("#ico5,#ico4,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}else{
		$('#dis3').hide();
		$("#ico5,#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}return;
}
function dis2(){
	if($('#dis2').css('display') == 'none'){
		$('#dis2').show();
		$('#dis4').hide();
		$('#dis3').hide();
		$('#dis5').hide();
		$('#dis1').hide();
		$("#ico2").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow2.png");
		$("#ico5,#ico4,#ico3,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}else{
		$('#dis2').hide();
		$("#ico5,#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}return;
}
function dis1(){
	if($('#dis1').css('display') == 'none'){
		$('#dis1').show();
		$('#dis4').hide();
		$('#dis3').hide();
		$('#dis2').hide();
		$('#dis5').hide();
		$("#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow2.png");
		$("#ico5,#ico4,#ico3,#ico2").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}else{
		$('#dis1').hide();
		$("#ico5,#ico4,#ico3,#ico2,#ico1").attr("src","${pageContext.request.contextPath}/resources/img/ico_arrow.png");
	}return;
}




/* function selChange() {
	var sel = document.getElementById('perPageNum').value;
	location.href="List.do?page=${pageMaker.cri.page}&perPageNum="+sel;
} */
</script>
</head>

<%@ include file="../include/menu.jsp" %>
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
		<span class="h3">QnA l</span>
		<span class="h5">(자주 묻는 질문 답변)</span>
	</div>
	<!-- 검색기능 -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-between">
				<form class="navbar-form" autocomplete="off" action="/shop/qna/List.do" method="post">
				
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
			<div class="d-grid gap-2 d-md-flex justify-content-center">
				<a class="text-dark" href="#">1:1문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">상품문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">고객 의견 게시판</a>
			</div>
		</div>
	
		<!--  -->
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-between">
		
	
		<div class="">
		<c:choose>
			<c:when test="${not empty pageMaker.cri.keyword}">
				<p><strong>${pageMaker.cri.keyword}</strong> 키워드로 검색된 <strong>${pageMaker.totalCount}개의 게시물이 있습니다.</strong></p>
			</c:when>
			<c:otherwise>
				<p>현재 <strong>${pageMaker.totalCount}</strong> 개의 게시물이 있습니다.</p>
			</c:otherwise>
		</c:choose>
		</div>
		<c:choose>
			<c:when test="${sessionScope.name == '관리자'}">
				<div class="">
					<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/qna/Write.do'">글쓰기</button>
				</div>
			</c:when>
			<c:otherwise>
			<div class=""></div>
			</c:otherwise>
		</c:choose>
		
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
	
	<table class="table table-hover">
		<thead>
			<tr class="text-left">
				<th colspan=5>자주묻는질문TOP5</th>
			</tr>
		</thead>
		<tbody>
			<!-- tr5 -->
			<tr id="show" onclick="dis5()">
				<td style="width:60px"><img src="${pageContext.request.contextPath}/resources/img/ico_qna.png"></td>
				<td style="width:70px">1</td>
				<td class="text-left" style="width:300px;">교환관련->교환배송료</td>
				<td class="text-left">교환 배송료나 차액금은 어디서 결제하나요?</td>
				<td><img id="ico5" src="${pageContext.request.contextPath}/resources/img/ico_arrow.png"></td>
			</tr>
			<tr id="dis5" style="display:none">	<!-- display:none  ==  class="d-none"-->	
				<td></td>
				<td colspan=5 class="text-left">
				<p><strong><a>마이페이지-교환/환불/AS현황</a></strong>에서 배송료 및 차액금을 결제하실 수 있습니다.</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<span style="color:#ff0000">해외 배송 건은 상품 교환이 불가능합니다. 양해 부탁드리겠습니다.</span>
				</td>
			</tr>
			<!-- tr5 -->
			
			<!-- tr4 -->
			<tr id="show" onclick="dis4()">
				<td style="width:60px"><img src="${pageContext.request.contextPath}/resources/img/ico_qna.png"></td>
				<td style="width:70px">2</td>
				<td class="text-left" style="width:300px;">교환관련->교환방법</td>
				<td class="text-left">어떤 경우에 상품의 교환, 환불이 되지 않나요?</td>
				<td><img id="ico4" src="${pageContext.request.contextPath}/resources/img/ico_arrow.png"></td>
			</tr>
			<tr id="dis4" style="display:none"><!-- display:none  ==  class="d-none"-->
				<td colspan=5 class="text-left">
				<strong>* Im`s몰에서는 모든 상품의 교환 및 환불 처리를 해드리고 있사오나 부득이 다음과 같은 경우는 교환 및 환불이 되지 않습니다.</strong>
				<p>1. 제품 수령 후 7일이 지난 경우</p>
				<p>&nbsp;</p>
				<p>2. 7일 이전이라도 제품을 사용하신 경우</p>
				<p>(야외에서 사용을 목적으로 착용한 것뿐만아니라 실내나 차량 내부 등에서도 단순한 사이즈 확인을 넘어서는 착용을 하시어 육안과 후각으로도 쉽게 제품의 재판매에 문제가 있다고 확인되는 경우는 교환 및 환불이 되지 않습니다.)</p>
				<p>&nbsp;</p>
				<p>3. 제품의 테그(상표)를 훼손하거나 분실하신 경우</p>
				<p>(테그의 유무가 가장 객관적인 제품의 사용여부 기준이 됩니다. 테그가 분실된 경우는 제품을 사용하고자 하는 목적으로 제거한 것으로 판단, 사용하신 것으로 분류되어 교환 및 환불이 불가능 합니다.)</p>
				<p>&nbsp;</p>
				<p>4. 구매 내역이 확인 되지 않는 경우</p>
				<p>&nbsp;</p>
				<p>5. 제품 원상태의 현저한 포장 훼손으로 제품 판매나 업체 반품 등에 문제가 있는 경우</p>
				<p>(제품의 특성상 포장을 뜯은 것만으로도 제품의 가치가 떨어지거나 판매가 되지 않는 경우는 교환 및 환불이 되지 않습니다.)</p>
				<p>&nbsp;</p>
				<p>6. 제품을 사용하지 않았으나 보관시의 부주의로 인하여 제품에 특정냄새가 배거나 오염된 경우</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>아래 <span style="color:#ff0000">교환/환불 시 주의사항</span>을 참고하시기 바랍니다.</p>
				<hr>
				<strong>1. 교환/환불 신청 가능 기간은 제품 수령 후 7일 이내입니다.</strong>
				<p>&nbsp;</p>
				<strong>2. 다음의 경우, 교환/환불 가능 기간에도 교환/환불이 불가할 수 있습니다.</strong>
				<p>-교환/환불 가능 기간이 지난 경우</p>
				<p>- 교환/환불 신청 후 7일 이내에 상품이 도착하지 않을 경우</p>
				<p>- 교환/환불하고자 하는 상품이 오염/훼손된 경우</p>
				<p>- 구매내역이 확인되지 않는 경우</p>
				<p>- 상품의 구성품 일부가 훼손되거나 분실된 경우</p>
				<p>(상품에 붙어 있는 상표 택, 브랜드 박스도 상품의 일부입니다. 택(tag)을 자르거나 훼손하는 경우, 브랜드 박스에 직접 테이핑하거나 송장을 부착한 경우 교환/환불이 불가합니다.)</p>
				<p>&nbsp;</p>
				<strong>3. 교환/환불 배송비는 다음과 같습니다.</strong>
				<p>- 교환 배송료 : 6,000원</p>
				<p>(교환 후 최종 결제 금액이 100,000원 미만일 경우 최초 배송료 3,000원이 추가로 발생합니다.)</p>
				<p>- 환불 배송료 : 6,000원</p>
				<p>(부분 환불일 경우 실 구매 상품이 100,000원 이상이면 환불 배송료는 3,000원이 됩니다.)</p>
				<strong>4. CJ대한통운 외 타 택배 착불 반송 시 배송비 전액을 고객님이 부담하셔야 합니다.</strong>
				<p>5. 교환/환불하고자 하는 상품에 사은품이 있었다면 택배 박스에 같이 담아 보내주시기 바랍니다.</p>
				
				</td>
			</tr>
			<!-- tr4 -->
			
			<!-- tr3 -->
			<tr id="show" onclick="dis3()">
				<td style="width:60px"><img src="${pageContext.request.contextPath}/resources/img/ico_qna.png"></td>
				<td style="width:70px">3</td>
				<td class="text-left" style="width:300px;">교환관련->교환배송료</td>
				<td class="text-left">교환 배송료나 차액금은 어디서 결제하나요?</td>
				<td><img id="ico3" src="${pageContext.request.contextPath}/resources/img/ico_arrow.png"></td>
			</tr>
			<tr id="dis3" style="display:none"><!-- display:none  ==  class="d-none"-->
				<td colspan=5 class="text-left">
				<p><strong><a>마이페이지-교환/환불/AS현황</a></strong>에서 배송료 및 차액금을 결제하실 수 있습니다.</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<span style="color:#ff0000">해외 배송 건은 상품 교환이 불가능합니다. 양해 부탁드리겠습니다.</span>
				</td>
			</tr>
			<!-- tr3 -->
			
			<!-- tr2 -->
			<tr id="show" onclick="dis2()">
				<td style="width:60px"><img src="${pageContext.request.contextPath}/resources/img/ico_qna.png"></td>
				<td style="width:70px">4</td>
				<td class="text-left" style="width:300px;">배송관련->배송기간</td>
				<td class="text-left">배송기간은 얼마나 되나요?</td>
				<td><img id="ico2" src="${pageContext.request.contextPath}/resources/img/ico_arrow.png"></td>
			</tr>
			<tr id="dis2" style="display:none"><!-- display:none  ==  class="d-none"-->
				<td colspan=5 class="text-left">
				<p>
				<strong>1.국내배송</strong><br>
				- 월요일부터 토요일 오후 6시 30분까지 결제 완료 시 당일 발송됩니다.<br>
				- 99% 이상은 발송 후 1~2일 내에 배송이 완료됩니다.&nbsp;
				</p>
				<p>&nbsp;</p>
				<p>
				<strong>2. 해외배송</strong><br>
				- 해외배송건은 당일발송 혜택이 적용되지 않으며, 주문일로부터 1~2일 내에 발송됩니다.&nbsp;<br>
				- 보통 발송 후 영업일 기준 1~3일 이내에 배송 완료됩니다. (FedEx Prioriy 서비스 기준)&nbsp;</p>
				</td>
			</tr>
			<!-- tr2 -->
			
			<!-- tr1 -->
			<tr id="show" onclick="dis1()">
				<td style="width:60px"><img src="${pageContext.request.contextPath}/resources/img/ico_qna.png"></td>
				<td style="width:70px">5</td>
				<td class="text-left" style="width:300px;">배송관련->주소변경</td>
				<td class="text-left">주문했는데, 주소를 변경할 수 있나요?</td>
				<td><img id="ico1" src="${pageContext.request.contextPath}/resources/img/ico_arrow.png"></td>
			</tr>
			<tr id="dis1" style="display:none"><!-- display:none  ==  class="d-none"-->
				<td colspan=5 class="text-left">
				<p>택배 출발을 하지 않은 상태(주문상태가 '
				<strong>발송준비 중</strong>
				' 또는 '
				<strong>입금확인 중</strong>
				'일 경우)라면, [
				<span style="color:#0000ff"><strong>
				마이페이지 &gt; 주문/배송조회</strong>
				</span>] 메뉴에서 직접 수정하실 수 있습니다.</p>
				</td>
			</tr>
			<!-- tr1 -->
		</tbody>
	</table>
	<!-- 메뉴 바 시작 -->
	<p>&nbsp;</p>
	<div class="list-group">
		<div class="row">
			<input type="button" class="col form-control btn-outline-secondary m-1" value="AS관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=AS'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="교환관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=교환'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="배송관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=배송'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="상품관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=상품'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="영수증" onclick="location.href='/shop/qna/List.do?type=all&keyword=영수증'"/>
		</div>
		<div class="row">
			<input type="button" class="col form-control btn-outline-secondary m-1" value="입금관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=입금'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="주문관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=주문'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="해외배송 관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=해외배송'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="환불관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=환불'"/>
			<input type="button" class="col form-control btn-outline-secondary m-1" value="회원관련" onclick="location.href='/shop/qna/List.do?type=all&keyword=회원'"/>
		</div>
	</div>
	<!-- 메뉴 바 끝 -->
	<p>&nbsp;</p>
	
	
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
						<c:forEach var="qList" items="${list}">
							<tr>
								<td>${qList.q_bidx}</td>
								<td class="text-left"><a href="/shop/qna/View.do/${qList.q_bidx}">${qList.q_title}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qList.q_regdate }" />
								</td>
								<td></td>
							</tr>
						</c:forEach>	
					<%-- </c:when>
					
					<c:when test="${admin_name != '관리자' or member_name eq null}">
					<c:forEach var="qList" items="${list}">
						<tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							<td scope="row">${qList.n_bidx }</td>
					    	<td>${qList.n_title}</td>
					   		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qList.n_regdate }" /></td>
					   		<td>
							<i class="fa" aria-hidden="true"></i>
			        		</td>
					    </tr>
					    <tr>
					    	<td style="display:none;" colspan="4" id="collapseOne" class="collapse show acc" data-parent="#accordion">
					    		<div>
					    		<p>${qList.n_content}</p>
					    		<c:choose>
					    			<c:when test="${qList.filename != null}">
					    				<img src="/shop/resources/images/${qList.filename}"/>
					    			</c:when>
					    			<c:when test="${qList.filename == null}">
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
	 </div>
	</section>
	
	<div class="example" style="display: block; text-align: center;">
		<nav aria-label="...">
			
					 <ul class="pagination justify-content-center" id="pageInfo">
					 <!-- 처음페이지로 이동하기 -->
						<c:choose>
							<c:when test="${pageMaker.cri.page != 1}">
								<li class="page-item">
									<a class="page-link" href="/shop/qna/List.do?startPage=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}">First</a>
								</li>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${pageMaker.prev == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/qna/List.do?page=${pageMaker.startPage - 1}">Previous</a>
								</li>
							</c:when>
						</c:choose>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${num == pageMaker.cri.page}">
									<li class="page-item active">
										<a class="page-link" href="/shop/qna/List.do?page=${num}">${num}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="/shop/qna/List.do?page=${num}">${num}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pageMaker.next == true}">
								<li class="page-item">
									<a class="page-link" href="/shop/qna/List.do?page=${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:when>
							
						</c:choose>
						
						<!-- 마지막페이지로 이동하기 -->
						<c:choose>
							<c:when test="${pageMaker.cri.page < pageMaker.endPage}">
								<li class="page-item">
									<a class="page-link" href="/shop/qna/List.do?page=${pageMaker.endPage}&perPageNum=${pageMaker.cri.perPageNum}">End</a>
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