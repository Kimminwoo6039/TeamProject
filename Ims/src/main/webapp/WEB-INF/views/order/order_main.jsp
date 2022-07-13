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
<body style="width: 1600px;text-align: center;margin: auto;">

<header class="navbar navbar-dark sticky-top bg-white flex-md-nowrap p-3 shadow" style="height: 80px;">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#" style="text-align: center;margin-left: 900px;background: black;color: white;" >마이페이지</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-1 col-lg-1 col-mt-3 d-md-block bg-white sidebar collapse">
      <div class="position-sticky pt-3 mt-5">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
            주문정보
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              회원정보
            </a>
          </li>
         
        </ul>

      <!--   <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
       
        </ul>
      </div> -->
    </nav>

<div>
<H2 style="text-align: center;margin-top: 30px;margin-bottom: 5px;">주문 내역</H2>
</div>
<table class="table table-success" style="margin-top: 20px;">
  <tbody align="center" style="align-items: center;">
  <Tr style="background: ##33ff00">
  

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









</body>
</html>