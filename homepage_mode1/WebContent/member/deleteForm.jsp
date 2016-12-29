<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}
	String oldfile = dao.getFname(id);
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

	<div class="title">회원 탈퇴</div>

	<form name='frm' method='POST' action='./deleteProc.jsp'>
	<input type="hidden" name="id" value="<%=id %>">
	<input type="hidden" name="oldfile" value="<%=oldfile %>">
	<div class="content">
	탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
	그래도 탈퇴를 원하신다면 아래 탈퇴 버튼을 눌러주세요.<br>
	</div>
		<div class='bottom'>
			<input type='submit' value='탈퇴' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
