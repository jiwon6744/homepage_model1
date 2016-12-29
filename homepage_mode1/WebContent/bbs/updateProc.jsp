<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<%-- <jsp:setProperty property="*" name="dto" /> 사용하지 못함 --%>
<%
	
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";
	
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);

	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno"))); // 정수 변환
	dto.setWname(UploadSave.encode(upload.getParameter("wname"))); // 한글 처리
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename"); // 선택한 파일을 받아온다.
	int filesize = (int)fileItem.getSize(); // 사이즈를 구한다
	String filename = null;
	if(filesize>0){ // 새로운 파일을 업로드했다.
		UploadSave.deleteFile(upDir, oldfile);//기존파일을 삭제
		filename = UploadSave.saveFile(fileItem, upDir); // 순수 파일명만 저장
	}
	dto.setFilesize(filesize);
	dto.setFilename(filename);

	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
	boolean pflag = bdao.passCheck(map);
	// 패스워드 체크하는 부분.
	
	boolean flag = false;
	if (pflag) {
		flag = bdao.update(dto);
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
<script type="text/javascript">
	function blist() {

		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;

	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">게시판 수정 결과</div>

	<div class="content">
		<%
			if (pflag == false) {
				out.print("패스워드가 일치하지 않습니다.");
			} else if (flag) {
				out.print("글을 수정했습니다.");
			} else
				out.print("글 수정을 실패했습니다.");
		%>

		<%
			if (pflag == false) {
		%>
	</div>
	<div class='bottom'>
		<input type='button' value='다시 시도' class="button" onclick="history.back()"> <input type='button' value='목록' class="button" onclick="blist()">
	</div>
	<%
		} else {
	%>
	<div class='bottom'>
		<input type='button' value='다시 등록' class="button" onclick="location.href='createForm.jsp'"> <input type='button' value='목록' class="button" onclick="blist()">
	</div>
	<%
		}
	%>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
