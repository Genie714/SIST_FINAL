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
<title>MemberInsertForm.jsp</title>
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
			$("#birth_date").datepicker(
			{
				dateFormat : "yy-mm-dd"
				, changeYear : true
				, changeMonth : true
				, maxDate : 0
			});
			
			$("#my_id").change(function()
			{
				$("#idError1").css("display", "none");
				$("#idError2").css("display", "none");
				$("#idError3").css("display", "none");
				
				var my_id = $("#my_id").val();
				
				if (my_id)
				{
					
				}
				
				if (my_id.length < 6)
				{
					$("#idError2").css("display", "inline");
					return;
				}
			});
			
			$(".btn-success").click(function()
			{
								
			});
			
		});
		

</script>

</head>
<body>

<div class="panel title">
	<h1>회원가입</h1>
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
					<a href="#">
						어플리케이션 <span class="sr-only">(current)</span>
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
					회원 정보 입력
				</span>
			</div>
			
			<div class="panel-body">
				<form action="memberinsert.action" method="post" id="myForm">
					<table class="table">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										아이디
									</span>
									<input type="text" id="my_id" name="my_id" class="form-control"
									placeholder="아이디" maxlength="12" required="required">
									<span class="input-group-addon">6 ~ 12자 / 영어, 숫자 사용 가능</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="display: none;"id="idError1">
								<span style="font-size: small; color: red;">※ 이미 존재하는 아이디입니다.</span>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="idError2" >
								<span style="font-size: small; color: red;">※ 6자 이상 입력해야 합니다.</span>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="idError3">
								<span style="font-size: small; color: red;">※ 사용 불가능한 문자입니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										비밀번호
									</span>
									<input type="password" id="pw" name="pw" class="form-control"
									placeholder="비밀번호" maxlength="16" required="required">
									<span class="input-group-addon">8 ~ 16자 / 영어, 숫자 필수(특수문자 사용 가능) </span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="pwError1">
								<span style="font-size: small; color: red;">※ 8자 이상 입력해야 합니다.</span>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="pwError2">
								<span style="font-size: small; color: red;">※ 사용 불가능한 문자입니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										닉네임
									</span>
									<input type="text" id="user_name" name="user_name" class="form-control"
									placeholder="닉네임" maxlength="30" required="required">
									<span class="input-group-addon">2 ~ 30자 / 중복 불가</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="nameError1">
								<span style="font-size: small; color: red;">※ 2자 이상 입력해야 합니다.</span>
							</td>
						</tr>
						<tr>
							<td style="display: none;" id="nameError2">
								<span style="font-size: small; color: red;">※ 이미 존재하는 닉네임입니다.</span>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										생년월일
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="birth_date" name="birth_date" placeholder="생년월일">
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										성별
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="male" name="gender" value="1" checked="checked" class="gender">
								<label for="male" style="font-size: 14px;">남성</label>
								<input type="radio" id="female" name="gender" value="2" class="gender">
								<label for="female" style="font-size: 14px;">여성</label>
							</td>							
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										비밀번호 찾기 질문 / 답변
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<select id="question" name="question">
									<c:forEach var="find" items="${findList }">
										<option value="${find.find_id }">
											${find.question }
										</option>
									</c:forEach>
								</select>
								<input type="text" id="answer" name="answer" class="form-control"
									placeholder="답변" maxlength="200" required="required">
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center;">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="reset" class="btn btn-default">취소</button>
								<br>
							</td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		
		</div>
	</div>
</div>




</body>
</html>