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
		
	
	if(confirm("?????? ?????? ?????????????????? ? ")){
		location.href = "<%=request.getContextPath() %>/member/delete.do"
	}
	})
	
	
})







</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
               
                
                } else {
                  
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // ????????? ???????????? ????????? ????????????.
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
        <h2><a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state="><span class="myp_lnb t_myp">???????????????</span></a></h2>
                    <div class="t_user"><span></span> <strong>${sessionScope.name}</strong> ?????????!<br>???????????????.</div>
            </div>
    <div class="nav_lst">
        <ul>
            <li class="fst"><span class="myp_lnb m1">?????? ????????????</span></li>
            <li class=on><a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state="><span class="myp_lnb m1_sub1">??????/?????? ??????</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m2">?????? ????????????</span></li>
          
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m3">?????? ????????????</span></li>
            <li ><a href="<%=request.getContextPath() %>/board/notice/List.do?ct=notice&ct_idx=0"><span class="myp_lnb m3_sub0">????????????</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/qna/List.do?ct=qna&ct_idx=1"><span class="myp_lnb m3_sub1">FAQ ??????</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/board/dq/List.do?ct=dq&ct_idx=2"><span class="myp_lnb m3_sub2">1:1 ???????????? ??????</span></a></li>
           
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m4">?????? ????????????</span></li>
            <li><a href="<%=request.getContextPath() %>/shop/cart/list.do"><span class="myp_lnb m4_sub1">????????????</span></a></li>
            <li ><a href="<%=request.getContextPath() %>/mypage/zzimlist.do"><span class="myp_lnb m4_sub2">?????? ??????</span></a></li>
        </ul>
        <ul>
            <li class="fst"><span class="myp_lnb m5">??????</span></li>
     
            <li ><a href="<%=request.getContextPath() %>/mypage/main_member.do"><span class="myp_lnb m5_sub1">???????????? ??????</span></a></li>


                                              
                                    </ul>
    </div>
</div>
</div>

<!-- ?????? ???????????? -->

<div id="wide_content"  class="large_content" style="margin-top: 30px;margin-top: 200px;">

               <h3 class="h3_title" style="text-align: center;"><span class="myp_tit m1" style="text-align: center;">?????? ????????????</span></h3>

               
            
  
    

      
   <form name="frm" style="align-items: center;" action="<%=request.getContextPath() %>/mypage/main_info_process.do" method="post">
   
     <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;margin-left: 19px;">??? ??? :</label>
           &nbsp;&nbsp; <input type="text" name="member_name"  width="150px;" value="${list.member_name}" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;" disabled="disabled" />
          
           </div>
            
   
          <div style="display: flex;justify-content: center;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;">&nbsp;????????? :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" value="${list.member_id}" name="member_id" height="200;" style="font-size: 16px;height: 25px;border-radius: 6px;" /disabled="disabled">
               
           </div>
           
             <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">???????????? :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" value="${list.member_pw}" height="200" name="member_pw" style="font-size: 16px;height: 25px;border-radius: 6px;"  />
              
           </div>
           
         <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
            <label style="margin-top: 4px;font-size: 16px;margin-left: 22px;">&nbsp;???????????? :</label> &nbsp;&nbsp;
                <select class="tel1" name="member_phone1">
                
              
                    <option value="">??????</option>
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
          <label style="margin-top: 4px;font-size: 16px;margin-left: 82px;">???????????? :</label>
           &nbsp;&nbsp; <input type="text" width="150px;" height="200" value="${list.member_addr1}" style="font-size: 16px;height: 25px;border-radius: 6px;" name="member_addr1" id="sample6_postcode" name="order_addr1" /> &nbsp;&nbsp;
           <input type="button" onclick="sample6_execDaumPostcode()" value="??????????????????"  style="marg; background-color: gray;height: 25px;" class="fav-button">
          
           </div>

          
            <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">???????????? :</label>
           &nbsp;&nbsp; <input type="text" value="${list.member_addr2}" width="300px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;width: 350px;" name="member_addr2" id="sample6_address" />
      
           </div>
           
            <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px"">???????????? :</label>
           &nbsp;&nbsp; <input type="text" value="${list.member_addr3}" width="150px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;" name="member_addr3" id="sample6_detailAddress" />
           
           </div>
            
            
              <div style="display: flex;justify-content: center;margin-right: 7px;margin-top: 15px;">
          <label style="margin-top: 4px;font-size: 16px;margin-left: 18px;">????????? :</label>
           &nbsp;&nbsp; <input type="email" value=" ${list.member_email}" name="member_email" width="150px;" height="200" style="font-size: 16px;height: 25px;border-radius: 6px;"  />
          
           </div>
           
           
           
           <div style="display: flex;justify-content: center;margin-right: 1px;margin-top: 15px;margin-left: 45px;">
            <button class="fav-button"  type="submit" id="abc" style="margin: 6px;">??????</button>
        <button class="fav-button"  onclick="location='<%=request.getContextPath() %>/mypage/main.do?delivery_state='" type="button" style="margin: 6px; background-color: gray;">??????</button> 
            </Div>
		</form>
               
</div>            
     
            
                    
                    
    </div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>