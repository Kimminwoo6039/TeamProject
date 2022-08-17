<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>

<!-- 소스코드 -->
 <link href="https://img.okmall.com/OKmall/PC/Common/Icons/favicon.png" rel="shortcut icon">

    <link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/swiper/swiper.css" />
        <link rel="stylesheet" type="text/css" href="https://img.okmall.com/Static/www/css/cart.new.css?v=20220223" />
    
        <style>

             body{
                box-sizing: border-box;
                justify-content: center;
                margin: auto;
             }

        </style>

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



</head>
<body style="width: 1200px;">

    <<div class="cart_tit">
        <h2 class="ttl_h2 step2">주문/결제</h2>
        <span class="cart_cnt" style="margin-top: 25px;">(<span id="BaseItemsCount">${map.count}</span>품목)</span>
        <div class="cart_process step2">
            <span class="blind">2. 주문/결제</span>
        </div>
    </div>
    <!-- e : 장바구니 타이틀/프로세스 -->


<!-- s : 주문요약/수량변경 -->
<h3 class="ttl_h3" style="font-size: 21px;margin-bottom: 10px;">주문</h3>



<div class="cart_tbl_box">
<table class="cart_tbl" summary="장바구니에 담긴 상품리스트의 상품,금액,수량의 정보를 제공합니다.">
<caption><p style="font-size: 21px;margin-bottom: 10px;'">장바구니</p></caption>
<colgroup>
    <col width="*">
    <col width="155">
    <col width="155">
    <col width="85">
    <col width="155">
</colgroup>
<thead>
<tr>
    <th scope="col">상품</th>
    <th scope="col">상품금액</th>
    <th scope="col">수량</th>
    <th scope="col">배송비</th>
    <th scope="col">총액</th>
</tr>
</thead>

<!-- 반복문  -->

  <c:forEach var="row" items="${map.list}">


<tbody id="BasketDefaultList">
    <td style="align-items: center;text-align: center;display: flex;"><img src="<%=request.getContextPath() %>/resources/images/${row.filename}" width="100" height="100" alt="" id="image"><strong><p style="font-size: 18px;margin-left: 6px;">${row.product_name}</p></strong></td>
    <td style="font-size: 16px;"><b><fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원</b></td>
    <td style="font-size: 16px;"><fmt:formatNumber value="${row.amount}" pattern="#,###" />&nbsp;개</td>
    <td style="font-size: 16px;"><fmt:formatNumber value="${map.fee}" pattern="#,###" />&nbsp;원</td>
    <td style="font-size: 16px;"><strong><fmt:formatNumber value="${row.money}" pattern="#,###" />&nbsp;원</strong></td>
</tbody>


    </c:forEach>
     
</table>
<!-- 장바구니 글로벌 적용 -->
                        <div class="opt_btn_area" >
    <div class="evt_delivery_box">
        <div class="txt_box1">
            <div class="txt_dscrt">
                <span class="delevery_guide">100,000원 이상 주문 시 무료배송</span>
                <span class="f_col6"> 오후 6시 30분 까지 결제하시면 오늘 출발 예정입니다.</span>
                
                
                <span class="delevery_o">(품절 시 제외/택배 사정으로 배송이 평소보다 늦어질 수 있음)</span>
            </div>
        </div>
        <div class="txt_box1 basket_right1">
            <div>
                <span class="f_col6">100% 묶음배송</span>
                <span class="delevery_o"> (한번에 결제한 품목 기준)</span>
                
            </div>
            <div>
                <span class="f_col6 fol01">100% 정품 보장</span>
        
            </div>
        </div>
    </div>
</div>


