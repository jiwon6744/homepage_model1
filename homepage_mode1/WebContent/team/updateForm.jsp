<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	TeamDTO dto = tdao.read(teamno);
	String skill = dto.getSkillstr();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function tlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
			location.href = url;
		}
	function input(f) {
		if (f.phone.value == "") {
			alert("전화번호를 입력하세요.");
			f.phone.focus();
			return false;
		}
		if (f.zipcode.value == "") {
			alert("우편번호를 입력하세요.");
			f.zipcode.focus();
			return false;
		}
		if (f.address1.value == "") {
			alert("주소를 입력해주세요.");
			f.address1.focus();
			return false;
		}
		if (f.address2.value == "") {
			alert("상세주소를 입력해주세요.");
			f.address2.focus();
			return false;
		}
		var cnt = 0;
		for (var i = 0; i < f.skill.length; i++) {
			if (f.skill[i].checked) {
				cnt += 1;
			}
		}
		if (cnt == 0) {
			alert("보유기술을 체크하세요.");
			f.skill[0].focus();
			return false;
		}
		if (f.hobby.selectedIndex == 0) { // 셀렉트박스에서 0번째를 선택했다면 --> 0번재는 취미를 선택해주세요.(아무것도아닌값);
			alert("취미를 선택하세요.");
			f.hobby.focus();
			return false;
		}
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
		<div class="title">팀 정보 수정</div>
		<form name="frm" action="./updateProc.jsp" method="POST" onsubmit="return input(this)">

			<input type="hidden" name="no" value="<%=teamno%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>"> 
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
			<table>
				<tr>
					<th colspan="2">
						<div>
							<img src="./storage/<%=dto.getFilename()%>">
						</div>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=dto.getName()%></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><%=dto.getGender()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" value="<%=dto.getPhone()%>">
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
						<input type="text" name="zipcode" size="7" maxlength="5" id="sample6_postcode" value="<%=dto.getZipcode()%>"> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기 "><br>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<br> <input type="text" name="address1" size="45" id="sample6_address" value="<%=dto.getAddress1()%>"> <br> <input type="text" name="address2" size="45" id="sample6_address2" value="<%=dto.getAddress2()%>"><br>
					</td>
				</tr>
				<tr>
					<th>보유기술</th>
					<td>
						<label for="s1"><input id="s1" type="checkbox" name="skill" value="Java" <%if (skill.indexOf("java") != -1) {%> checked <%}%>>Java</label>
						<!-- indexOf는 int형으로 ("")안에 있는 값이 있는 위치를 리턴해준다. -->
						<label for="s2"><input id="s2" type="checkbox" name="skill" value="JSP" <%if (skill.indexOf("JSP") != -1) {%> checked <%}%>>JSP</label> <label for="s3"> <input id="s3" type="checkbox" name="skill" value="MVC" <%if (skill.indexOf("MVC") != -1) {%> checked <%}%>>MVC
						</label> <label for="s4"><input id="s4" type="checkbox" name="skill" value="JavaScript" <%if (skill.indexOf("JavaScript") != -1) {%> checked <%}%>>JavaScript</label> <label for="s5"><input id="s5" type="checkbox" name="skill" value="HTML" <%if (skill.indexOf("HTML") != -1) {%> checked <%}%>>HTML</label>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<select name="hobby">
							<option>취미를 선택하세요.</option>
							<option value="노래부르기">노래부르기</option>
							<option value="영화보기">영화보기</option>
							<option value="잠자기">잠자기</option>
							<option value="춤추기">춤추기</option>
							<option value="운동하기">운동하기</option>
						</select>
						<br>
						<script type="text/javascript">
						document.frm.hobby.value='<%=dto.getHobby()%>';
						</script>
					</td>
				</tr>
				<tr>

				</tr>
			</table>
			<div class="bottom">
				<input type="submit" class="button" value="수정"> 
				<input type="reset" class="button" value="다시입력"> 
				<input type="button" class="button" value="목록" onclick="tlist()">
			</div>
		</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
