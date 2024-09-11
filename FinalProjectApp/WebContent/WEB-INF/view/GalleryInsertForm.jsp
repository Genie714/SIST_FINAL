<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	MultipartRequest multipart = null;
	String file_realname = "";
	String file_settingname = "";
	String result = "";
	
	try
	{
	   String path = "C:\\Final\\SIST_FINAL\\FinalProjectApp\\WebContent\\images\\img\\gallery";    // 학원 컴 디렉터리
	   //String path = "C:\\Final\\FinalProjectApp\\WebContent\\images\\img\\gallery";    //-- 노트북 디렉터리
	   int size = 5 * 1024 * 1024;
	   
	   multipart = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	   
	   for (int i = 0; i < 10; i++)
	   {
		 if (multipart.getOriginalFileName("file" + (i + 1)) == null)
		 {
			 file_realname = file_realname.substring(0, file_realname.length() - 3);
			 file_settingname = file_settingname.substring(0, file_settingname.length() - 3);
			 break;
		 }
	     else
	     {
	    	 file_realname += multipart.getOriginalFileName("file" + (i + 1)) + "///";
	   	 	 file_settingname += multipart.getFilesystemName("file" + (i + 1)) + "///";
	   	 }
	   }
	   
		    result = "galleryinsert.action?settingfiles=" + file_settingname + "&realfiles=" + file_realname + "&path=" + path;
		    
	 } 
	 catch(Exception e) 
	 {
		 System.out.println(e.toString());
	 }

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

		$(document).ready(function()
		{
			$("#submitBtn").click(function()
			{
				if (confirm("게시글을 등록하시겠습니까?"))
				{
					$(location).attr("href", "<%=result %>" + "&group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val()
							+ "&countJoin=" + $("#countJoin").val());
				}
			});
			
			$("#cancelBtn").click(function()
			{
				$(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val()
								+ "&countJoin=" + $("#countJoin").val());
			});

		});
	    
		function uploadFile(num)
	    {
	        $("#file" + num).css("display", "inline");
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
						갤러리 <span class="sr-only">(current)</span>
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
				<span style="color: red;">※ 최대 10장</span>
			</div>
			
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="myForm" name="form">
					<div id="files">
						<input type="file" id="file1" name="file1"
						accept="image/gif, image/jpeg, image/png" required="required" onchange="uploadFile(2)">
						<br>
						<input type="file" id="file2" name="file2" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(3)">
						<br><br>
						<input type="file" id="file3" name="file3" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(4)">
						<br><br>
						<input type="file" id="file4" name="file4" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(5)">
						<br><br>
						<input type="file" id="file5" name="file5" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(6)">
						<br><br>
						<input type="file" id="file6" name="file6" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(7)">
						<br><br>
						<input type="file" id="file7" name="file7" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(8)">
						<br><br>
						<input type="file" id="file8" name="file8" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(9)">
						<br><br>
						<input type="file" id="file9" name="file9" style="display: none;"
						accept="image/gif, image/jpeg, image/png" onchange="uploadFile(10)">
						<br><br>
						<button type="submit" class="btn btn-success" id="upload">사진 업로드</button>
						<input type="file" id="file10" name="file10" style="display: none;"
						accept="image/gif, image/jpeg, image/png">
					</div>
					
					<br><br>
					<button type="button" class="btn btn-success" id="submitBtn">작성</button>
					<button type="reset" class="btn btn-default" id="cancelBtn">취소</button>
					<br>
					
					<input type="hidden" id="group_id" name="group_id" value="<%=request.getParameter("group_id") %>">
					<input type="hidden" id="moment_id" name="moment_id" value="<%=request.getParameter("moment_id") %>">
					<input type="hidden" id="participant_id" name="participant_id" value="<%=request.getParameter("participant_id") %>">
					<input type="hidden" id="countJoin" value="${countJoin }">
				</form>
			</div>
		
		</div>
	</div>
</div>




</body>
</html>