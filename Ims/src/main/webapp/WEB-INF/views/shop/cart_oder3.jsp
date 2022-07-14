<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
body{

    background-color: #eee;
}

.container{

    height: 100vh;

}


.card{
    border:none;
}

.form-control {
    border-bottom: 2px solid #eee !important;
    border: none;
    font-weight: 600
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #8bbafe;
    outline: 0;
    box-shadow: none;
    border-radius: 0px;
    border-bottom: 2px solid blue !important;
}



.inputbox {
    position: relative;
    margin-bottom: 20px;
    width: 100%
}

.inputbox span {
    position: absolute;
    top: 7px;
    left: 11px;
    transition: 0.5s
}

.inputbox i {
    position: absolute;
    top: 13px;
    right: 8px;
    transition: 0.5s;
    color: #3F51B5
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0
}

.inputbox input:focus~span {
    transform: translateX(-0px) translateY(-15px);
    font-size: 12px
}

.inputbox input:valid~span {
    transform: translateX(-0px) translateY(-15px);
    font-size: 12px
}

.card-blue{

    background-color: #492bc4;
}

.hightlight{

    background-color: #5737d9;
    padding: 10px;
    border-radius: 10px;
    margin-top: 15px;
    font-size: 14px;
}

.yellow{

    color: #fdcc49; 
}

.decoration{

    text-decoration: none;
    font-size: 14px;
}

.btn-success {
    color: #fff;
    background-color: #492bc4;
    border-color:#492bc4;
}

.btn-success:hover {
    color: #fff;
    background-color:#492bc4;
    border-color: #492bc4;
}


.decoration:hover{

    text-decoration: none;
    color: #fdcc49; 
}

</style>
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

</head>
<body>

<div class="container" style="display: flex;margin-top: 200px;text-align: center;">

  

<div class="row" style="margin-left: 250px;">

    <div class="col-md-12" style="width: 800px;"	>
        <H3>주문자 정보</H3>
       <br>
       <hr>
<form action="/shop/pay.do" method="post">



        <div class="card p-3">



            <h6 class="text-uppercase">주문고객</h6>
            
              <c:forEach var="vo" items="${map.list}">
  <input type="hidden" name="order_code" value="${vo.product_code}">
<input type="hidden" name="order_cart" value="${vo.cart_id}">
<input type="hidden" value="${vo.product_name}" name="order_product">
  <input type="hidden" value="${vo.member_id}" name="order_id">
               
            <div class="inputbox mt-3"> <input type="text" name="order_name" class="form-control"  value="${vo.member_name}" >
            
             <span>고객명</span> </div>


            <div class="row">

                <div class="col-md-12">

                    <div class="inputbox mt-3 mr-2"> <input type="text" name="order_phone" class="form-control" required="required" value="${vo.member_phone}"> <span>연락처</span> 


                    </div>
                    

                </div>

                 <div class="col-md-12">

                     <div class="d-flex flex-row">


        

                      <div class="inputbox mt-3 mr-2"> <input type="text" name="order_sum" class="form-control"  value="${map.sum}"> <span>결제금액</span> </div>
                         

                     </div> 
                    

                </div>
                

            </div>



            <div class="mt-4 mb-4">

                <h6 class="text-uppercase">배송받을 주소</h6>


                <div class="row mt-3">

                    <div class="col-md-12">
  


                        <div class="inputbox mt-3 mr-2"> <input type="text" id="sample6_postcode" class="form-control" required="required" name="order_addr1"  > <span>우편번호</span>
                         </div><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success px-3"><br>
                       


                    </div>


                     <div class="col-md-12">

                        <div class="inputbox mt-3 mr-2"> <input type="text" name="order_addr2" id="sample6_address" class="form-control" required="required" value="${vo.member_addr}"> <span>주소</span> </div>
                        

                    </div>


                    

                </div>


                <div class="row mt-2">

                    <div class="col-md-12">

                        <div class="inputbox mt-3 mr-2"> <input type="text" name="order_addr3" class="form-control" required="required" id="sample6_detailAddress"> <span>상세주소</span> </div>
                        

                    </div>


                     <div class="col-md-6">

                    
                        

                    </div>


                    

                </div>

            </div>

        </div>
</c:forEach>
            

        <div class="mt-4 mb-4 d-flex justify-content-between">


                    <span>Previous step</span>


                    <button class="btn btn-success px-3">Pay $840</button>
                   

        </form>            

                </div>

    </div>
<Br>
<br>
<br>
    
    
</div>
  

</div>
</body>
</html>