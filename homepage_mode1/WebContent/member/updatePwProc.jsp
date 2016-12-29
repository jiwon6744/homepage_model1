<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	boolean flag = dao.updatePw(id, passwd);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">패스워드 변경 처리</div>
	<div class="content">
		<%
			if (flag) {
				out.print("패스워드 변경을 성공했습니다.<br>");
				out.print("로그인을 해주세요.<br>");
			} else {
				out.print("패스워드 변경을 실패했습니다.");
			}
		%>
	</div>
	<div class='bottom'>
		<%
			if (flag) {
		%>
		<input type='button' value='로그인' class="button" onclick="location.href='./loginForm.jsp'">
		<%
			} else {
		%>
		<input type='button' value='다시시도' class="button" onclick="history.back()">
		<%
			}
		%>
		<input type='button' value='홈' class="button" onclick="location.href='../index.jsp'">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
