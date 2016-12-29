<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;

	if (size > 0) {
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	boolean flag = dao.updateFile(id, fname);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read() {
	var url = "read.jsp";
	url += "?id=<%=id%>";

		location.href = url;

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

	<div class="title">사진변경</div>
	<div class="content">
		<%
			if (flag) {
				out.print("사진을 변경하였습니다.");
			} else {
				out.print("사진변경을 실패했습니다.");
			}
		%>
	</div>
	<div class='bottom'>
		<%
			if (flag) {
		%>
		<input type='submit' value='나의정보' class="button" onclick="read()">
		<%
			} else {
		%>
		<input type='button' value='다시시도' class="button" onclick="history.back()">
		<%
			}
		%>
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
