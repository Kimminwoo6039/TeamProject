<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

function cancel_order(order_id){
	var answer = confirm("주문을 취소하시겠습니까?");
	if(answer == true){
		var formObj = document.createElement("form"); //폼 요소 생성
		var i_order_id = document.createElement("input"); // input 생성
		
		i_order_id.name = "order_id";
		i_order_id.value = order_id;
		
		formObj.appendChild(i_order_id);
		document.body.appendChild(formObj);
		formObj.method="post";
		formObj.action="/shop/mypage/cancel.do";
		formObj.submit();
	}
}

</script>


</head>
<body>




<table border="1" style="text-align: center;margin-left: 800px;margin-top: 500px;">
  <tbody align="center" style="align-items: center;">
  <Tr style="background: ##33ff00">
  <td>주문번호</td>
  <td>주문일자</td>
  <td>주문내역</td>
   <td>주문금액</td>
   <td>주문상태</td>
   <td>주문자</td>
   <td>주문취소</td>
  </Tr>
  <!-- 여기까지 상단탭 -->
  
  
  <c:forEach var="item" items="${list}">
  
  
  <tr>
  
  <td>
    ${item.order_id}
  </td>
  
  <td>
   ${item.date}
  </td>
  
  <td>
  ${item.order_product}
  </td>
  
  <td>
  ${item.order_sum}
  </td>
  
  <td>
  <strong>
 <c:choose>
  <c:when test="${item.delivery_state=='delivery_prepared'}"> <!-- 조건문을 걸어줌 -->
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
  
  <c:when test="${item.delivery_state=='delivery_prepared'}">
  <input type="button" onclick="cancel_order(${item.order_id})" value="주문취소">
  </c:when>
  <c:otherwise>
    <input type="button" onclick="cacel_order('${item.order_id}')" value="주문취소" disabled="disabled">
  
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