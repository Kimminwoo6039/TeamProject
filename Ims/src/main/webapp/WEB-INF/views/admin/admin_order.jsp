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

function modify_order_state(order_idx,select_id){
	var delivery_state = document.getElementById(select_id);
	var index = delivery_state.selectedIndex;
	var value = delivery_state[index].value;
	
	
	$.ajax({
		type:"post",
		async:false,
		url:"/shop/admin/modify.do",
		data:{
			"order_idx" : order_idx,
			delivery_state:value
		},
		success : function(data,textStatus){
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="/shop/admin/main.do"
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요");
			}
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다 ." +data)
		},
		complete : function(data,textStatus){
			
		}
	});
}



</script>


</head>
<body>

<table style="border: 1px solid black;margin-left: 400px;margin-top: 200px;">
<tbody>
<tr style="background: #33ff00">
<td>주문번호</td>
<td>주문일자</td>
<td>주문내역</td>
<td>배송상태</td>
<td>배송수정</td>
</tr>
<!-- 여기까지 -->

<c:forEach var="item" items="${list}" varStatus="i">

<c:choose>

<c:when test="${item.delivery_state=='prepared'}">
<tr bgcolor="lightgreen";>
</c:when>

<c:when test="${item.delivery_state=='finished'}">
<tr bgcolor="lightgray";>
</c:when>

<c:otherwise>
<tr bgcolor="orange">
</c:otherwise>

</c:choose>

<td width="10%">
<strong>${item.order_idx}</strong>
</td>

<td width="20%">
<strong>${item.date}</strong>
</td>

<td width="50%">
<strong>주문자 : ${item.order_name } </strong><br>
<strong>주문자번호 : ${item.order_phone}</strong><br>
<strong>수령자 : ${item.order_name} </strong><br>
<strong>주문상품 : ${item.order_product} </strong>
</td>

<td width="10%">
<select name="delivery_state${i.index}" id="delivery_state${i.index}">

<c:choose>

<c:when test="${item.delivery_state=='prepared'}">
<option value="prepared" selected>배송준비중</option>
<option value="delivering">배송중</option>
<option value="finished">배송완료</option>
<option value="cancle">주문취소</option>
<option value="return">반품</option>
</c:when>

<c:when test="${item.delivery_state=='delivering' }">
<option value="prepared" >배송준비중</option>
<option value="delivering" selected>배송중</option>
<option value="finished">배송완료</option>
<option value="cancle">주문취소</option>
<option value="return">반품</option>
</c:when>


<c:when test="${item.delivery_state=='finished' }">
<option value="prepared" >배송준비중</option>
<option value="delivering">배송중</option>
<option value="finished" selected>배송완료</option>
<option value="cancle">주문취소</option>
<option value="return">반품</option>
</c:when>


<c:when test="${item.delivery_state=='cancle' }">
<option value="prepared" >배송준비중</option>
<option value="delivering">배송중</option>
<option value="finished">배송완료</option>
<option value="cancle"  selected>주문취소</option>
<option value="return">반품</option>
</c:when>

<c:when test="${item.delivery_state=='return'}">
<option value="prepared" >배송준비중</option>
<option value="delivering">배송중</option>
<option value="finished">배송완료</option>
<option value="cancle">주문취소</option>
<option value="return"  selected>반품</option>
</c:when>
</c:choose>
</select>

</td>

<td width="10%">
<input type="button" value="배송수정" onclick="modify_order_state('${item.order_idx}','delivery_state${i.index}')"> 
</td>

<c:set value="${item.order_idx}" var="pre_order_idx"></c:set>


</c:forEach>

</tbody>

</table>




</body>
</html>