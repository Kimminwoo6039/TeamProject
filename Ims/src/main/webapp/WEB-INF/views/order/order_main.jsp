<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
  font-size: .875rem;
  background-color: red;
}

.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

/*
 * Sidebar
 */

.sidebar {
  position: fixed;
  top: 0;	
  /* rtl:raw:
  right: 0;
  */
  bottom: 0;
  /* rtl:remove */
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 5rem;
  }
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #727272;
}

.sidebar .nav-link.active {
  color: #2470dc;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

/*
 * Navbar
 */

.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: 1rem;
  background-color: rgba(0, 0, 0, .25);
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .navbar-toggler {
  top: .25rem;
  right: 1rem;
}

.navbar .form-control {
  padding: .75rem 1rem;
  border-width: 0;
  border-radius: 0;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}
</style>

	<style>
	/* nav 메뉴 css */
		#basicInfo{
			background-color: purple;
			opacity:0.5;
			margin: 30px 0px 30px 0px;
			padding: 20px 0px 0px 15px;
			color: #ffffff;
			font-size: 20px;
			width: 190px;
			height: 150px;
		}
		#navMenu{
			margin-bottom: 40px;
		}
		#navSub{
			color: #C1B2B2;
		}
		#menuHead{
			font-weight: bold;
			font-size: 20px;
		}
		.navA{
			text-decoration: none;
			color: #C1B2B2;
		}
		.navA:hover{
			color: #CB7878;
		}
		.pa_top{
			padding-top:7px;
		}
		#myPageTitle{
			text-decoration: none;
			color: #000000;
		}
	/* nav 메뉴 css */
	</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <c:if test="${message==cancel}">

<script>
window.onload = function(){
	init();
}

function init(){
	alert("주문을 취소했습니다");
}


</script>

</c:if> --%>


<script>

function cancel_order(order_idx){
	var answer = confirm("주문을 취소하시겠습니까?");
	if(answer == true){
		var formObj = document.createElement("form"); //폼 요소 생성
		var i_order_id = document.createElement("input"); // input 생성
		
		i_order_id.name = "order_idx";
		i_order_id.value = order_idx;
		
		formObj.appendChild(i_order_id);
		document.body.appendChild(formObj);
		formObj.method="post";
		formObj.action="/shop/mypage/cancel.do";
		formObj.submit();
	}
}

</script>


</head>
<body style="width: 1000px;margin: auto;">

<aside style="float: left;margin-left: 20px;margin-top: 60px;">
	<!-- nav바   -->

	<div id="basicInfo">
		<div><b>a</b>님</div>
		<div>내 등급 : 
			
				
					<b>Bronze</b>
	
			
		</div>
		<div>내 적립금 : 
			<b>
				0원
			</b>
		</div>
	</div>
	<!-- 쇼핑정도, 나의 황동, 회원 정보 NAV -->
	<div id="navMenu">
		<div id="menuHead">쇼핑정보</div>
		<div id="navSub">
			<div class="pa_top"><a class="navA" href="/team_Bling/Delivery/main.do?page=1&kind=E">주문확인/배송조회</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/Basket/like1.do?kind=A">관심상품</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/Basket/cart.do">장바구니</a></div>
		</div>
	</div>
	<div id="navMenu">
		<div id="menuHead">나의 활동</div>
		<div id="navSub">
			<div class="pa_top"><a class="navA" href="/team_Bling/Review/myReview.do">나의 리뷰</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/Customer/my_qestion.do?page=1">나의 문의 내역</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/Custom/list.do">커스터마이징</a></div>
		</div>
	</div>
	<div>
		<div id="menuHead">회원정보</div>
		<div id="navSub">

			<div class="pa_top"><a class="navA" href="/team_Bling/MyPage/modify.do">나의 정보/수정</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/Addr/main.do?page=1">배송지 목록</a></div>
			<div class="pa_top"><a class="navA" href="/team_Bling/MyPage/deletemain.do">회원탈퇴</a></div>
		</div>
	</div>
</aside>



<article style="float: right;width: 790px;">



<div>
<H2 style="text-align: center;margin-top: 32px;margin-bottom: 5px;">주문 내역</H2>
</div>
<table class="table table-hover" style="margin-top: 20px;">
  <tbody align="center" style="align-items: center;font-size: 15px;">
  <Tr style="background-color: purple;opacity: 0.5;color: white;" >
  

   <td>주문번호</td>
  <td>주문일자</td>
  <td>주문상품</td>
   <td>주문금액</td>
   <td>주문상태</td>
   <td>주문자</td>
   <td>주문취소</td>
  </Tr>
  <!-- 여기까지 상단탭 -->
  
  
  <c:forEach var="item" items="${list}">
  
  <c:choose>
 <c:when test="${item.delivery_state=='cancle'}">
<tr bgcolor="red">
</c:when>
<c:otherwise>
<tr bgcolor="orange">
</c:otherwise>
  </c:choose>
  
  
  <tr>
  
  
   <td>
    ${item.order_idx}
  </td>
  
  <td>
   ${item.date}
  </td>
  
  <td>
  ${item.order_product}
  </td>
  
  <td>
 <fmt:formatNumber value="${item.order_sum}" pattern="#,###" />&nbsp;원
  </td>
  
  <td>
  <strong>
 <c:choose>
  <c:when test="${item.delivery_state=='prepared'}"> <!-- 조건문을 걸어줌 -->
  배송 준비중
  </c:when>
  <c:when test="${item.delivery_state=='delivering'}"> <!-- 조건문을 걸어줌 -->
  배송중
  </c:when>
  <c:when test="${item.delivery_state=='finished'}"> <!-- 조건문을 걸어줌 -->
  배송완료
  </c:when>
  <c:when test="${item.delivery_state=='cancle'}"> <!-- 조건문을 걸어줌 -->
  주문 취소
  </c:when>

  <c:when test="${item.delivery_state=='return'}"> <!-- 조건문을 걸어줌 -->
  반품

  </c:when>
 </c:choose>
 </strong>
  </td>
  
  <td>
  ${item.order_name}
  </td>
  
  <td>
  
  <c:choose>
  
  <c:when test="${item.delivery_state=='prepared'}">
  <input type="button" onclick="cancel_order(${item.order_idx})" value="주문취소">
  </c:when>
  <c:otherwise>
    <input type="button" onclick="cacel_order('${item.order_idx}')" value="주문취소" disabled="disabled">
  
  </c:otherwise>
  
  </c:choose>
  
  
  </td>
  
  </tr>
  <c:set var="pre_order_id" value="${item.order_id}" />
  </c:forEach>
  
  </tbody>




</table>
</article>








</body>
</html>