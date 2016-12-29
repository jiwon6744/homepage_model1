<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String upDir = application.getRealPath("/member/storage");
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");

	boolean flag = dao.delete(id);
	if (flag) {
		UploadSave.deleteFile(upDir, oldfile);
		session.invalidate();
		//20분정도 기본적으로 연결되어있는데 그 session을 끊는 역할을 한다.
	}
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
	<div class="content">
		<%
			if (flag) {
				out.print("탈퇴 성공");
			}else{
				out.print("탈퇴 실패");
			}
		%>
	</div>
	<div class='bottom'>
		<input type='button' value='홈' class="button" onclick="location.href='../index.jsp'">
		<input type='button' value='다시시도' class="button" onclick="history.back()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
