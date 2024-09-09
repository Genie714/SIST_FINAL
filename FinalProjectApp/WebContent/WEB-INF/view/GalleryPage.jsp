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
<title>GalleryPage.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">

	img
	{
		display: block;
		width: 1000px;
		height: 1000px;
	}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<script type="text/javascript">

		$(document).ready(function()
		{
			
			$("#back").click(function()
			{
				$(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val());
			});
			
			$(".btn-success").click(function()
			{
				if (confirm("댓글을 등록하시겠습니까?"))
				{
					$(location).attr("href", "gallerycommentinsert.action?group_id=" + $("#group_id").val()
							+ "&moment_id=" + $("#moment_id").val()	 
							+ "&gallery_id=" + $("#gallery_id").val() + "&contents=" + $("#comment").val());
				}
			});
			
			
		});

</script>

</head>
<body>

<div class="panel title">
	<h1>갤러리</h1>
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
						갤러리<span class="sr-only">(current)</span>
					</a>
				</li>
			</ul>
		</div><!-- .collapse .navbar-collapse -->
		
	</div><!-- .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<div class="panel-heading" style="height: 100px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					갤러리 페이지 조회
				</span>
			</div>
						
			<div class="panel-body">
				<form id="myForm">
					<table class="table">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										작성자
									</span>
									<input type="text" id="participant_name" class="form-control" readonly="readonly"
									value="${myGalleryList.participant_name }" style="width: 1000px;">
								</div>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										작성일
									</span>
									<input type="text" id="upload_date" class="form-control" readonly="readonly"
									value="${myGalleryList.upload_date }" style="width: 1000px;">
								</div>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										<%-- <img src="<%=cp %>/images/img/gallery/${myGalleryList.file_settingname}" class="img"> --%>
										<img src="<%=cp %>/images/img/gallery/maru.jpg" class="img">
									</span>
								</div>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="panel-body">
										댓글 
									<span class="badge">${countComment }</span>
								</div>
								
								<div class="panel-body">
									<c:forEach var="comment" items="${commentList }">
									<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										${comment.writer_name }
									</span>
									<input type="text" name="contents" class="form-control" readonly="readonly"
									value="${comment.contents }" style="width: 1000px;">
									</div>
									<div>
										<span>작성일 : ${comment.write_date }</span>
									</div>
									<div>
										<button type="button" class="btn btn-default"
										style="${comment.my_count == 0 ? 'display: none' : 'display: inline'}">삭제</button>
										<button type="button" class="btn btn-danger"
										style="${comment.my_count == 1 ? 'display: none' : 'display: inline'}">신고</button>
									</div>
									<br>
									</c:forEach>
								</div>
								
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										댓글
									</span>
									<textarea rows="5" cols="200" id="comment" class="form-control"
									 style="text-align: left;" maxlength="200"></textarea>
								</div>
								<br>
								<div>
									<button type="button" class="btn btn-success">등록</button>
									<button type="reset" class="btn btn-default">취소</button>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						
						<tr>
							<td style="text-align: center;">
								<button type="button" class="btn btn-default" id="back">목록으로</button>
								<input type="hidden" id="moment_id" name="moment_id" value="${myGalleryList.moment_id }">
								<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
								<input type="hidden" id="gallery_id" value="<%=request.getParameter("gallery_id") %>">
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		
		</div>
	</div>
</div>




</body>
</html>