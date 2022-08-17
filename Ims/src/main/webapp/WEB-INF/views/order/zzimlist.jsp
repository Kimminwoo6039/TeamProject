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
        <h2 class="ttl_h2 step1" style="margin-left: 400px;">찜한상품</h2>
        <span class="cart_cnt" style="margin-top: px;">(<span id="BaseItemsCount">${count}</span>품목)</span>
    </div>

<div class="container bg-white rounded-top mt-5" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12 pt-3">
                
				
				<hr>
                 
                    
                <div class="d-flex flex-row mobile row align-items-center">
                	<div class="px-lg-4 ml-lg-5 col-2 text-center">번호</div>
                	<div class="px-lg-4 ml-lg-5 col-5" id="produc">상품</div>
                    <div class="px-lg-4 ml-lg-5 col-2" id="prc">가격</div>
                    <div class="px-lg-4 ml-lg-5 col-2" id="total">삭제</div>
                </div>
                 <c:forEach var="row" items="${map.list}">
                 
                
                
                <div class="d-flex flex-row mobile row align-items-center">
                    <div class="px-lg-4 ml-lg-5 col-2 text-center">
                    	<div>${row.zzim_idx}</div>
                    </div>
					<div class="px-lg-4 ml-lg-5 col-5">
                    	<div class="row align-items-center">
                    		<div class="col-md-auto">
								<div><a href="<%=request.getContextPath() %>/shop/product/detail/${row.product_code}"><img src="<%=request.getContextPath() %>/resources/images/${row.filename}" width="100" height="100" alt="" id="image"></a></div>
								<div class="d-flex flex-column pl-md-4 pl-4" style="margin-left: 20px;"></div>
                      		</div>
                         	<div class="col">
								<div><h6>${row.product_name}</h6></div>
								<div>Color:<span class="pl-3">&nbsp;${row.color}</span></div>
								<div>Size:<span class="pl-4"> &nbsp;${row.size}</span></div>
							</div>
						</div>
					 </div>                
                    <div class="px-lg-4 ml-lg-5 col-2 text-left" style="margin-left: 30px;"><b><fmt:formatNumber value="${row.money}" pattern="#,###" />&nbsp;원</b></div>
                   <div class="px-lg-4 ml-lg-5 col-2 text-center"><a id="yeszzim" class="btn btn-sm bg-dark text-white " href="<%=request.getContextPath() %>/shop/product/deletezzim2.do/${row.zzim_idx}">삭제</a></div>
               </div>
              
    </c:forEach>
    
            </div>
        </div>
    </div>
    
    <script>
    // 찜하기 전체 선택
    function selectAll(selectAll){
    	const checkboxes 
        = document.getElementsByName('chbx');
    	  
    	  checkboxes.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	}
    </script>
    
    
    <div class="container rounded-bottom py-4" id="zero-pad">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <button class="btn btn-sm bg-light border border-dark" type="button" onclick="location='<%=request.getContextPath() %>/shop/product/list.do'">GO BACK</button>
                    </div>
                    <div class="px-md-0 px-1" id="footer-font">
                         </div>
                    
                </div>
            </div>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>