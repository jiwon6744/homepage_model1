<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<!-- useBean은 객체생성이다. setter 호출하려고 선언함.  -->
<%-- <jsp:setProperty property="*" name="dto" /> --%>
<!-- form 에서 보내는 값들을 request Parameter -->
<%
	//--업로드용 변수선언(폴더명) 실제폴더 존재해야함
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";

	//--절대경로 생성
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;
	if (size > 0)
		filename = UploadSave.saveFile(fileItem, upDir);
	dto.setFilesize(size);
	dto.setFilename(filename);

	boolean flag = bdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
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
	<div class="title">게시판 등록 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("글이 등록되었습니다.");
			} else {
				out.print("글 등록이 실패헀습니다.");
			}
		%>
		<div class="bottom">
			<input type="button" value="계속 등록" class="button" onclick="location.href='./createForm.jsp'" /> <input type="button" value="목록" class="button" onclick="blist()" />
		</div>
	</div>




	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
