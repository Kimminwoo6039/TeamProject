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
<title>찜목록</title>


   <link rel="stylesheet" type="text/css" href="https://st.okmall.com/libs/swiper/swiper.css" />
        <link rel="stylesheet" type="text/css" href="https://img.okmall.com/Static/www/css/cart.new.css?v=20220223" />
        
        
        
 <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script>
/* 
$(function(){
	
	$("#btnDelete").click(function(){
		
	
	if(confirm("찜목록을 비우시겠습니까 ? ")){
		location.href = "deletezzim.do"
	}
	})
	
	
	
	

	
	
	
	
}) */


</script>






</head>
<body>

<%@ include file="../include/menu1.jsp" %>

    <div class="cart_tit" style="margin-right: 300px;margin-top: 40px;">
        <h2 class="ttl_h2 step1" style="margin-left: 400px;">찜목록</h2>
        <span class="cart_cnt" style="margin-top: px;">(<span id="BaseItemsCount">${count}</span>품목)</span>
        <div class="cart_process step1">
            <span class="blind">1. 장바구니</span>
        </div>
    </div>


<div class="container bg-white rounded-top mt-5" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12 pt-3">
                <div class="d-flex">
                    <div class="pt-4" style="margin-left: 480px;"><h4>찜목록</h4></div>                           
                </div>
                <div class="d-flex flex-column pt-5" style="margin-left: 50px;">
                    <div><h5 class="text-uppercase font-weight-normal">나의 현황</h5></div>
                  
                </div>
                 <hr>
                 
                     
                <div class="d-flex flex-row mobile row" id="heading">
                	<input type="checkbox" class="px ml-lg-5 col-1">
                    <div class="px-lg-4 ml-lg-5 col-5" id="produc">상품</div>
                    <div class="px-lg-4 ml-lg-5 col-2" id="prc">가격</div>
                    <div class="px-lg-4 ml-lg-5 col-2" id="total">금액</div>
                    <div class="px-lg-4 ml-lg-5 col-2" id="total"><button type="button" id="btnDelete" class="btn btn-sm bg-dark text-dark "><a style="color: white;">전체삭제</a></div>
                </div>
                 <c:forEach var="row" items="${map.list}">
                 
                <form >
                
                <div class="d-flex flex-row justify-content-between align-items-center pt-lg-4 pt-2 pb-3 border-bottom mobile">
                    <div class="pl-md-0 pl-1">
                    	<input type="checkbox" class="checkbox">
                    </div>
                    <div class="d-flex flex-row align-items-center">
                        <div><a href="/shop/shop/product/detail/${row.product_code}"><img src="/shop/resources/images/${row.filename}" width="100" height="100" alt="" id="image"></a></div>
                        <div class="d-flex flex-column pl-md-4 pl-4" style="margin-left: 20px;">
                            <div><h6>${row.product_name}</h6></div>
                            <div>Color:<span class="pl-3">&nbsp;${row.color}</span></div>
                            <div>Size:<span class="pl-4"> &nbsp;${row.size}</span></div>
                        </div>                    
                    </div>
            
                    <div class="pl-md-0 pl-1" style="margin-left: 30px;"><b><fmt:formatNumber value="${row.money}" pattern="#,###" />&nbsp;원</b></div>
                   <button type="button" id="yeszzim" class="btn btn-sm bg-dark text-white">삭제</button>
                </div>
               <input type="hidden" name="cart_id" value="${row.cart_id}">
						<input type="hidden" name="brand" value="${row.brand}">
           				 <input type="text" name="product_code" value="${row.product_code}">
                      	<input type="text" name="member_id" value="${sessionScope.userid}">
                      	
               </form>
    </c:forEach>
    
            </div>
        </div>
    </div>
    <script>
    $(function(){
		$("#yeszzim").click(function(){
			
			//		$("member_id").val("${sessionScope.userid}");
			//		$("brand").val("${vo.brand}");
			//		$("product_code").val("${product_code}");
					
					var member_id = "${sessionScope.userid}";
					var product_code = "8"
					
			//		console.log(${sessionScope.userid});
			//		console.log(${vo.brand});
			//		console.log(${product_code});
			
						/* if(member_id = ""){
							alert("로그인을 해주세요");
							location.href="/shop"
							return;
						} */
					alert("버튼 클릭");
						alert(member_id);
						alert(product_code);
					$.ajax({
						type:'post',
						url:"/shop/shop/product/deletezzim.do",
						data: {"member_id":member_id,
							"product_code":product_code
						},
						
						success: function(data){
							if(data == "N"){
								console.log(data);
								alert('찜삭제 실패!');
								
								
							 }else{
								console.log(data);
								if(member_id == ""){
									alert('로그인 필요');
									location.href="/shop/member/login.do";
									return;
								}
								alert('찜삭제.');
								location.href="/shop/mypage/zzim.do";
								/* location.reload(); */
								
							 }
							 
					 },
						error : function(error){alert(error);}
					});
					
				});
		
		
		
	});
    
    
    </script>
    
    
    
    <div class="container bg-light rounded-bottom py-4" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <button class="btn btn-sm bg-light border border-dark" type="button" onclick="location='/shop/shop/product/list.do'">GO BACK</button>
                    </div>
                    <div class="px-md-0 px-1" id="footer-font">
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