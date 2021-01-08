<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<c:set var="gubun" value="${gubun}" />

<div class="toast_add" role="alert" aria-live="assertive" aria-atomic="true" data-delay="10000">
  <div class="toast-header">
    <img src="..." class="rounded mr-2" alt="...">
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    정상적으로 추가되었습니다. 
  </div>
</div>

<div class="toast_edit" role="alert" aria-live="assertive" aria-atomic="true" data-delay="10000">
  <div class="toast-header">
    <img src="..." class="rounded mr-2" alt="...">
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    정상적으로 수정되었습니다.
  </div>
</div>


<a href="/board_list">게시판 목록으로...</a>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link href="resources/css/toastr.css" rel="stylesheet">
<script src="resources/js/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>		
<%/* 
<script>
	$(document).ready(function(){
		var gubun = '<c:out value="${gubun}" />';
		//alert(gubun);
		if(gubun.equals("boardAdd")) {
			$('.toast_add').toast('show');
		}
		else if(gubun.equals("boardEdit")) {
			$('.toast_edit').toast('show');
		}
	});
</script>
*/ %>
<script>
	$(document).ready(function process(gubun){
		var gubun = '<c:out value="${gubun}" />';
		if(gubun == "boardAdd") {
			$('#boardAdd').toast('show');
		}
		else if(gubun == "boardEdit") {
			$('#boardEdit').toast('show');
		}
			    
	});
</script>

<script>
toastr.options = {
		  "closeButton": true,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
</script>