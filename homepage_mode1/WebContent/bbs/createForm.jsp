<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-size: 20px;
}
</style>
<script type="text/javascript">
	function input(frm) {
		if (frm.wname.value == "" && frm.title.value == ""
				&& frm.content.value == "" && frm.passwd.value == "") {
			alert("성명, 제목, 내용, 비밀번호를 입력해주세요.");
			frm.wname.focus();
			return false;
		} else if (frm.wname.value == "") {
			alert("이름을 입력해주세요.");
			frm.wname.focus();
			return false;
		} else if (frm.title.value == "") {
			alert("제목을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.content.value == "") {
			alert("내용을 입력해주세요.");
			frm.content.focus();
			return false;
		} else if (frm.passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.passwd.focus();
			return false;
		}

	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">게시판 등록</div>

	<form name='frm' 
		  method='POST' 
		  action='./createProc.jsp' 
		  enctype="multipart/form-data" 
		  onsubmit="return input(this)">
		  
		<table>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="wname">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th>파일명</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='등록' class="button"> <input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