<!-- s : 상세 구매내역 -->
       <h3 class="ttl_h3" style="margin-top: 100px;">
           결제 금액
           <span id="grade_sale" class="bdg_sale">회원 등급별 추가할인 적용</span>
  
           <span class="sale_noti_box">
               <span class="inner_txt">고객님께 <strong>최대 할인 혜택</strong>을 드릴 수 있는 방식으로 자동 계산된 내역입니다. <strong class="f_emph">주문 전 반드시 확인해주세요!</strong></span>
           </span>
       </h3>
      <!-- 장바구니 금액 적용 -->
                        <div class="opt_btn_area" >
                        
    <div class="evt_delivery_box" style="margin-right: 140px;">
        <div class="txt_box1" ">
            <div class="txt_dscrt">
                <span class="delevery_guide" style="font-size: 16px;text-align: center;">총액</span>
                <Br>
                <span style="font-size: 16px;color: black;text-align: center;"><strong><fmt:formatNumber value="${map.money}" pattern="#,###" />&nbsp;원</strong></span>
            </div>
        </div>
        
        <div class="txt_box1" style="margin-right: 20px;align-items: center;display: flex;margin-top: 10px;">
            <div class="txt_dscrt" style="font-size: 19px;">
                 <i class="fa-solid fa-circle-plus"></i>
            </div>
        </div>
        
      
        <div class="txt_box1">
            <div class="txt_dscrt">
                <span class="delevery_guide" style="font-size: 16px;text-align: center;">배송료</span>
                <br>
                <span style="font-size: 16px;color: black;text-align: center;margin-left: 6px;margin-bottom: 6px;"><strong><fmt:formatNumber value="${map.fee}" pattern="#,###" />&nbsp;원</span></strong>
            </div>
        </div>
         <div class="txt_box1">
            <div class="txt_dscrt" style="margin-right: 20px;align-items: center;display: flex;margin-top: 20px;font-size: 19px;">
               <i class="fa-solid fa-equals"></i>
            </div>
        </div>
        <div class="txt_box1 basket_right1">
            <div class="txt_dscrt">
                <span class="delevery_guide" style="font-size: 16px;text-align: center;">결제금액</span>
                <br>
                <span style="font-size: 16px;color: black;text-align: center;margin-left: 6px;margin-bottom: 6px;"><strong><fmt:formatNumber value="${map.sum}" pattern="#,###" />&nbsp;원</span></strong>
            </div>
        </div>
            </div>
        </div>
    </div>
</div>

<!-- 배송지 -->
<form action="<%=request.getContextPath() %>/pay.do" method="post">
<input type="hidden" name="order_product" value="${map.product_name}"> 
  <input type="hidden" value="${map.id}" name="order_id">
    <input type="hidden" name="order_sum" value="${map.sum}">
      <input type="hidden" name="order_code" value="${map.code}">
