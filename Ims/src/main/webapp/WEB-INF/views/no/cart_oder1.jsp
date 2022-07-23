<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



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






<div class="container bg-white rounded-top mt-0" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12 pt-3">
                <div class="d-flex">
                                    
                </div>
                <div class="d-flex flex-column pt-5" style="margin-left: 50px;">
                    <div><h5 class="text-uppercase font-weight-normal"></h5></div>
                  
                </div>
                 <hr>
                 
                     
                <div class="d-flex flex-row mobile" id="heading" style="padding-left: 240px;">
                    <div class="px-lg-4 mr-lg-5" id="produc" style="margin-right: 120px;" >상품</div>
                    <div class="px-lg-4 ml-lg-5" id="prc" style="margin-left: 110px;">가격</div>
                    <div class="px-lg-4 ml-lg-5" id="quantity" style="margin-left: 140px;">수량</div>
                    <div class="px-lg-4 ml-lg-5" id="total" style="margin-left: 100px;">금액</div>
                
                </div>
                 <c:forEach var="row" items="${map.list}">
                 
                            <form id="form1" name="form1" method="post" action="/shop/shop/cart/update.do" >
                            
                <div class="d-flex flex-row justify-content-between align-items-center pt-lg-4 pt-2 pb-3 border-bottom mobile">
                    <div class="d-flex flex-row align-items-center">
                        <div><img src="/shop/resources/images/${row.filename}" width="150" height="150" alt="" id="image"></div>
                        <div class="d-flex flex-column pl-md-4 pl-3" style="margin-left: 20px;">
                            <div><h6>${row.product_name}</h6></div>
                            <div >Cart.No:<span class="pl-2">&nbsp;${row.cart_id}</span></div>
                            <div>Color:<span class="pl-3">&nbsp;${row.color}</span></div>
                            <div>Size:<span class="pl-4"> &nbsp;${row.size}</span></div>
                        </div>                    
                    </div>
                    <div class="pl-md-0 pl-1" style="margin-left: 80px;"><b><fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원</b></div>

                    <div class="pl-md-0 pl-2" style="margin-left: 25px;">
          
                       <!-- <span class="px-md-3 px-1">${row.amount}</span> -->&nbsp;
                         <input type="number" name="amount" value="${row.amount}" style="width: 50px;border: none;">
                            <input type="hidden" name="cart_id" value="${row.cart_id}">
                      
                    
                      
                    
                    </div>

                    <div class="pl-md-0 pl-1" style="margin-right: 30px;"><b><fmt:formatNumber value="${row.money}" pattern="#,###" />&nbsp;원</b></div>
                   
                </div>
               </form>
    </c:forEach>
            </div>
        </div>
    </div>
    <div class="container bg-light rounded-bottom py-4" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <button class="btn btn-sm bg-light border border-dark" type="button" onclick="location='/shop/shop/cart/list.do'">GO BACK</button>
                    </div>
                    <div class="px-md-0 px-1" id="footer-font">
                    
                        <b class="pl-md-4">총결제금액<span class="pl-md-4">&nbsp;&nbsp;\&nbsp;<fmt:formatNumber value="${map.sum}" pattern="#,###,###"/>&nbsp;원</span></b>
                    </div>
                    <div>	
                   
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<hr>
<form  action="/shop/pay.do" method="post">


  <input type="hidden" name="order_code" value="${map.code}">
<input type="hidden" name="order_cart" value="${map.cart}">
<input type="hidden" value="${map.product_name}" name="order_product">
  <input type="hidden" value="${map.id}" name="order_id">
  <input type="hidden" name="order_sum" value="${map.sum}">


 <div class="card p-3" style="width: 800px;margin-left: 650px;">
           
            <h6 class="text-uppercase" style="text-align: center;">주문고객</h6>
     <hr>
        <span>고객명</span> 
        
            <div class="inputbox mt-3"> <input type="text" name="order_name" class="form-control"  value="${map.name}" >
         
            <div class="row">

                <div class="col-md-12">
                
                 <span>연락처</span> 

                    <div class="inputbox mt-3 mr-2"> <input type="text" name="order_phone" class="form-control" required="required" value="${map.phone}">
                    

                    </div>
  
                </div>

           

                </div>
                

            </div>


            <div class="mt-4 mb-4">

 
                <div class="row mt-3">

                    <div class="col-md-12">
  
                       <span>우편번호</span>
                        <div class="inputbox mt-3 mr-2"> <input type="text" id="sample6_postcode" class="form-control" required="required" name="order_addr1" style="margin-top: 10px;" > 
                        
                         </div><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success px-3" style="background-color: #492bc4;margin-top: 10px;" ><br>
                       


                    </div>


                     <div class="col-md-12">

                          <span>주소</span>
                        <div class="inputbox mt-3 mr-2"> <input type="text" name="order_addr2" id="sample6_address" class="form-control" required="required" value="${vo.member_addr}"> 
                        

                    </div>


                    

                </div>


                <div class="row mt-2">

                    <div class="col-md-12">
<span>상세주소</span> 
                        <div class="inputbox mt-3 mr-2"> <input type="text" name="order_addr3" class="form-control" required="required" id="sample6_detailAddress"> 
                        

                    </div>


                     <div class="col-md-6" style="margin-top: 18px;display: flex;justify-content: center;margin-left: 320px;">

                      <div style="width: 600px;">
   <button class="btn btn-success px-3" style="background-color: #492bc4;font-size: 20px;">결제하기</button>

</div>
        
                        

                    </div>


                    

                </div>

            </div>

        </div>

</form>
    


      
    
</body>
</html>