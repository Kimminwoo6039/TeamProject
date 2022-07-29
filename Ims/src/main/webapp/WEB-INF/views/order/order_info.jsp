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
		location.href = "/shop/member/delete.do"
	}
	})
	
	
})







</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
               
                
                } else {
                  
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<style type="text/css">

.button-div{
    padding:60px;
    position:relative;
}

.fav-button{
    border:none;
    height:40px;
    width:120px;
    font-size:15px;
    background-color:#000;
    color:#fff;
    border-radius:5px;
    cursor:pointer;
    display:flex;
    justify-content:center;
    align-items:center;
    
}

.fav-button i{
    position:absolute;
    left:70px;

}

.fav-button:active i {
    
    animation: item 1s ease-in forwards;
}


@keyframes item {
    0% {
        
        top: 20%;
        color:#000;
        
    }

    25% {
        top: 60%;
        color:#000;
        
    }

    50% {
        
        top: 100%;
        
     
    }

    75% {
        
        top: 60%;
    
    
    }

    0% {
        top:0%;
    }
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
            <li class="fst"><span class="myp_lnb m1">나의 구매내역</span></li>
            <li class=on><a href="/shop/mypage/main.do?delivery_state="><span class="myp_lnb m1_sub1">주문/배송 조회</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m2">나의 혜택관리</span></li>
          
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m3">나의 문의내역</span></li>
            <li ><a href="/shop/board/notice/List.do?ct=notice&ct_idx=0"><span class="myp_lnb m3_sub0">공지사항</span></a></li>
            <li ><a href="/shop/board/qna/List.do?ct=qna&ct_idx=1"><span class="myp_lnb m3_sub1">FAQ 보기</span></a></li>
            <li ><a href="/shop/board/dq/List.do?ct=dq&ct_idx=2"><span class="myp_lnb m3_sub2">1:1 문의내역 보기</span></a></li>
           
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m4">나의 관심상품</span></li>
            <li><a href="/shop/shop/cart/list.do"><span class="myp_lnb m4_sub1">장바구니</span></a></li>
            <li ><a href="/mypage/zzim"><span class="myp_lnb m4_sub2">찜한 상품</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m5">회원정보</span></li>
            <li ><a href="/shop/mypage/main_info.do"><span class="myp_lnb m5_sub1">회원정보 수정</span></a></li>
            <li ><a href="/shop/mypage/main_member.do"><span class="myp_lnb m5_sub1">회원정보 탈퇴</span></a></li>


                                              
                                    </ul>
    </div>
</div>
</div>

<!-- 주문 배송조회 -->

<div id="wide_content"  class="large_content" style="margin-top: 30px;margin-top: 200px;">

               <h3 class="h3_title" style="text-align: center;"><span class="myp_tit m1" style="text-align: center;">회원 정보수정</span></h3>

               
            
  
    

      
   <form name="frm" style="align-items: center;" action="/shop/mypage/main_info_process.do" method="post">
   
     <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;margin-left: 19px;">이 름 :</label>
           &nbsp;&nbsp; <input type="text" name="member_name"  width="150px;" value="${list.member_name}" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;" disabled="disabled" />
          
           </div>
            
   
          <div style="display: flex;justify-content: center;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;">&nbsp;아이디 :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" value="${list.member_id}" name="member_id" height="200;" style="font-size: 16px;height: 25px;border-radius: 6px;" /disabled="disabled">
               
           </div>
           
             <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">비밀번호 :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" value="${list.member_pw}" height="200" name="member_pw" style="font-size: 16px;height: 25px;border-radius: 6px;"  />
              
           </div>
           
         <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
            <label style="margin-top: 4px;font-size: 16px;margin-left: 22px;">&nbsp;휴대전화 :</label> &nbsp;&nbsp;
                <select class="tel1" name="member_phone1">
                
              
                    <option value="">선택</option>
                                <option value="010" selected="selected">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
                    </select>
                <span class="txt_hp">-</span>
                <input class="ipt tel2" type="text" value="${a}" name="member_phone2" maxlength="10" style="font-size: 16px;height: 25px;border-radius: 6px;width: 80PX;">
                    
                <span class="txt_hp">-</span>
                <input class="ipt tel2" type="text" value="${b}" name="member_phone3" maxlength="10" style="font-size: 16px;height: 25px;border-radius: 6px;width: 80px;">
              
 
        
      
            </div>
            
            
             <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;margin-left: 82px;">우편번호 :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" height="200" value="${list.member_addr1}" style="font-size: 16px;height: 25px;border-radius: 6px;" name="member_addr1" id="sample6_postcode" name="order_addr1" /> &nbsp;&nbsp;
           <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기"  style="marg; background-color: gray;height: 25px;" class="fav-button">
          
           </div>

          
            <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">지번주소 :</label>
           &nbsp;&nbsp; <input type="text" value="${list.member_addr2}" width="300px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;width: 350px;" name="member_addr2" id="sample6_address" />
      
           </div>
           
            <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">상세주소 :</label>
           &nbsp;&nbsp; <input type="text" value="${list.member_addr3}" width="150px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;" name="member_addr3" id="sample6_detailAddress" />
           
           </div>
            
            
              <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;margin-left: 18px;">이메일 :</label>
           &nbsp;&nbsp; <input type="email" value=" ${list.member_email}" name="member_email" width="150px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;"  />
          
           </div>
           
           
           
           <div style="display: flex;justify-content: center;margin-right: 1px;margin-top: 15px;margin-left: 45px;">
            <button class="fav-button"  type="submit" id="abc" style="margin: 6px;">수정</button>
        <button class="fav-button"  onclick="location='/shop/mypage/main.do?delivery_state='" type="button" style="margin: 6px; background-color: gray;">취소</button> 
            </Div>
		</form>
               
</div>            
     
            
                    
                    
    </div>


</body>
</html>