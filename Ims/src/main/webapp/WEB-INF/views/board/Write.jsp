<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${ct == 'notice' }">
		<title>공지사항</title>
	</c:when>
	<c:when test="${ct == 'qna' }">
		<title>Qna</title>
	</c:when>
	<c:when test="${ct == 'dq' }">
		<title>1:1문의하기</title>
	</c:when>
</c:choose>
<link rel="shortcut icon" href="#">
<script src="https://kit.fontawesome.com/6c060c00b1.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
/*summernote images size fix*/

::ng-deep .ngx-summernote-view img{

  max-width: 100%;

}
</style>
<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<script>
	$(function(){
		
		$("#submit").on('click' , function(){
			
			let category = $("#category").val();
			let title = $("#title").val();
			let name = $("#name").val();
			let content = $("#content").val();
			let dq_ct_idx = $("#dq_ct_idx").val();
			
			
			if(category  == ""){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;	
				
			}else if(title == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#title").focus();
				return false;	
				
			}else if(name == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#name").focus();
				return false;		
				
			}else if(content == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#content").focus();
				return false;	
				
			}else if(dq_ct_idx == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#dq_ct_idx").focus();
				return false;	
				
			}
		});
	});
	
	
</script>

</head>
<%@ include file="../include/menu1.jsp" %>
<body>
<div class="text-center">
<c:choose>
	<c:when test="${ct == notice or ct == qna}">
		<c:if test="${sessionScope.name != '관리자'}">
			<script>
			alert("유효하지 않은 접근입니다.");
			location.href="${pageContext.request.contextPath}/";
			</script>
		</c:if>
	</c:when>
	
</c:choose>


	<form class="form-data" id="form" action="${pageContext.request.contextPath}/board/${ct}/WriteProcess.do" method="post" enctype="multipart/form-data">
		
			
		<div class="container">
		<!-- 제목 -->
		<div class="form-group">
			<div class="input-group">
				<c:choose>
					<c:when test="${ct == 'dq' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="2" <c:if test="${ct=='dq'}"><c:out value="selected">selected</c:out></c:if>>1:1문의</option>
						</select>
					</c:when>
					<c:when test="${ct == 'notice' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="0" <c:if test="${ct=='notice'}"><c:out value="selected">selected</c:out></c:if>>공지사항</option>				
						</select>
					</c:when>
					<c:otherwise>
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="1" <c:if test="${ct=='qna'}"><c:out value="selected">selected</c:out></c:if>>qna</option>				
						</select>
					</c:otherwise>
				</c:choose>
				<!-- s :문의 유형 -->
				<c:if test="${ct=='dq'}">
					<select id="dq_ct_idx" name="dq_ct_idx" class="form-control col-2" aria-label="Default select example">
						<option value="10">환불문의</option>
						<option value="11">교환문의</option>
						<option value="12">AS문의</option>
						<option value="13">배송문의</option>						
					</select>
				</c:if>
				<!-- e :문의유형 -->
				<input type="text" class="form-control col-auto" id="title" placeholder="제목을 입력하세요" name="title" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="title_result"></div>
				<!-- s:hidden여부 -->
				<c:if test="${ct == 'dq'}">
					<div class="form-check form-switch form-control col-1">
						<input class="form-check-input" type="checkbox" value="1" id="flexSwitchCheckDefault" name="hidden" id="hidden">
						<label class="form-check-label" for="flexSwitchCheckDefault">
						비밀글
						</label>
					</div>
				</c:if>
				<!-- e:hidden여부 -->
				<!-- 작성자 -->
				<input type="text" class="form-control col-sm-2" id="name" placeholder="작성자" readonly="readonly" value="${sessionScope.userid}" name="member_id" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="writer_result"></div>
			
			
			</div>
			<textarea  id="summernote" class="summernote" name="content" style="text-align:left;"></textarea>
			<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this
            
            
            
            );
            		}
            	}
            }
         };

        $('#summernote').summernote(setting);
        });
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}
</script>
			
		<!--  -->
    
      

			 
            <!-- <input type="file" accept='image/jpg,impge/png,image/jpeg,image/gif' class="bg-light form-control" multiple="multiple" name="files">
             -->      
        </div>
		
		<div class="form-group pt-1 text-right">
		
			<input class="btn btn-outline-secondary" id="submit" type="submit" value="글작성"/>
			
			<input class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/board/${ct}/List.do'"/>
			
		</div>
		</div>
	</form>
			

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>