<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="<c:url value="/resources/static/css/app.css" />" rel="stylesheet">
<%@ page pageEncoding="utf-8"%>

<body>
	<div class="wrap">
		<div class="center_box">
			<div>
				<h2 class="card-title text-center" style="color:#574F4E;">로그인</h2>
			</div>
			<div style="margin-left:10px; margin-right:10px;">
	      <form action="/user/login" method="POST" onSubmit="logincall();return false">
	        <h5>다시 입력해주세요</h5>
	        <label for="inputEmail" class="sr-only">Your ID</label>
	        <input type="text" id="email" name="email" class="form-control" placeholder="Your ID" required autofocus><BR>
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required><br>
	 		<br>
	        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
	      </form>
	      	<a href="signup" style="color:#ib95E0" >회원가입 하시겠습니까?</a>
			</div>
		</div>
	</div>
</body>
