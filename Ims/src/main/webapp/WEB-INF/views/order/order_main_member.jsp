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



.btn btn-dark:hover{
background-color: white;

}

</style>

<script>




function check(){
	var fm = document.frm;
	
	if(fm.member_pw.value==""){
		alert('비밀번호를 입력해주세요')
		fm.member_pw.focus();
		return;
	}
	fm.action="<%=request.getContextPath() %>/member/memberdelete.do";
	fm.method="post";
	fm.submit();
	
	return;
}


</script>


</head>
<body style="justify-content: center;display: flex;margin: auto;,margin-top: 100px;">



            <div class="l_nav_box" style="margin-top: 100px;height: 1000px;">
    <div class="nav_top">
        <h2><a href="<%=request.getContextPath() %>/mypage/order.do"><span class="myp_lnb t_myp">마이페이지</span></a></h2>
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
</div>

<!-- 주문 배송조회 -->

<div id="wide_content"  class="large_content" style="margin-top: 30px;visibility: middle;align-items: center">

               <h3 class="h3_title"><span class="myp_tit m1">회원 탈퇴</span></h3>

               
            
  
    

      
   <form name="frm">
            
            <!-- <div class="order_srch">  -->
             
 <div style="display: flex;justify-content: center;margin-top: 350px;font-size: 25px;align-items: center;">
              
           
                <label> 비빌번호: </label>  &nbsp; 
                <input type="password" style="width: 250px;height: 50px;font-size: 30px;border-radius: 4px;" name="member_pw"> 
              <span style="display:flex;align-items: center;margin-top: 19px;">  <button class="btn btn-dark" onclick="check();" type="button" style="align-items: center;display: flex;height: 50px;width: 70px;text-align: center;background-color: black;border-radius: 5px;cursor: pointer;"><p style="text-align: center;display: flex;margin-left: 8px;color: white;border-radius: 5px;font-size: 18px;">입력</button></span>
               </form>
               
</div>            
     
            
                    
                    
    </div>


</body>
</html>