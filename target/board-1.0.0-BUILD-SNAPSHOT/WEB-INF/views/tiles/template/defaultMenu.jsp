<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page pageEncoding="utf-8" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="position: fixed; left: 0px; top: 5px">
	<a class="navbar-brand">게시판</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		<!-- <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/">Home<span class="sr-only">(current)</span></a>
      </li> -->
      <li class="nav-item active">
        <a class="nav-link" href="/">게시글 목록</a>
      </li>
      <sec:authorize access="isAuthenticated()">
      <li class="nav-item active">
        <a class="nav-link" href="/board_add">게시글 작성</a>
      </li>
      </sec:authorize>
      
		</ul>
		<form class="form-inline my-2 my-lg-0"></form>
		<!-- 로그인 버튼 -->
		<sec:authorize access="isAnonymous()">
			<ul class="nav navbar-nav navbar-right">
				<li>
				<div class="d-flex">
  				<div class="dropdown mr-4">
    				<button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" 
    				aria-haspopup="true" aria-expanded="false" data-offset="10,20">로그인</button>
    					<div class="dropdown-menu dropdown-menu-lg-right">
  						<form class="px-4 py-3" action="<c:url value='/user/login' />" method="post">
	    					<div class="form-group">
		      					<label for="exampleDropdownFormEmail1">사용자명</label>
		      					<input type="text" name="email" class="form-control" placeholder="id">
	    					</div>
						    <div class="form-group">
						      <label for="exampleDropdownFormPassword1">비밀번호</label>
						      <input type="password" name="password" class="form-control" placeholder="Password">
						    </div>
						    <div class="form-group">
                				<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
           					 </div>
						    <button type="submit" class="btn btn-primary">로그인</button>
						  </form>
						  <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="/signup">회원가입</a>
						</div>
				</div>
						</div></li>
			</ul>
		</sec:authorize>
		<!-- 로그아웃 버튼 -->
		<sec:authorize access="isAuthenticated()">
		<ul class="nav navbar-nav navbar-right">
				<li style="display:inline-block;">
				<br>
			<c:set var="messageForLoginedUser" value="님 환영합니다." />
			<font color=white><c:out value="${pageContext.request.userPrincipal.name}${messageForLoginedUser}" escapeXml="false" /></font>
			</li>
			<li>
			<c:url var="logoutUrl" value="/logout" />
			<form action="${logoutUrl}" method="post"
				class="navbar-form navbar-right">
				<button style="margin-left: 30px;" type="submit"
					class="btn btn-primary">로그아웃</button>
				<%
					//<button type="submit" class="btn btn-default">로그아웃</button>
				%>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			</li>
			</ul>
		</sec:authorize>
	</div>
</nav>
