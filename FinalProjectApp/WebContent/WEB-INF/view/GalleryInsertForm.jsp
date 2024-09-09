<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GalleryInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<script type="text/javascript">

		var countFiles = 1;

		$(document).ready(function()
		{
			$(".btn-success").click(function()
			{
				var files = "";
				
				for (var i = 1; i <= countFiles; i++)
				{
					files += $("#file" + i).val().replace("C:\\fakepath\\", "");
					files += "//";
				}
				
				$(location).attr("href", "galleryinsert.action?group_id=" + $("#group_id").val()
								 + "&moment_id=" + $("#moment_id").val() + "&files=" + files);
			});
			
			
			$("#cancel").click(function()
			{
				$(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val());
			});

		});
		
	    
		function uploadFile()
	    {
	        countFiles++;
	        $("#files").append("<br>" + "<input type='file' id='file" + countFiles + "' accept='image/*'>");
	    }

</script>

</head>
<body>

<div class="panel title">
	<h1>모먼트 생성</h1>
</div>

<!-- 메인 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="group.action">
						모먼트 <span class="sr-only">(current)</span>
					</a>
				</li>
			</ul>
		</div><!-- .collapse .navbar-collapse -->
		
	</div><!-- .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					갤러리 사진 업로드
				</span>
			</div>
			
			<div class="panel-body">
				<form action="galleryinsert.action" method="post" id="myForm">

					<div id="files">
						<input type="file" id="file1" accept="image/*" required="required">
						<br>
						<input type="button" class="btn btn-default" id="file_upload" 
						value="파일 추가 등록" onclick="uploadFile()">
						<br>
					</div>
					
					<br><br>
					<button type="button" class="btn btn-success" id="upload">업로드</button>
					<button type="reset" class="btn btn-default" id="cancel">취소</button>
					<br>
					
					<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
					<input type="hidden" id="moment_id" value="<%=request.getParameter("moment_id") %>">
				</form>
			</div>
		
		</div>
	</div>
</div>




</body>
</html>