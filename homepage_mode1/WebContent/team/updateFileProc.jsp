<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String upDir = application.getRealPath("/team/storage");
	String tempDir = application.getRealPath("/team/temp");
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String nowPage = upload.getParameter("nowPage");
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	int teamno = Integer.parseInt(upload.getParameter("teamno"));

	//수정할 사진 받기
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;
	if (size > 0) {
		UploadSave.deleteFile(upDir, oldfile); // 원래 파일이 있다면 삭제하라
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	Map map = new HashMap();
	map.put("teamno", teamno);
	map.put("filename", filename);

	boolean flag = tdao.updateFile(map);
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

	function tread() {
		var url = "read.jsp";
		url += "?teamno=<%=teamno%>";
		url += "&nowPage=<%=nowPage%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		
		location.href = url;
	}
</script>
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
				out.print("사진 변경 성공!!");
			} else {
				out.print("사진 변경 실패!!");
			}
		%>

	</div>
	<div class='bottom'>
		<input type='button' value='조회' onclick="tread()"> <input type='button' value='다시시도' onclick="history.back()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
