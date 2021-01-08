<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- Bootstrap CSS -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<article>
<div class="container">
	<br>
	<div class="table-responsive">
	<table class="table table-striped table-sm">   <!-- table-hover -->

		<tr>
			<th style="width: 50%">제목</th>
			<th style="width: 10%">사진</th>
			<th style="width: 15%">작성자</th>
			<th style="width: 10%">작성일자</th>
			<th style="width: 15%"><div class="col-md-auto">수정 / 삭제</div></th>
		</tr>
		
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td><c:url value="board_details" var="url">
						<c:param name="id" value="${board.id}" />
					</c:url> <a href="${url}"> <c:out value="${board.title}" />
				</a></td>
				<td><c:url value="board_details" var="url">
						<c:param name="id" value="${board.id}" />
					</c:url> <a href="${url}"> <c:url value="get_image" var="image_url">
							<c:param name="id" value="${board.id}" />
						</c:url> 
						<img src="<c:url value='${image_url}' />" width="40px" height="40px" />
						
				</a></td>
				<td><c:out value="${board.author}" /></td>
				<td><c:out value="${board.created_date}" /></td>
				<td>
	<!-- 삭제버튼 (작성자에게만 보여주도록 함) -->
	<sec:authorize access="isAuthenticated()">

	<div class="col-md-auto">
	<c:if test="${pageContext.request.userPrincipal.name eq board.author}">	
		<span> <c:url value="board_edit" var="url">
							<c:param name="id" value="${board.id}" />
						</c:url> <a href="${url}">
							<button class="btn btn-xs btn-warning">수정</button>
					</a>
				</span> 
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-xs btn-secondary" data-toggle="modal" data-target="#exampleModal${board.id}">삭제</button>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal${board.id}" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
			>
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">게시물을 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="location.href='board_delete?id=${board.id}'">삭제하기</button> <!-- clickDel(boardInfo) --> <!-- location.href='board_delete?id=${board.id}' -->
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</div>
			</div>
			
		</c:if>
	</div>
	</sec:authorize>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<table>
		<tr>
		<td colspan="1">
		<a class="flex" href="board_add">
		<sec:authorize access="isAuthenticated()">
		<button class="btn btn-info btn-sm">게시글 작성</button></sec:authorize></a></td>
		<td colspan="4" style="opacity:0">.</td>
		</tr>
	</table>
	
	<!--  페이징 -->
	<div align="center">
		<span> <a href="/?gubun=first"> 
				<button type="button" class="btn btn-outline-secondary">처음</button>
		</a></span>
		<span> <c:url value="/" var="url_previous">	
				<c:param name="gubun" value="previous" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url> <a href="${url_previous}">
				<button type="button" class="btn btn-outline-secondary">이전</button>
		</a></span>
		<c:forEach var="num" begin="0" end="${pageCounts-1}">
			<c:choose>
				<c:when test="${num==currentPage}">
					<span style="color:red">${num+1}</span>&nbsp;
				</c:when>
				<c:otherwise>
					<a href="/?gubun=${num}">${num+1}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<span> <c:url value="/" var="url_next">	
				<c:param name="gubun" value="next" />
				<c:param name="currentPage" value="${currentPage}" />
			</c:url> <a href="${url_next}">
				<button type="button" class="btn btn-outline-secondary">다음</button>
		</a></span>
		<span> <a href="/?gubun=last"> 
				<button type="button" class="btn btn-outline-secondary">마지막</button>
		</a></span>
	</div>
</div>
</article>