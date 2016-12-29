<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String id = request.getParameter("id");
	String grade = (String)session.getAttribute("grade");
	
	if (id == null) {
		id = (String)session.getAttribute("id");
	}
	MemberDTO dto = dao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function updateFile() {
		var url = "updateFileForm.jsp";
		url += "?id=<%=id%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	function updatePw(){
		var url = "updatePwForm.jsp";
		url += "?id=<%=id%>";
		location.href = url;
	}
	function update() {
		var url = "updateForm.jsp";
		url += "?id=<%=id%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;

	}
	function mlist() {
		var url = "<%=root%>/admin/list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mdelete() {
		var url = "<%=root%>/member/deleteForm.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title"><%=dto.getMname()%>의 회원 정보
	</div>

	<table>
		<tr>
			<td colspan="2" class="img-c img30">
				<img src="./storage/<%=dto.getFname()%>" class="img-center">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getMname()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<th>우편주소</th>
			<td><%=dto.getZipcode()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress1()%><%=Utility.checkNull(dto.getAddress2())%></td>
		</tr>
		<tr>
			<th>직업</th>
			<td>
				직업코드:<%=dto.getJob()%>(<%=Utility.getCodeValue(dto.getJob())%>)
			</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=dto.getMdate()%></td>
		</tr>
	</table>

	<div class='bottom'>
		<%if(id!=null && grade.equals("A")) {%>
		<input type='button' value='정보수정' class="button" onclick="update()">
		<input type='button' value='회원목록' class="button" onclick="mlist()">
		<%}else{ %>
		<input type='button' value='정보수정' class="button" onclick="update()">
		<input type='button' value='사진수정' class="button" onclick="updateFile()">
		<input type='button' value='패스워드 변경' class="button" onclick="updatePw()">
		<input type='button' value='다운로드' class="button" onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">
		<%} %> 
		<input type='button' value='회원탈퇴' class="button" onclick="mdelete()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
