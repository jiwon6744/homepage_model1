<%@ page contentType="text/html; charset=UTF-8"%>
<!-- DB를 이용하기 위한 코드 한줄 -->
<%@ include file="/ssi/ssi.jsp"%>
<!-- 객체 생성을 위한 한줄 -->
<jsp:useBean id="dto" class="member.MemberDTO" />
<%
	String upDir = "/member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	//upload 빈즈를 생성한다.
	UploadSave upload = (UploadSave)request.getAttribute("upload");

	//form의 값을 받는다.
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setJob(upload.getParameter("job"));

	//form의 선택한 파일 받기
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	if (size > 0) {
		//파일이 있으면 파일을 저장한다.
		fname = UploadSave.saveFile(fileItem, upDir);
	} else {
		//업로드를 안하면 기본사진을 넣어준다.
		fname = "member.jpg";
	}
	// fname 에 저장한 데이터를 dto에 set한다.
	dto.setFname(fname);

	boolean flag = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
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

	<div class="title">회원가입 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.print("회원가입을 했습니다.");
			} else {
				out.print("회원가입에 실패했습니다.");
			}
		%>
	</div>
	<%
		if (flag) {//로그인성공시
	%>
	<div class='bottom'>
		<input type='button' value='로그인' class="button" onclick="location.href='loginForm.jsp'"> <input type='button' value='HOME' class="button" onclick="location.href='../index.jsp'">
	</div>
	<%
		} else {//로그인실패시
	%>
	<div class='bottom'>
		<input type='button' value='다시시도' class="button" onclick="location.href='history.back()'"> <input type='button' value='HOME' class="button" onclick="location.href='../index.jsp'">
	</div>
	<%
		}
	%>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
