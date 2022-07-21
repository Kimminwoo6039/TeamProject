<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <style>
      body{
    background-color: #eeeeee;
}

.footer-background{
    background-color: rgb(204, 199, 199);
}

@media(max-width:991px){
    #heading{
        padding-left: 50px;
    }
    #prc{
        margin-left: 70px;
        padding-left: 110px;
    }
    #quantity{
        padding-left: 48px;
    }
    #produc{
        padding-left: 40px;
    }
    #total{
        padding-left: 54px;
    }
}
@media(max-width:767px){
    .mobile{
        font-size: 10px;
    }
    h5{
        font-size: 14px;
    }
    h6{
        font-size: 9px;
    }
    #mobile-font{
        font-size: 11px;
    }
    #prc{
        font-weight: 700;
        margin-left: -45px;
        padding-left: 105px;
    }
    #quantity{
        font-weight: 700;
        padding-left: 6px;
    }
    #produc{
        font-weight: 700;
        padding-left: 0px;
    }
    #total{
        font-weight: 700;
        padding-left: 9px;
    }
    #image{
        width: 60px;
        height: 60px;
    }
    .col{
        width: 100%;
    }
    #zero-pad{
        padding: 2%;
        margin-left: 10px;
    }
    #footer-font{
        font-size: 12px;
    }
    #heading{
        padding-top: 15px;
    }
}
  </style>


<meta charset="UTF-8">
<title>Insert title here</title>


   <link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/swiper/swiper.css" />
        <link rel="stylesheet" type="text/css" href="https://img.okmall.com/Static/www/css/cart.new.css?v=20220223" />
        
        
        
 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script>

$(function(){
	
	$("#btnDelete").click(function(){
		
	
	if(confirm("장바구니를 비우시겠습니까 ? ")){
		location.href = "/shop/shop/cart/deleteAll.do"
	}
	})
	
	
	
	

	
	
	
	
})


</script>






</head>
<body>

<%@ include file="../include/menu1.jsp" %>

    <div class="cart_tit" style="margin-right: 300px;margin-top: 40px;">
        <h2 class="ttl_h2 step1" style="margin-left: 400px;">장바구니</h2>
        <span class="cart_cnt" style="margin-top: px;">(<span id="BaseItemsCount">${map.count}</span>품목)</span>
        <div class="cart_process step1">
            <span class="blind">1. 장바구니</span>
        </div>
    </div>


<div class="container bg-white rounded-top mt-5" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12 pt-3">
                <div class="d-flex">
                    <div class="pt-4" style="margin-left: 480px;"><h4>장바구니</h4></div>                           
                </div>
                <div class="d-flex flex-column pt-5" style="margin-left: 50px;">
                    <div><h5 class="text-uppercase font-weight-normal">나의 현황</h5></div>
                  
                </div>
                 <hr>
                 
                     
                <div class="d-flex flex-row mobile" id="heading" style="padding-left: 240px;">
                    <div class="px-lg-4 mr-lg-5" id="produc" style="margin-right: 120px;" >상품</div>
                    <div class="px-lg-4 ml-lg-5" id="prc" style="margin-right: 85px;">가격</div>
                    <div class="px-lg-4 ml-lg-5" id="quantity" style="margin-left: 43px;">수량</div>
                    <div class="px-lg-4 ml-lg-5" id="total" style="margin-left: 100px;">금액</div>
                    <div style="margin-left: 90px;"><button type="button" id="btnDelete" class="btn btn-sm bg-dark text-dark "><a style="color: white;">전체삭제</a></div>
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
                      
                    
                        <button id="btnUpdate" class="btn btn-sm bg-dark text-dark"><a style="color: white;">변경</a></button>
                    
                    </div>

                    <div class="pl-md-0 pl-1" style="margin-left: 30px;"><b><fmt:formatNumber value="${row.money}" pattern="#,###" />&nbsp;원</b></div>
                    <div class="close"><a href="/shop/shop/cart/delete.do?cart_id=${row.cart_id}" style="text-decoration: none;color: white;"><button type="button" value="삭제" class="btn btn-sm bg-dark text-dark " style="color: white;">삭제</a></div>
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
                        <button class="btn btn-sm bg-light border border-dark" type="button" onclick="location='/shop/shop/product/list.do'">GO BACK</button>
                    </div>
                    <div class="px-md-0 px-1" id="footer-font">
                        <b class="pl-md-4">배송료&nbsp;<span class="pl-md-4"><fmt:formatNumber value="${map.fee}" pattern="#,###,###"/>&nbsp;원</span></b>&nbsp;&nbsp;&nbsp;<strong>+</strong>
                        <b class="pl-md-4">&nbsp;&nbsp;상품금액<span class="pl-md-4">&nbsp;<fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###"/>&nbsp;원</span></b>&nbsp;&nbsp;=
                        <b class="pl-md-4">총결제금액<span class="pl-md-4">&nbsp;&nbsp;\&nbsp;<fmt:formatNumber value="${map.sum}" pattern="#,###,###"/>&nbsp;원</span></b>
                    </div>
                    <div>
                        <button class="btn btn-sm bg-dark text-white px-lg-5 px-3" onclick="location='/shop/shop/cart/order.do?sum=${map.sum}'" type="button">CONTINUE</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>