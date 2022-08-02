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


</head>
<body style="justify-content: center;display: flex;margin: auto;,margin-top: 100px;">



            <div class="l_nav_box" style="margin-top: 100px;height: 1000px;">
    <div class="nav_top">
        <h2><a href="/mypage/order"><span class="myp_lnb t_myp">마이페이지</span></a></h2>
                    <div class="t_user"><span></span> <strong>${sessionScope.name}</strong> 회원님!<br>반갑습니다.</div>
            </div>
    <div class="nav_lst">
        <ul>
            <li class="fst"><span class="myp_lnb m1">주문배송현황</span></li>
            <li><a href="<%=request.getContextPath() %>/admin/main.do?delivery_state="><span class="myp_lnb m5_sub1">주문/배송 조회</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m2">주문상품</span></li>
               <li class="on" ><a href="/shop/admin/main_order.do"><span class="myp_lnb m1_sub1">주문상품리스트</span></a></li>
        </ul>
           <ul>
            <li class="fst"><span class="myp_lnb m5">회원정보</span></li>
            <li ><a href="<%=request.getContextPath() %>/admin/main_member.do"><span class="myp_lnb m5_sub1">회원정보리스트</span></a></li>

                                              
                                    </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m3">나의 문의내역</span></li>
            <li ><a href="<%=request.getContextPath() %>/board/notice/List.do?ct=notice&ct_idx=0"><span class="myp_lnb m3_sub0">공지사항</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/qna/List.do?ct=qna&ct_idx=1"><span class="myp_lnb m3_sub1">FAQ 보기</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/dq/List.do?ct=dq&ct_idx=2"><span class="myp_lnb m3_sub2">1:1 문의내역 보기</span></a></li>
           
        </ul>
       
     
    </div>
</div>
</div>

<!-- 주문 배송조회 -->


   <div class="pos_R">

               <table class="table"style="margin-top: 100px;margin-right: 20px;" >
               <tr style="font-size: 21px;margin-bottom: 20px;text-align: center;margin-right: 20px;">
   <td>주문번호</td>
  <td>주문자아이디</td>
  <td>주문자이름</td>
   <td>주문자전화</td>
   <td>주문상품</td>
   <td>주문합계</td>
   <td>배송현황</td>

               </tr>
         <tbody>
             <c:forEach var="row" items="${list}">
             
<tr style="font-size: 16px;color: black;">
   <td>${row.order_idx}</td>
  <td>${row.order_id }</td>
  <td>${row.order_name }</td>
   <td>${row.order_phone}</td>
   <td>${row.order_product }</td>
   <td><fmt:formatNumber value="${row.order_sum}" pattern="#,###" />&nbsp;원</p></td>
   <td>

<c:choose>
<c:when test="${row.delivery_state=='prepared'}">
배송준비중

</c:when>

<c:when test="${row.delivery_state=='delivering' }">
배송중
</c:when>


<c:when test="${row.delivery_state=='finished' }">
배송완료
</c:when>


<c:when test="${row.delivery_state=='cancle' }">
주문취소
</c:when>

<c:when test="${row.delivery_state=='return'}">
반품
</c:when>
</c:choose>
</td>
</tr>
                
  </c:forEach>
                
                
               
     </tbody>          
               </table>

                        

            
      </div>
     
            
                    
                    
    


</body>
</html>