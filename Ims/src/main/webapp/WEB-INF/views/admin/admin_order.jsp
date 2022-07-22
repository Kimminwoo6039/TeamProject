<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet" type="text/css" href="https://st.okmall.com/www/v1/css/common/v1/Pretendard.css?v=2" />
 <link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/jquery-ui/1.8rc3/jquery-ui-1.8rc3.custom.css" />
    <link rel="stylesheet" type="text/css" href="https://st.okmall.com/www/v1/css/common/v1/common.css?v=202207210202_2" />
    <link rel="stylesheet" type="text/css" href="https://st.okmall.com/www/v1/css/common/v1/layout.css?v=202207210202" />
    <link rel="stylesheet" href="https://www.okmall.com/static/docs/www/v1/css/common/v1/category.css?t=1658115094" />
    
    <link rel="stylesheet" type="text/css" href="https://www.okmall.com/static/docs/www/v1/css/common/v1/why.css?t=1658109700" />

    <link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/lightslider/lightslider.css" />
<link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/swiper/swiper.css" />
        <link rel="stylesheet" type="text/css" href="https://st.okmall.com/www/v1/css/mypage/v1/mypage.css?20220414" />    
    <link rel="stylesheet" type="text/css" href="https://st.okmall.com/www/v1/css/common/v1/sub_myp.css?v=20220124"/>
    <script type="text/javascript" src="https://st.okmall.com/libs/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="https://st.okmall.com/libs/jquery-ui/1.8.16/jquery-ui-1.8.16.custom.min.js"></script>


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
				location.href="/shop/admin/main.do?delivery_state="
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

<style>

