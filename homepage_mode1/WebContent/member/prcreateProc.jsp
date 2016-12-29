<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String upDir = "/member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	//upload 빈즈를 생성한다.
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	//form의 값을 받는다.
	String id = UploadSave.encode(upload.getParameter("id"));
	String email = upload.getParameter("email");
	String str = "";

	if (dao.duplicateId(id)) {
		str = "중복된 아이디 입니다. 다시 입력해주세요.";
	} else if (dao.duplicateEmail(email)) {
		str = "중복된 이메일 입니다. 다시 입력해주세요.";
	} else {
		request.setAttribute("upload", upload);
%>
<jsp:forward page="/member/createProc.jsp" />
<%
	return;
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

	<div class="title">아이디 및 이메일 중복 확인.</div>
	<div class="content">
		<%=str%>
	</div>
	<div class='bottom'>
		<input type='button' value='다시시도' class="button" 7onclick="history.back()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
