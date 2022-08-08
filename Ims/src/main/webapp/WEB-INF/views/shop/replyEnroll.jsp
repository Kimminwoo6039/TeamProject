<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <style type="text/css">
  	/* â ���� ���ֱ� */
  	body{
  		margin : 0;
  	}
  	/* ��ü ���ȭ�� ���� */
  	.wrapper_div{
		background-color: #f5f5f5;
	    height: 100%;  	
  	}
 	/* �˾�â ���� */
  	.subject_div{
	    width: 100%;
	    background-color: #7b8ed1;
	    color: white;
	    padding: 10px;
	    font-weight: bold;
  	}
  	
  	/* ������, ��ư ���� padding */
  	.input_wrap{
  		padding: 30px;
  	}
  	.btn_wrap{
  		padding: 5px 30px 30px 30px;
  		text-align: center;
  	}
  	
  	/* ��ư ���� */
  	.cancel_btn{
  		margin-right:5px;
  	    display: inline-block;
	    width: 130px;
	    background-color: #5e6b9f;
	    padding-top: 10px;
	    height: 27px;
	    color: #fff;
	    font-size: 14px;
	    line-height: 18px;  	
  	}
  	.enroll_btn{
   	    display: inline-block;
	    width: 130px;
	    background-color: #7b8ed1;
	    padding-top: 10px;
	    height: 27px;
	    color: #fff;
	    font-size: 14px;
	    line-height: 18px;   	
  	}

	/* å���� ���� */
	.bookName_div h2{
		margin : 0;
	}
  	/* ���� ���� */
  	.rating_div{
  		padding-top: 10px;
  	}
  	.rating_div h4{
  		margin : 0;
  	}
  	select{
  	margin: 15px;
    width: 100px;
    height: 40px;
    text-align: center;
    font-size: 16px;
    font-weight: 600;  	
  	}
  	/* ���� �ۼ� ���� */
  	.content_div{
  		padding-top: 10px;
  	}
  	.content_div h4{
  		margin : 0;
  	}
  	textarea{
		width: 100%;
	    height: 100px;
	    border: 1px solid #dadada;
	    padding: 12px 8px 12px 8px;
	    font-size: 15px;
	    color: #a9a9a9;
	    resize: none;
	    margin-top: 10px;  	
  	}
  
  </style>
  
  <script>
  
  $(function(){
	
	  

		$(".cancel_btn").on("click", function(e){
			window.close();
		});	
	 
	  
	  

  
  
  
   /* ��� ��ư */
	$(".enroll_btn").on("click", function(e){

		const product_code = '${productInfo.product_code}';
		const member_id = '${member_id}';
		const rating = $("select").val();
		const content = $("textarea").val();

		const data = {
				product_code : product_code,
				member_id : member_id,
				rating : rating,
				content : content
		}		
		
		$.ajax({
			data : data,
			type : 'POST',
			url : '<%=request.getContextPath() %>/insert.do',
			success : function(result){
			
		       
				 window.close();
				// location.href='/shop/shop/product/detail/${productInfo.product_code}';
				window.opener.location.href = "<%=request.getContextPath() %>/shop/product/detail/${productInfo.product_code}";
			}
			
		});		
		
	});
   
  })
  </script>
</head>
<body>

<div class="wrapper_div">
<div class="subject_div">
			���� ���
		</div>
</div>
	<div class="input_wrap">			
			<div class="bookName_div">
				<h2>${productInfo.product_name}</h2>
			</div>
			<div class="rating_div">
				<h4>����</h4>
				<select name="rating">
					
					<option value="1.0">1.0</option>
				
					<option value="2.0">2.0</option>
			
					<option value="3.0">3.0</option>
			
					<option value="4.0">4.0</option>
				</select>
			</div>
			<div class="content_div">
				<h4>����</h4>
				<textarea name="content"></textarea>
			</div>
		</div>

	<div class="btn_wrap">
			<a class="cancel_btn">���</a><a class="enroll_btn">���</a>
		</div>




</body>
</html>