<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function inCheck(f) {
		if(f.passwd.value==""){
			alert("패스워드를 입력하세요.");
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value==""){
			alert("패스워드 확인을 입력하세요.");
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value != f.repasswd.value){
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
			f.passwd.focus();
			return false;
		}
	}
</script>
<style type="text/css">
* {
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">패스워드 변경</div>

	<form name='frm' method='POST' action='./updatePwProc.jsp' onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="<%=id%>">
		<table>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td>
					<input type="password" name="repasswd">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='패스워드 수정' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