/* 6 */
.btn-6 {
   background: #000;
  color: #fff;
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-6 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-6:before,
.btn-6:after {
  position: absolute;
  content: "";
  height: 0%;
  width: 2px;
  background: #000;
}
.btn-6:before {
  right: 0;
  top: 0;
  transition: all 500ms ease;
}
.btn-6:after {
  left: 0;
  bottom: 0;
  transition: all 500ms ease;
}
.btn-6:hover{
  color: #000;
  background: transparent;
}
.btn-6:hover:before {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6:hover:after {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6 span:before,
.btn-6 span:after {
  position: absolute;
  content: "";
  background: #000;
}
.btn-6 span:before {
  left: 0;
  top: 0;
  width: 0%;
  height: 2px;
  transition: all 500ms ease;
}
.btn-6 span:after {
  right: 0;
  bottom: 0;
  width: 0%;
  height: 2px;
  transition: all 500ms ease;
}
.btn-6 span:hover:before {
  width: 100%;
}
.btn-6 span:hover:after {
  width: 100%;
}

</style>

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
<body style="justify-content: center;display: flex;margin: auto;,margin-top: 100px;">



            <div class="l_nav_box" style="margin-top: 100px;height: 1000px;">
    <div class="nav_top">
        <h2><a href="/mypage/order"><span class="myp_lnb t_myp">마이페이지</span></a></h2>
                    <div class="t_user"><span></span> <strong>김민우</strong> 회원님!<br>반갑습니다.</div>
            </div>
    <div class="nav_lst">
        <ul>
            <li class="fst"><span class="myp_lnb m1">나의 구매내역</span></li>
            <li class=on><a href="/shop/mypage/main.do?delivery_state="><span class="myp_lnb m1_sub1">주문/배송 조회</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m2">나의 혜택관리</span></li>
          
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m3">나의 문의내역</span></li>
            <li ><a href="https://www.okmall.com/mypage/board/notice"><span class="myp_lnb m3_sub0">공지사항</span></a></li>
            <li ><a href="https://www.okmall.com/mypage/board"><span class="myp_lnb m3_sub1">FAQ 보기</span></a></li>
            <li ><a href="https://www.okmall.com/mypage/board/dq"><span class="myp_lnb m3_sub2">1:1 문의내역 보기</span></a></li>
           
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m4">나의 관심상품</span></li>
            <li><a href="/baskets/basket_view"><span class="myp_lnb m4_sub1">장바구니</span></a></li>
            <li ><a href="/mypage/zzim"><span class="myp_lnb m4_sub2">찜한 상품</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m5">회원정보</span></li>
            <li ><a href="https://www.okmall.com/members/modify"><span class="myp_lnb m5_sub1">회원정보 수정/탈퇴</span></a></li>

                                              
                                    </ul>
    </div>
</div>
</div>

<!-- 주문 배송조회 -->

<div id="wide_content"  class="large_content" style="margin-top: 100px;">

               <h3 class="h3_title"><span class="myp_tit m1">주문/배송조회</span></h3>

               
               <h4 class="h4_title">주문 상태<span class="t_sub">(최근 한 달 기준)</span></h4>
   <div class="myorder_stt_box">
       <ul>
           <li >
               <a href='/shop/admin/main.do?delivery_state=cancle'><span class="t_stt"><span class="num">${count}</span>주문취소</span></a>
               <div class="dscrt_layer">
                   <p>입금 확인이 되지 않은 상태입니다.<br>안내된 시간 이내 미입금 시<br>주문이 자동 취소됩니다.</p>
                   <p class="bot">- 주문취소 가능</p>
               </div>
           </li>
           <li class="ico_nxt"><em class="ico_myorder nxt">next</em></li>
           <li >
               <a href="/shop/admin/main.do?delivery_state=prepared"><span class="t_stt"><span class="num">${count1}</span>배송준비중</span></a>
               <div class="dscrt_layer">
                   <p>오케이몰 물류센터에서<br>주문하신 상품을 준비 중입니다.</p>
                   <p class="bot">- 배송지 변경, 주문취소 가능</p>
               </div>
           </li>
           <li class="ico_nxt"><em class="ico_myorder nxt">next</em></li>
           <li >
               <a href="/shop/admin/main.do?delivery_state=delivering"><span class="t_stt"><span class="num">${count2}</span>배송중</span></a>
               <div class="dscrt_layer">
                   <div class="dscrt_layer">
                       <p>택배사에 상품이 접수되어<br>고객님께 배송 중입니다.</p>
                       <p class="bot">- 주문취소 불가</p>
                       <p class="bot">- 운송장번호 조회 가능</p>
                   </div>
               </div>
           </li>
           <li class="ico_nxt"><em class="ico_myorder nxt">next</em></li>
           <li >
               <a href="/shop/admin/main.do?delivery_state=finished"><span class="t_stt"><span class="num">${count3}</span>배송완료</span></a>
               <div class="dscrt_layer">
                   <p>상품이 고객님께 전달 완료되었습니다.</p>
                   <p class="bot">- 교환/환불/AS 신청 가능</p>
               </div>
           </li>
       </ul>
       <a href="javascript:void(0);" class="myorder_plus" id="btnOrderStausMore">show</a>
   </div>
               

   <div class="pos_R">

       <h4 class="h4_title">주문 내역
           <span id="last_info_1" class="last" style="display:">최근 3개월간 주문내역입니다. 지난 주문내역을 더 보시려면 상단 연도별 조회 기능을 이용해주세요.</span>
        </h4>

                        

            
            <!-- <div class="order_srch">  -->
           <table class="table" style="margin-top: 20px;" border="1">
  <tbody style="font-size: 15px;">
<tr>
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

<td width="40%">
<strong>주문자 : ${item.order_name } </strong><br>
<strong>주문자번호 : ${item.order_phone}</strong><br>
<strong>수령자 : ${item.order_name} </strong><br>
<strong>주문상품 : ${item.order_product} </strong>
</td>

<td width="20%">
<select name="delivery_state${i.index}" id="delivery_state${i.index}"  class="form-select form-select-sm">

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