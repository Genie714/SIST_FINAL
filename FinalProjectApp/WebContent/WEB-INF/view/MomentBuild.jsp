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
<title>MomentBuild.jsp</title>
<style type="text/css">
	#surveyFrom table, th, td
	{
		border: 1px solid gray;
		border-collapse: collapse;	
	}
</style>

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
			if ($("#countJoin").val() < 1)
			{
				$(".btn-info").css("display", "none");
			}
			
			if ($("#moment_name_survey_id").val() > 0)
			{
				$("#cr_moment_name").css("display", "none");
				result = createMoment_nameSurvey();
				document.getElementById("result_moment_name").innerHTML = result;
			}
			
			if ($("#date_name_survey_id").val() > 0)
			{
				$("#cr_date_name").css("display", "none");
				result = createDate_nameSurvey();
				document.getElementById("result_date_name").innerHTML = result;
			}
			
			if ($("#place_name_survey_id").val() > 0)
			{
				$("#cr_place_name").css("display", "none");
				result = createPlace_nameSurvey();
				document.getElementById("result_place_name").innerHTML = result;
			}
			
			if ($("#min_participant_survey_id").val() > 0)
			{
				$("#cr_min_participant").css("display", "none");
				result = createMin_participantSurvey();
				document.getElementById("result_min_participant").innerHTML = result;
			}
			
			if ($("#max_participant_survey_id").val() > 0)
			{
				$("#cr_max_participant").css("display", "none");
				result = createMax_participantSurvey();
				document.getElementById("result_max_participant").innerHTML = result;
			}
			
			if ($("#note_survey_id").val() > 0)
			{
				$("#cr_note").css("display", "none");
				result = createNoteSurvey();
				document.getElementById("result_note").innerHTML = result;
			}
			
			$(".btn-success").click(function()
			{
				if ($(this).val() < 1)
				{
					if (parseInt($("#max_participant").val()) >= parseInt($("#parti_num").val()))
					{
						alert("이미 최대인원이 채워졌습니다. 참여가 불가능합니다.");
						return;
					}
					
					if (confirm("해당 모먼트에 참여하시겠습니까?"))
					{
						$("#myForm").submit();
					}
				}
				else
				{
					if (confirm("해당 모먼트의 참여를 취소하시겠습니까?"))
					{
						location.href = "momentbuildcancel.action?moment_id=" + $("#moment_id").val();
					}
				}
			});
			
			$("#cr_moment_name").click(function()
			{
				if (confirm("모먼트명 설문을 생성하시겠습니까?"))
				{
					result = createMoment_nameSurvey();
					document.getElementById("result_moment_name").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_date_name").click(function()	//-- datepicker 써서 수정, 안 되는 날짜도 추가해야 함
			{
				if (confirm("일시 설문을 생성하시겠습니까?"))
				{
					result = createDate_nameSurvey();
					document.getElementById("result_date_name").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_place_name").click(function()
			{
				if (confirm("장소 설문을 생성하시겠습니까?"))
				{
					result = createPlace_nameSurvey();
					document.getElementById("result_place_name").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_min_participant").click(function()
			{
				if (confirm("최소 인원 설문을 생성하시겠습니까?"))
				{
					result = createMin_participantSurvey();
					document.getElementById("result_min_participant").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}

			});
		
			$("#cr_max_participant").click(function()
			{
				if (confirm("최대 인원 설문을 생성하시겠습니까?"))
				{
					result = createMax_participantSurvey();
					document.getElementById("result_max_participant").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_note").click(function()
			{
				if (confirm("참고사항 설문을 생성하시겠습니까?"))
				{
					result = createNoteSurvey();
					document.getElementById("result_note").innerHTML = result;
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}

			});
						
			$(".btn-default").click(function()
			{
				$(location).attr("href", "group.action");
			});

			
		});
		
		function createMoment_nameSurvey()
		{
			result = "<td><input type='text' id='sv_moment_name' name='sv_moment_name' class='form-control'";
			result += "placeholder='모먼트명' maxlength='30' style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-info' id='sm_moment_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}
		
		function createDate_nameSurvey()
		{
			result = "<td><input type='text' id='sv_date_name' name='sv_date_name' class='form-control'";
			result += "style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-info' id='sm_date_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}
		
		function createPlace_nameSurvey()
		{
			result = "<td><input type='text' id='sv_place_name' name='sv_place_name' class='form-control'";
			result += "placeholder='장소' style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-info' id='sm_place_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}
		
		function createMin_participantSurvey()
		{
			result = "<td><input type='text' id='sv_min_participant' name='sv_min_participant' class='form-control'";
			result += "placeholder='ex) 2' maxlength='30' style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-info' id='sm_min_participant'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}
		
		function createMax_participantSurvey()
		{
			result = "<td><input type='text' id='sv_max_participant' name='sv_max_participant' class='form-control'";
			result += "placeholder='ex) 5' maxlength='30' style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-info' id='sm_max_participant'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}
		
		function createNoteSurvey()
		{
			result = "<td><textarea id='note' name='note' class='form-control' cols='101' rows='10'";
			result += "placeholder='ex) 노트북 챙겨와!' maxlength='200'";
			result += "style='text-align: left; width: 970px; resize: none;'></textarea>";
			result += "<br><button type='button' class='btn btn-info' id='sm_note'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;'>제출</button></td>";
			
			return result;
		}

</script>

</head>
<body>

<div class="panel title">
	<h1>모먼트</h1>
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
						모먼트<span class="sr-only">(current)</span>
					</a>
				</li>
			</ul>
		</div><!-- .collapse .navbar-collapse -->
		
	</div><!-- .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<div class="panel-heading" style="height: 120px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					모먼트 빌드 조회
				<p></p>
				<p style="font-size: small; color: blue;">▷ 현재 ${dto.parti_num }명이 참여 중인 모먼트입니다.<br>
					<b style="font-size: small; color: purple;">&nbsp &nbsp &nbsp 빌드 마감 : ${dto.plan_end_date}</b>
				</p>
				<input type="hidden" id="parti_num" value="${dto.parti_num }">
				</span>
			</div>
			
			<div style="${countDate > 0  && countJoin < 1 ? 'display: inline;' : 'display: none;' }">
				<span style="color: red; font-weight: bold;">해당 모먼트의 일시에 이미 일정이 존재합니다.<br>
				신중하게 참여를 결정해주세요.</span>
			</div>
			
			<div class="panel-body">
				<form action="momentoperjoin.action" method="post" id="myForm">
					<table class="table">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										모먼트명
									</span>
									<input type="text" id="moment_name" name="moment_name" class="form-control" readonly="readonly"
									value="${dto.moment_name }" style="width: 870px;">
									&nbsp;&nbsp;&nbsp; 
									<button type="button" class="btn btn-info" id="cr_moment_name"
									style="font-size: 12pt; font-weight: bold; height: 35px;" value="ST01">설문 생성</button>
									<input type="hidden" id="moment_name_survey_id" class="survey_id" value="${countSurvey[0] }">
								</div>
							</td>
						</tr>
						<tr id="result_moment_name">
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										일시
									</span>
									<input type="text" id="date_name" name="date_name" class="form-control" readonly="readonly"
									value="${dto.date_name }" style="width: 870px;">
									&nbsp&nbsp&nbsp 
									<button type="button" class="btn btn-info" id="cr_date_name"
									style="font-size: 12pt; font-weight: bold; height: 35px;" value="ST02">설문 생성</button>
									<input type="hidden" id="date_name_survey_id" class="survey_id" value="${countSurvey[1] }">
								</div>
							</td>
						</tr>
						<tr id="result_date_name">
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										장소
									</span>
									<input type="text" id="place_name" name="place_name" class="form-control" readonly="readonly"
									value="${dto.place_name }" style="width: 870px;">
									&nbsp&nbsp&nbsp 
									<button type="button" class="btn btn-info" id="cr_place_name"
									style="font-size: 12pt; font-weight: bold; height: 35px;" value="ST03">설문 생성</button>
									<input type="hidden" id="place_name_survey_id" class="survey_id" value="${countSurvey[2] }">
								</div>
							</td>
						</tr>
						<tr id="result_place_name">
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										최소 인원
									</span>
									<input type="text" id="min_participant" name="min_participant" class="form-control" readonly="readonly"
									value="${dto.min_participant }" style="width: 870px;">
									&nbsp&nbsp&nbsp 
									<button type="button" class="btn btn-info" id="cr_min_participant"
									style="font-size: 12pt; font-weight: bold; height: 35px;" value="ST04">설문 생성</button>
									<input type="hidden" id="min_participant_survey_id" class="survey_id" value="${countSurvey[3] }">
								</div>
							</td>
						</tr>
						<tr id="result_min_participant">
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										최대 인원
									</span>
									<input type="text" id="max_participant" name="max_participant" class="form-control" readonly="readonly"
									value="${dto.max_participant }" style="width: 870px;">
									&nbsp&nbsp&nbsp 
									<button type="button" class="btn btn-info" id="cr_max_participant"
									style="font-size: 12pt; font-weight: bold; height: 35px;" value="ST05">설문 생성</button>
									<input type="hidden" id="max_participant_survey_id" class="survey_id" value="${countSurvey[4] }">
								</div>
							</td>
						</tr>
						<tr id="result_max_participant">
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px; font-weight: bold;">
										참고사항
									</span>
									<textarea rows="10" cols="101" id="note" name="note" class="form-control"
									 readonly="readonly" style="text-align: left; width: 870px; resize: none;">
									${dto.note }
									</textarea>&nbsp&nbsp&nbsp 
									<button type="button" class="btn btn-info" id="cr_note"
									style="font-size: 12pt; font-weight: bold; height: 216px;" value="ST06">설문 생성</button>
									<input type="hidden" id="note_survey_id" class="survey_id" value="${countSurvey[5] }">
								</div>
							</td>
						</tr>
						<tr id="result_note">
						</tr>
						
						<tr style="height: 30px;">
						</tr>
						
						<tr>
							<td style="text-align: center;">
								<button type="button" id="countJoin" class="btn btn-success" value="${countJoin }">
								${countJoin > 0 ? "참여 취소" : "참여" }</button>
								<button type="button" class="btn btn-default">목록으로</button>
								<input type="hidden" id="moment_id" name="moment_id" value="${dto.moment_id }">
								<input type="hidden" id="phase" name="phase" value="${dto.phase }">
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