<input type="hidden" name="order_cart" value="${map.cart}">

   <table id="ShippingAddressForm" class="cart_tbl ipt_tbl" summary="구매자의 배송지 정보를 제공합니다." style="margin-top: 60px;height: 400px;">
   <p style="font-size: 20px;text-align: center;"><strong>배송지 정보</p></strong>
    <colgroup>
        <col width="190">
        <col width="402">
        <col width="148">
        <col width="466">
    </colgroup>
    <tbody>
  
    <tr>
        <th scope="row">배송 받는분 이름</th>
        <td>
            <div class="ipt_t_bx">
                <input class="ipt" type="text" name="order_name" value="${map.name}" data-filter="name">
            </div>
          
        </td>
        <th scope="row">
            핸드폰 번호<br>
        </th>
        <td>
            <div class="ipt_t_bx">
         
                <select class="tel1" name="order_phone1">
                    <option value="">선택</option>
                                                                        <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                    <option value="017">017</option>
                                                    <option value="018">018</option>
                                                    <option value="019">019</option>
                                                            </select>
                <span class="txt_hp">-</span>
                <input class="ipt tel2" type="text" name="order_phone2" maxlength="4">
                <span class="txt_hp">-</span>
                <input class="ipt tel2" type="text" name="order_phone3" maxlength="4">
                <label class="chk_label">
             
                </label>
        
        
            </div>
          
        </td>
    </tr>
    <tr>
        <th scope="row">주소</th>
        <td colspan="3">
            <input class="ipt add1" type="text" name="order_addr1" id="sample6_postcode" name="order_addr1">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success px-3" style="background-color: gray;margin-top: 10px;opacity: 1" >
            <div class="mg_t5">
                <input class="ipt add2" type="text" name="order_addr2" id="sample6_address">
                <input class="ipt add3" type="text"name="order_addr3" id="sample6_detailAddress">
            </div>
        </td>
    </tr>
    <tr>
        <th scope="row">택배사 요청(선택)</th>
        <td colspan="3">
            <select class="memo1" name="parcel_cont">
                <option value="">택배사원 전달 메모를 선택하세요.</option>
                <option value="">직접 입력하기</option>
                <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                <option value="현관문 앞에 놓아주세요">현관문 앞에 놓아주세요</option>
                <option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
                <option value="배송 전 연락바랍니다">배송 전 연락바랍니다</option>
                <option value="초인종 누르지 마시고 노크해주세요">초인종 누르지 마시고 노크해주세요</option>
                <option value="고가의 상품이니 본인에게 배송해주세요">고가의 상품이니 본인에게 배송해주세요</option>
            </select>
            <input class="ipt memo2" type="text" name="Memo" data-filter="memo">
           
            <div class="txt_noti">택배사 사정에 의해 요청사항 처리가 원활하지 않을 수 있습니다. 배송관련 각종 문의 및 요청사항 : 1588-1255 (CJ대한통운 택배)</div>
        </td>
    </tr>
    </tbody>
</table>   



                       <!-- s : 비회원 개인정보 수집동의 -->
                    <h3 class="ttl_h3" style="margin-top: 50px;">주문/배송을 위한 개인정보 수집동의</h3>
                    <div class="agreeNoneMember" style="height:200px;">
                        
                        1. 수집하는 개인정보의 항목
                        <br><br>
                        1) 주문고객 정보 : 이름, 이메일, 전화번호, 휴대폰번호<br>
                        2) 배송지 정보 : 받을 사람 이름, 주소, 전화번호, 휴대폰번호<br>
                        3) 결제 정보 : 결제를 진행하기 위해 필요한 결제 관련 정보<br>
                        <br><br>
                        2. 개인정보의 수집/이용 목적<br>
                        - 주문자 정보 확보, 물품에 관한 배송지 정보 확인, 불만처리 의사소통 경로 확보 <br>
                        <br><br>
                        3. 개인정보의 보유/이용 기간
                        <br><br>
                        * 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.
                        <br>
                        단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안
                        회원정보를 보관합니다.<br>이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
                        <br><br>
                        - 계약 또는 청약철회 등에 관한 기록<br>
                        보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
                        보존기간 : 5년<br>
                        <br>
                        - 대금결제 및 재화 등의 공급에 관한 기록 <br>
                        보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
                        보존기간 : 5년<br>
                        <br>
                        - 소비자의 불만 또는 분쟁처리에 관한 기록 <br>
                        보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
                        보존기간 : 3년<br>
                        <br><br>
                        <br>
                        ※ 보다 자세한 내용은 "개인정보처리방침"을 확인하여 주시기 바랍니다.
                        <br><br>            
                
                    </div>
                    <p class="checkBoxAg">
                        <label for="checkAgree" class="chk_label">
                            <input type="checkbox" title="동의시 선택" id="checkAgree" name="GuestOrderAgree"><span> 위 주문에 필요한 개인정보 수집에 동의합니다.</span>
                        </label>
                    </p>
                    <!-- s : 비회원 개인정보 수집동의 -->
                    
                       <!-- s : 결제 정보 입력(기본-KPAY) -->
                    <div id="billBox" class="cart_tbl_box" style="align-items: center;margin-top: 6px;">
                        <h3 class="ttl_h3">결제정보</h3>

                        
                    <!-- s : 최종결제금액 -->
                        <div class="result_bx">
                            <ul class="result_cal n6">
                                <li>
                                    <div class="bx">
                                        <span>아임즈가격</span><br>
                                        <span class="txt_price BasePriceTotal"><fmt:formatNumber value="${map.money}" pattern="#,###" />&nbsp;원</span>
                                        <em class="ico_minus">-</em>
                                    </div>
                                </li>
                                <li>
                                    <div class="bx">
                                        <span>총 할인금액</span><br>
                                        <span class="txt_price DcPriceTotal">0</span>
                                        <em class="ico_minus">-</em>
                                    </div>
                                </li>
                                <li>
                                    <div class="bx">
                                        <span>적립금</span><br>
                                        <span class="txt_price UsePoint">0</span>
                                        <em class="ico_plus">+</em>
                                    </div>
                                </li>
                                <li>
                                    <div class="bx">
                                        <span>옵션별 비고</span>
                                        <br>
                                        <span class="txt_price opt_prd OptionAddPriceTotal">0</span>
                                        <em class="ico_plus">+</em>
                                    </div>
                                </li>
                                <li>
                                    <div class="bx">
                                        <span>배송비</span><br>
                                        <span class="txt_price before_delivery TranscostBeforePriceTotal" style="display:none"></span>
                                        <span class="txt_price TranscostPriceTotal">${map.fee}</span>
                                        <em class="ico_equals">=</em>
                                    </div>
                                </li>
                                <li class="lst">
                                    <div class="bx">
                                        <span>최종 결제금액</span><br>
                                        <span class="txt_price f_col4 LastPriceTotal"><fmt:formatNumber value="${map.sum}" pattern="#,###" />&nbsp;원</span>
                                    </div>
                                </li>
                            </ul>
                            <div class="add_sale_lst" style="display:none;">
                                <ul>
                                    <li class="tit"><div><strong>추가할인 내역 ▶</strong></div></li>
                                    <li class="sale_lst">
                                        <div id="LastDcList"></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- e : 최종결제금액 -->

                        
                        <!-- s : 결제 정보 그 외 내용 -->
