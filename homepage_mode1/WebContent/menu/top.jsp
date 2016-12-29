<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>

<html>
<head>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<!-- 상단 메뉴 -->
	<div>
		<table class="table">
			<tr>
				<td class="td">
					<img src="<%=root%>/menu/images/main02.jpg" class="img">
					<!-- main02번이였음 -->
				</td>
			</tr>
			<tr class="text-c">
				<td class="td text-c">
					<ul id="menu" class="text-c">
						<li><a href="<%=root%>/index.jsp#footer">홈</a></li>
						<%
							if (id == null) {
						%>
						<li><a href="<%=root%>/member/agreement.jsp#footer">회원가입</a></li>
						<li><a href="<%=root%>/member/loginForm.jsp#footer">로그인</a></li>
						<%
							} else if(id != null && grade.equals("H")){
						%>
						<li><a href="<%=root%>/member/read.jsp#footer">나의정보</a></li>
<%-- 						<li><a href="<%=root%>/member/updateForm.jsp">회원수정</a></li> --%>
<%-- 						<li><a href="<%=root%>/member/deleteForm.jsp">회원탈퇴</a></li> --%>
						<li><a href="<%=root%>/member/logout.jsp#footer">로그아웃</a></li>
						<%
							}
						%>
						<li><a href="<%=root%>/memo/list.jsp#footer">메모목록</a></li>
<%-- 						<li><a href="<%=root%>/memo/createForm.jsp">메모생성</a></li> --%>
						<li><a href="<%=root%>/bbs/list.jsp#footer">게시판목록</a></li>
<%-- 						<li><a href="<%=root%>/bbs/createForm.jsp">게시판생성</a></li> --%>
<%-- 						<li><a href="<%=root%>/team/list.jsp">팀목록</a></li> --%>
<%-- 						<li><a href="<%=root%>/team/createForm.jsp">팀생성</a></li> --%>
						<li><a href="<%=root%>/imgbbs/list.jsp#footer">이미지목록</a></li>
<%-- 						<li><a href="<%=root%>/imgbbs/createForm.jsp">이미지생성</a></li> --%>
						<%
							if (id != null && grade.equals("A")) {
						%>
						<li id="admin"><a href="<%=root%>/member/logout.jsp#footer">로그아웃</a></li>
						<li id="admin"><a href="<%=root%>/admin/list.jsp#footer">회원목록</a></li>
						<%
							}
						%>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<!-- 상단 메뉴 끝 -->

	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">