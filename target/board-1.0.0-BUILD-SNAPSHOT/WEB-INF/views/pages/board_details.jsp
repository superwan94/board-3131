<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value="/resources/static/css/ui.css" />" rel="stylesheet">
<%
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
%>
<form action="/board_details" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="id" value="${board.id}" />
	<div class="center">
		
		<div style="margin-left:30px; margin-right:70px;">
		<h3>게시내용</h3>
		<br>
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
				<td colspan="3">${board.title}</td> </tr>
				<tr>
				<td colspan="4" rowspan="2"><c:url value="get_image" var="image_url"><c:param name="id" value="${board.id}" />
				</c:url>
				<img src="<c:url value='${image_url}' />" /><br><br> ${fn:replace(board.message,cn,br)} </td>
				</tr>
				<tr> 
				<td colspan="4"></td> </tr> 
			</tbody> 
		</table>

		<!-- 
		<div class="form-group">
			<label for="title">메시지 제목</label> <input type="text"
				class="form-control" id="title" name="title" value="${board.title}"
				readonly="readonly" />
		</div>
		
		<div class="form-group">
			<label for="message">메시지 내용</label>
			<textarea readonly rows="10" cols="30" class="form-control" id="message" name="message">${board.message}</textarea>
		</div>


		<c:url value="get_image" var="image_url">
			<c:param name="id" value="${board.id}" />
		</c:url>
		<img src="<c:url value='${image_url}' />" /><label for="photo"></label>


		<hr />-->
		<input type="button" class="btn btn-primary" value="목록으로" onclick="history.back(-1)">
	</div>
	</div>
</form>

