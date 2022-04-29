<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("sessid") == null) {
	response.sendRedirect("login.jsp");
}

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
StringBuffer qry = new StringBuffer();

qry.append(" SELECT * FROM g_member ");
qry.append(" WHERE uid = ? ");

String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String uname = "";
String schoolName = "";
String phone = "";
String gradeClass = "";
String route = "";
String boardingPlace = "";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);

	stmt = conn.prepareStatement(sql);
	stmt.setString(1, (String) session.getAttribute("sessid"));

	rs = stmt.executeQuery();
	if (rs.next()) {

		uname = rs.getString("uname");
		schoolName = rs.getString("schoolname");
		phone = rs.getString("uid");
		gradeClass = rs.getString("gradeclass");
		route = rs.getString("route");
		boardingPlace = rs.getString("boardingplace");
	}

} catch (Exception e) {

} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
	<div class="jointit w100 tC">
		<b>회원가입</b>
	</div>

	<div class="pd16">
		<form method="post" action="mymodiAct.jsp">
			<input type="hidden" name="uid" id="uid" value="<%=session.getAttribute("sessid")%>">
			<div>
				<h4>이름</h4>
				<input type="text" name="uname" id="uname" value="<%=uname %>">
			</div>

			<div>
				<h4>학교</h4>
				<input type="text" name="schoolname" id="sc" value="<%=schoolName %>">
			</div>

			<div>
				<h4>학년/반</h4>
				<input type="text" name="gradeclass" id="cl" value="<%=gradeClass %>">
			</div>

			<div>
				<h4>노선</h4>
				<div class="sltbox">
					<select name="route">
						<option value="A" <%="A".equals(route)?"selected":"" %>>A노선</option>
						<option value="B" <%="B".equals(route)?"selected":"" %>>B노선</option>
						<option value="C" <%="C".equals(route)?"selected":"" %>>C노선</option>
					</select>
				</div>
			</div>

			<div>
				<h4 class="inline">탑승장소</h4>
				<span>(※노선을 먼저 선택해주세요)</span>
				<div class="sltbox">
					<select name="boardingplace">
						<option value="A" <%="A".equals(boardingPlace)?"selected":"" %>>A장소</option>
						<option value="B" <%="B".equals(boardingPlace)?"selected":"" %>>B장소</option>
						<option value="C" <%="C".equals(boardingPlace)?"selected":"" %>>C장소</option>
					</select>
				</div>
			</div>

			<div class="jw100 tC">
				<button type="submit" id="go">수정하기</button>
			</div>
		</form>
	</div>
	<script>

    $(document).ready(function(){
 
    	$("#go").click(function(){
    		if($("#uname").val() == ''){
        		alert("이름을 입력하세요.");
        		return false;
        	}
    		
    		if($("#sc").val() == ''){
        		alert("학교를 입력하세요.");
        		return false;
        	}
    		
    		if($("#cl").val() == ''){
        		alert("학년과 반을 입력하세요.");
        		return false;
        	}
    		
    		if($("#upw").val() == ''){
        		alert("비밀번호를 입력하세요.");
        		return false;
        	}
    		
    		if($("#route").val() == 'N'){
        		alert("노선을 고르세요.");
        		return false;
        	}
    		
    		if($("#pl").val() == 'N'){
        		alert("탑승장소를 고르세요.");
        		return false;
        	}
    		return true;
    	});
    });
    </script>
</body>
</html>
