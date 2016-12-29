<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	//검색end
	//페이징 관련------------------------------------------------
	int nowPage = 1; // 현재 보고 있는 페이지
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수 나중에는 Constant 같은 클래스를 만들어서 상수를 한번에 관리 하도록 하자.

	// 	DB에서 가져올 순번------------------------------------------
	int sno = (nowPage - 1) * recordPerPage + 1;
	int eno = nowPage * recordPerPage;

	//검색에 대한 데이터를 리스트에가서 뽑아와야함.
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	int total = bdao.total(col, word);
	List<BbsDTO> list = bdao.list(map);
	Iterator<BbsDTO> iter = list.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(bbsno) {
		var url = "read.jsp";
		url += "?bbsno=" + bbsno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function down(filename) {
		var url = "<%=root%>/download";
		url += "?dir=/bbs/storage";
		url += "&filename=" + filename;
		location.href = url;
	}
	function create() {
		var url = "<%=root%>/bbs/createForm.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url; // url 이동하라
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<div class="title">게시판 목록</div>

	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="wname"
					<%if (col.equals("wname"))
				out.print("selected='selected'");%>>성명</option>
				<option value="title"
					<%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
				<option value="cotent"
					<%if (col.equals("cotent"))
				out.print("selected='selected'");%>>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>" />
			<!-- 검색어 -->
			<input type="submit" class="button_mini" value="검색" />
			<input type="button" class="button_mini" value="등록" onclick="create()"/>
		</form>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>성명</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>파일명</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="8" class="text-c">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {
				while (iter.hasNext()) {
					BbsDTO dto = iter.next();
		%>
		<tr>
			<td class="text-c"><%=dto.getBbsno()%></td>
			<td>
				<%
					for (int i = 0; i < dto.getIndent(); i++) {
								out.print("&nbsp;&nbsp;");
							}
							if (dto.getIndent() > 0) {
				%><img src="<%=root%>/menu/images/reply-back.png" class="img10">
				<%
					}
				%> <a href="javascript:read('<%=dto.getBbsno()%>')"> <%=dto.getTitle()%>
			</a> <%
 	if (Utility.compareDay(dto.getWdate().substring(0, 10))) {
 %> <img src="../menu/images/new.gif"> <%
 	}
 %>
			</td>
			<!-- onclick은 javascript를 생략해도 되지만 a태그같은 경우에는 javascript라고 명시를 해야합니다. -->
			<td class="text-c"><%=dto.getWname()%></td>
			<td class="text-c"><%=dto.getViewcnt()%></td>
			<td class="text-c"><%=dto.getWdate().substring(0, 10)%></td>
			<td class="img-c">
				<%
					if (dto.getFilename() == null) {
								out.print("파일없음");
							} else {
				%> <a href="javascript:down('<%=dto.getFilename()%>')"><img src="../menu/images/down.png" >
			</a> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>

	<div class='bottom'>
		<!-- 		<input type='button' value='등록' class="button" onclick="location.href='./createForm.jsp'"> -->
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
