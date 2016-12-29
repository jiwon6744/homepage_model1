<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<%-- <jsp:setProperty property="*" name="dto" /> --%>
<!-- 업로드라서 지워야함. 의미가 없음. -->
<%
	String upDir = application.getRealPath("/bbs/storage");
	String tempDir = application.getRealPath("/bbs/teamp");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	//페이징과 검색을 위한 값(code)
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word")); // 한글을 받아올때는 한글처리를 해줘야한다.
	String nowPage = upload.getParameter("nowPage");
	//답변을 위한 부모의 값
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
	//부모글삭제를 제한하기 위해서 
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	//form의 입력된 값가져오기
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	//filename 가져오기
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = null;
	if(filesize>0){
		filename = UploadSave.saveFile(fileItem, upDir); // 파일을 추출한다.
	}
	dto.setFilename(filename);
	dto.setFilesize(filesize);

	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	bdao.upAnsnum(map);
	boolean flag = bdao.createReply(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
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
	<div class="title">게시판 처리 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("답변글이 등록되었습니다.");
			} else {
				out.print("답변글 등록이 실패헀습니다.");
			}
		%>
		<div class="bottom">
			<input type="button" value="계속 등록" class="button" onclick="location.href='./createForm.jsp'" /> 
			<input type="button" value="목록" class="button" onclick="blist()" />
		</div>
	</div>




	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
