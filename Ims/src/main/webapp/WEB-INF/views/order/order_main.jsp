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
<script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Yellowtail&display=swap')
	;

.abc {
	font-family: 'Yellowtail', cursive;
	font-size: 50px;
}
</style>
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
 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
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
		formObj.action="<%=request.getContextPath() %>/mypage/cancel.do";
		formObj.submit();
	}
}




</script>


</head>
<body>



<div class="row">
<a href="${pageContext.request.contextPath}/" style="text-decoration: none;"><h3 style="text-align: center; color: black;"class="abc" >Im'S something for us</h3></a>
</div>
<br>

<div style="justify-content: center;display: flex;margin: auto;,margin-top: 100px;">




            <div class="l_nav_box" style="margin-top: 100px;height: 1000px;">
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none; font-size:16px;"><i class="fa-solid fa-house"></i>HOME</a>
    <div class="nav_top">
        <h2><a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state="><span class="myp_lnb t_myp">마이페이지</span></a></h2>
                    <div class="t_user"><span></span> <strong>${sessionScope.name}</strong> 회원님!<br>반갑습니다.</div>
            </div>
    <div class="nav_lst">
        <ul>
            <li class="fst"><span class="myp_lnb m1">나의 구매내역</span></li>
            <li class=on><a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state="><span class="myp_lnb m1_sub1">주문/배송 조회</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m2">나의 혜택관리</span></li>
          
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m3">나의 문의내역</span></li>
            <li ><a href="<%=request.getContextPath() %>/board/notice/List.do?ct=notice&ct_idx=0"><span class="myp_lnb m3_sub0">공지사항</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/qna/List.do?ct=qna&ct_idx=1"><span class="myp_lnb m3_sub1">FAQ 보기</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/dq/List.do?ct=dq&ct_idx=2"><span class="myp_lnb m3_sub2">1:1 문의내역 보기</span></a></li>
           
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m4">나의 관심상품</span></li>
            <li><a href="<%=request.getContextPath() %>/shop/cart/list.do"><span class="myp_lnb m4_sub1">장바구니</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/mypage/zzimlist.do"><span class="myp_lnb m4_sub2">찜한 상품</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m5">회원</span></li>
       
            <li ><a href="<%=request.getContextPath() %>/mypage/main_member.do"><span class="myp_lnb m5_sub1">회원정보 탈퇴</span></a></li>

                                              
                                    </ul>
    </div>
</div>


<!-- 주문 배송조회 -->

<div id="wide_content"  class="large_content" style="margin-top: 100px;">

               <h3 class="h3_title"><span class="myp_tit m1">주문/배송조회</span></h3>

               
               <h4 class="h4_title">주문 상태<span class="t_sub">(최근 한 달 기준)</span></h4>
   <div class="myorder_stt_box">
       <ul>
           <li >
          <i class="fa-solid fa-xmark" style="font-size: 40px;margin-bottom: 18px;"></i>
               <a href='<%=request.getContextPath() %>/mypage/main.do?delivery_state=cancle'><span class="t_stt"><span class="num">${count}</span>주문취소</span></a>
               <div class="dscrt_layer">
                   <p>입금 확인이 되지 않은 상태입니다.<br>안내된 시간 이내 미입금 시<br>주문이 자동 취소됩니다.</p>
                   <p class="bot">- 주문취소 가능</p>
               </div>
           </li>
           <li class="ico_nxt"><em class="ico_myorder nxt">next</em></li>
           <li >
           <i class="fa-solid fa-truck-droplet" style="font-size: 40px;margin-bottom: 18px;"></i>
               <a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state=prepared"><span class="t_stt"><span class="num">${count1}</span>배송준비중</span></a>
               <div class="dscrt_layer">
                   <p>오케이몰 물류센터에서<br>주문하신 상품을 준비 중입니다.</p>
                   <p class="bot">- 배송지 변경, 주문취소 가능</p>
               </div>
           </li>
           <li class="ico_nxt"><em class="ico_myorder nxt">next</em></li>
           <li >
                    <i class="fa-solid fa-truck-fast" style="font-size: 40px;margin-bottom: 18px;"></i>
               <a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state=delivering"><span class="t_stt"><span class="num">${count2}</span>배송중</span></a>
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
           <i class="fa-solid fa-box-open" style="font-size: 40px;margin-bottom: 18px;"></i>
               <a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state=finished"><span class="t_stt"><span class="num">${count3}</span>배송완료</span></a>
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
               <table border="1px;" class="table">
               <tr style="font-size: 21px;margin-bottom: 20px;text-align: center;">
   <td>주문번호</td>
  <td>주문일자</td>
  <td>주문상품</td>
   <td>주문금액</td>
   <td>주문상태</td>
   <td>주문자</td>
   <td>주문취소</td>
               <Br>
             
               <tr></tr>
               

               
               
               
               
               </tr>
         
                <c:forEach var="item" items="${list}">
                 <c:choose>
 <c:when test="${item.delivery_state=='cancle'}">
<tr bgcolor="red">
</c:when>
<c:otherwise>
<tr bgcolor="blue">
</c:otherwise>
  </c:choose>
  
  <tr>
   <td style="font-size: 14px;margin-left: 20px;margin-top: 20px;text-align: center;">
    ${item.order_idx}
  </td>
  
  <td style="font-size: 14px;margin-left: 20px;text-align: center;"> 
   ${item.date}
  </td>
  
  <td style="font-size: 14px;margin-left: 20px;text-align: center;">
  <strong>
 <A href="<%=request.getContextPath()%>/shop/product/detail/${item.order_code}">${item.order_product}</A>
 </strong>
  </td>
  
  <td style="font-size: 14px;margin-left: 20px;text-align: center;">
 <fmt:formatNumber value="${item.order_sum}" pattern="#,###" />&nbsp;원
  </td>
  
  <td style="font-size: 14px;margin-left: 20px;text-align: center;">
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
  
  <td style="font-size: 14px;margin-left: 20px;text-align: center;" >
  ${item.order_name}
  </td>
  
  <td style="text-align: center;">
  
  <c:choose>
  
  <c:when test="${item.delivery_state=='prepared'}">
  <input type="button" onclick="cancel_order(${item.order_idx})" value="주문취소" >
  </c:when>
  <c:otherwise>
    <input type="button" onclick="cacel_order('${item.order_idx}')" value="주문취소" disabled="disabled">
  
  </c:otherwise>
  
  </c:choose>
  
  
  </td>
  <c:set var="pre_order_id" value="${item.order_id}" />
  </tr>
                
                
                </c:forEach>
               
               
               </table>
     
            
                    
                    
    

</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>