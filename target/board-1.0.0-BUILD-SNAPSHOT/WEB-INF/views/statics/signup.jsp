<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="<c:url value="/resources/static/css/app.css" />" rel="stylesheet">
<%@ page pageEncoding="utf-8"%>

<body>
	<div class="wrap">
		<div class="center_signup">
			<div>
				<h2 class="card-title text-center" style="color:#574F4E;">회원가입</h2>
			</div>
			<div style="margin-left:10px; margin-right:10px;">
	
	      <form action="/signup_process" method="POST">
	        <br><h5>회원 정보를 입력해 주세요</h5>
	        <div class="form-group">
				<label for="inputEmail">사용자명</label>
				<input type="text" id="email" name="email" class="form-control" placeholder="id" required autofocus>
				<table>
				<tr>
				<td><button type="button" class="idcheck">중복확인</button></td>
				<td><p class="result">
				<span class="msg">  사용여부</span>
				</p></td>
				</tr>
				</table>
				</div>
				
	        <div class="form-group">
	        <label for="inputPassword">비밀번호</label>
	        <input type="password" name="password" class="form-control" placeholder="Password" required><br>
	 		</div>
	        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" disabled="disabled">회원가입</button>
	      </form>
	      <a href="login" style="color:#ib95E0" >이미 계정이 있으신가요?</a>
			</div>
		</div>
	</div>
<script>
$('.idcheck').click(function(){
	var query = {email : $("#email").val()};
	$.ajax({
		url : "/idcheck",
		type : "post",
		data: query,
		success : function(data){
			if(data==0){
				$(".result .msg").text("  사용 불가");
			    $(".result .msg").attr("style", "color:#f00");
			    $("#btn-Yes").attr("disabled","disabled");
			}else{
				$(".result .msg").text("  사용 가능");
				$(".result .msg").attr("style", "color:#00f");
				$("#btn-Yes").removeAttr("disabled");
			}
		},
		error:function(){
		alert('에러발생');
		}
	});
});
</script>
</body>