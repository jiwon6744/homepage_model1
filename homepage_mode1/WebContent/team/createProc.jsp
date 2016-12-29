<%@ include file="/ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dto" class="team.TeamDTO" />
<%-- <jsp:setProperty property="*" name="dto" /> --%>
<%
	String upDir = application.getRealPath("/team/storage");
	String tempDir = application.getRealPath("/team/temp");
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	//form의 값 가져옵니다.
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setGender(UploadSave.encode(upload.getParameter("gender")));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setHobby(UploadSave.encode(upload.getParameter("hobby")));
	dto.setSkill(upload.getParameterValues("skill"));
	
	//filename 가져오기
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir);
	}else
		filename = "member.jpg";
	
	dto.setFilename(filename);

	//  구버전 filename 가져오기
// 	if (filename == null || filename.length() == 0)
// 		dto.setFilename("member.jpg");

	boolean flag = tdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tcreateForm() {
	var url = "createForm.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
function tlist() {
	var url = "list.jsp";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">팀 등록 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("팀 정보 등록 성공!!");
			} else {
				out.print("팀 정보 등록 성공!!");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="계속 등록" onclick="tcreateForm()"> <input type="button" class="button" value="목록" onclick="tlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
