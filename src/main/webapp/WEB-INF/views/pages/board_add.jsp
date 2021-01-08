<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="resources/js/jquery-3.5.1.js"></script>
<link href="resources/css/toastr.css" rel="stylesheet">
<link href="resources/static/css/ui.css" rel="stylesheet">
<script src="resources/js/toastr.min.js"></script>
<form action="/board_add_process" commandName="board" method="post"
	enctype="multipart/form-data">

	<!-- <div class="center">
		

		<div class="form-group">
			<label for="title">메시지 제목</label>
			<input type="text" id="title" name="title" />
		</div>		
			
		<div class="form-group">
			<label for="message">메시지 내용</label> 
			<textarea rows="10" cols="30" class="form-control" id="message" name="message" ></textarea>	
		</div>

		<div class="form-group">
			<label for="photo">사진 선택</label> 
			<input type="file" class="form-control" id="photo" name="photo">
		</div>
		
		<hr />
		<button type="submit" class="btn btn-primary" onclick="toastr.success('게시물이 추가되었습니다.','게시물 추가');">저 장</button>

	</div> -->
	<div style="margin-left:30px; margin-right:70px;">
	<table class="board_view"> 
		<colgroup> 
			<col width="15%"> 
			<col width="*"/> 
		</colgroup> 
		<tbody> 
			<tr> 
				<th scope="row">제목</th> 
				<td><input type="text" id="title" name="title" class="wdp_90"></input></td> 
			</tr> 
			<tr> 
				<td colspan="2" class="view_text"> <textarea style="resize: none;" rows="20" cols="100" title="내용" id="message" name="message"></textarea> </td> 
			</tr>
			<tr>
				<td colspan="2" rowspan="2"><input type="file" id="photo" name="photo"><br>
				<button type="submit" class="btn btn-primary" onclick="toastr.success('게시물이 추가되었습니다.','게시물 추가');">저 장</button></td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
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