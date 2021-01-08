<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/jquery-3.5.1.js"></script>
<link href="resources/css/toastr.css" rel="stylesheet">
<link href="resources/static/css/ui.css" rel="stylesheet">
<script src="resources/js/toastr.min.js"></script>
	
	<form action="/board_edit_process" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${board.id}" />
		<!-- <div class="center">
			<br /><br />
			<h3>게시내용 수정</h3>

			<div class="form-group">
				<label for="title">메시지 제목</label>
				<input type="text" class="form-control" id="title" name="title" 
							value="${board.title}" readonly="readonly" />
				<input type="text" class="form-control" id="title" name="edited_title" 
							value="${board.title}" />
			</div>		
				
			<div class="form-group">
				<label for="message">메시지 내용</label> 
				<textarea readonly rows="10" cols="30" class="form-control" id="message" name="message" >${board.message}</textarea>	
				<textarea rows="10" cols="30" class="form-control" id="message" name="edited_message">${board.message}</textarea>	
			</div>
			
			
				<c:url value="get_image" var="image_url">
					<c:param name="id" value="${board.id}" />
				</c:url>
				<img src="<c:url value='${image_url}' />" />	
						
				<label for="photo">사진 선택</label> 
				<input type="file" class="form-control" id="photo" name="edited_photo">
				
		
			
			<hr />
			<button type="submit" class="btn btn-outline-secondary" onclick="toastr.success('게시물이 수정되었습니다.','게시물 수정');">수 정</button>

		</div> -->
		<div style="margin-left:30px; margin-right:70px;">
		<table class="board_view"> 
			<colgroup> 
				<col width="15%"/> 
				<col width="35%"/> 
				<col width="15%"/> 
				<col width="35%"/> 
			</colgroup> 
			<tbody> 
				<tr> 
					<th scope="row">작성자</th> 
					<td>${board.author}</td> 
					<th scope="row">작성일</th> 
					<td>${board.created_date}</td> </tr> 
				<tr> 
					<th scope="row">제목</th> 
					<td colspan="3"> <input type="text" id="title" name="edited_title" class="wdp_90" value="${board.title}"/> </td> </tr> 
				<tr> 
					<td colspan="4" class="view_text"> <textarea rows="20" cols="100" title="내용" id="message" name="edited_message">${board.message}</textarea> </td> </tr>
				<tr>
					<td rowspan="2" colspan="4"><c:url value="get_image" var="image_url"><c:param name="id" value="${board.id}" />
									</c:url>
					<img src="<c:url value='${image_url}' />" /><label for="photo">사진 선택</label> 
				<input type="file" class="form-control" id="photo" name="edited_photo"><br>
				<button type="submit" class="btn btn-primary" onclick="toastr.success('게시물이 수정되었습니다.','게시물 수정');">수 정</button>
				</td></tr> 
				<tr><td colspan="4"></td></tr>
			</tbody> 
		</table>
		</div>
	</form>

<script>
toastr.options = {
		  "closeButton": true,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-bottom-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "8000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
</script>