<div class="payment_info_box" data-detail_kind="KPAY|PAYCO|SAMSUNGPAY|EASYPAY|OKMALLPAY|CARD|GCARD"  style="display:block;">
    <div class="payment_txt_box1">※ 5만원 이상의 현금거래는 전자상거래 등에서의 소비자보호에 관한 법률에 의거 채무지급보증 서비스를 제공합니다.</div>
    <div class="payment_txt_box2">
        <strong>카드증빙 발급 안내</strong><br>
        화면상단 [마이페이지]-[주문배송내역/배송조회]페이지에서 주문번호 하단 [상세보기/접수하기]를 클릭하시면 영수증 출력이 가능합니다.<br>
        해당메뉴를 클릭하시면 카드시스템 관리사인 이니시스로 연결되며, 카드번호등 필요 사항을 입력하시어 내역을 조회하시기 바랍니다.<br>
        카드결제 시 세금계산서 중복발행 불가 : 사업자 고객은 부가가치세법 제32조 2 제3항에 의거하여 카드결제건의 경우 세금계산서 발급 신청을 하게 되면<br>
        정규증빙의 중복발행에 해당하므로, 신용카드매출전표에 이면확인을 하여 세금계산서 대신 증빙으로 활용하시면 됩니다.
    </div>
</div>

      <p class="order_txt">주문 내용을 모두 확인 하였으며, 결제에 동의합니다.</p>
                        <div class="order_btn_wrap">
                            <button type="button" class="btn_cart cancel" onclick="location.href = '<%=request.getContextPath() %>/shop/cart/list.do';">취소하기</button>
                            <button type="submit" class="btn_cart payment btnPurchase">결제하기</button>
                        </div>
                    </div>
                          </form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>