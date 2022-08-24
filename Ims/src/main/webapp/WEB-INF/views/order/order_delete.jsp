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

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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




$(function(){
	
	$("#btndelete").click(function(){
		
	
	if(confirm("회원 탈퇴 하시겠습니까 ? ")){
		alert('삭제가 완료되었습니다');
		location.href = "<%=request.getContextPath() %>/member/delete.do"
	}
	})
	
	
})







</script>


</head>
<body style="justify-content: center;display: flex;margin: auto;,margin-top: 100px;">



            <div class="l_nav_box" style="margin-top: 100px;height: 1000px;">
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
</div>

<!-- 주문 배송조회 -->

<div id="wide_content"  class="large_content" style="margin-top: 30px;">

               <h3 class="h3_title"><span class="myp_tit m1">회원 탈퇴</span></h3>

               
            
  
    

      
   <form name="frm">
            
            <!-- <div class="order_srch">  -->
               <label> 회원탈퇴  </label><Br>
 <div style="display: flex;justify-content: center;margin-top: 50px;font-size: 25px;align-items: center;">
             
               
               <div class="card" style="border: 1px solid gray;padding: 24px">
                <a style="text-align: center;margin: auto;display: flex;margin-left: 350px;"> 회원탈퇴   </a>  &nbsp; 
                <Br>
                <Strong style="color: red">회원탈퇴 시 개인정보 및 Im`s 에서 만들어진 모든 데이터는 삭제됩니다</Strong><br>
                <strong style="color: red;">(단 , 아래 항목은 표기된 법률에 따라 특정기간 동안 보관됩니다)</strong><br>
                <br>
                <p style="font-size: 16px;">1.계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률 /보존기간 :5년</p>
                   <p style="font-size: 16px;">2. 대금결제 및 재화 등으 공급에 관한 기록 보존 이유 : 전자상거래등 에서의 소비자관한법률 / 보존기간 :5년</p>
                      <p style="font-size: 16px;">3.전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년</p>
                         <p style="font-size: 16px;">4.소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년</p>
                            <p style="font-size: 16px;">5.신용정보의 수집 / 처리 및 이용등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 /3년</p>
                               <p style="font-size: 16px;">6.전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야할 사항 고시(국세청 고시 제 2016-3호)
                               (전자세금계산서 사용자에 한함):5년
                               </p>
                                  <p style="font-size: 16px;">(단, (세금)계산서 내 개인식별번호는 3년 경과후 파기)</p>
              </div>
              
              <br><br>
              </div>
                 <div class="card" style="border: 1px solid gray;padding: 18px;margin-top: 20px;margin: 8px;">
                      <a style="text-align: center;margin: auto;display: flex;margin-left: 400px;font-size: 18px;"> 회원탈퇴   </a>  &nbsp; 
                        <p style="font-size: 16px;">- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며,회원탈퇴 진행 시 해당 아이디는 영구적으로 삭제되어 재가입이 불가능합니다.</p><br>
                                <p style="font-size: 16px;">- 소속된 회사가 존재할 경우,'탈퇴회원'으로 조회됩니다</p><br>
                                 <p style="font-size: 16px;">-회사가 Im`s 내에 존재하는 경우 ,귀속된 데이터는 보관됩니다.</p><br>
                 </div>
			<div style="display: flex;margin: auto;margin-left: 330px;">
				<span style="display: flex; align-items: center; margin-top: 19px;margin: 8px;">
					<button class="btn btn-dark" onclick="check();" type="button" id="btndelete"
						style="align-items: center; display: flex; height: 50px; width: 120px; text-align: center; background-color: black; border-radius: 5px; cursor: pointer;">
						<p
							style="text-align: center; display: flex; margin-left: 17px; color: white; border-radius: 5px; font-size: 18px;">탈퇴하기
					</button>
				</span> <span style="display: flex; align-items: center; margin-top: 19px;margin: 8px;">

					<button class="btn btn-dark" onclick="check();" type="button"
						style="align-items: center; display: flex; height: 50px; width: 120px; text-align: center; background-color: black; border-radius: 5px; cursor: pointer;">
						<p
							style="text-align: center; display: flex; margin-left: 17px; color: white; border-radius: 5px; font-size: 18px;">뒤로가기
					</button>
				</span>
			</div>
		</form>
               
</div>            
     
            
                    
                    
    </div>

</body>
</html>