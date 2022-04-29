<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  uid: 01012345678
uname: 이지미
schoolname: 경북직업전문학교
gradeclass: 1학년 1반
upw: 0528
route: B
boardingplace: C -->


 
<%

request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String uname = request.getParameter("uname");
String schoolname = request.getParameter("schoolname");
String gradeclass = request.getParameter("gradeclass");
String upw = request.getParameter("upw");
String route = request.getParameter("route");
String boardingplace = request.getParameter("boardingplace");

/* uid란을 빈값 혹은 null로 설정 하였을때 02페이지로 다시 돌아오게 하라. */
/* if(uid == null || "".equals(uid)) {
	response.sendRedirect("join02.jsp");
	alert("회원가입에 실패하셨습니다.");
} */

//JDBC프로그래밍
String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
StringBuffer qry = new StringBuffer();

qry.append(" INSERT INTO g_member (uname, schoolname, gradeclass, uid, upw, route, boardingplace, joindate) ");
qry.append(" VALUES (?,?,?,?,?,?,?,now()) ");


String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
int res = 0;

//드라이버 로드
try {
Class.forName("com.mysql.cj.jdbc.Driver");
//연결
conn = DriverManager.getConnection(url, user, password);
//SQL
 stmt = conn.prepareStatement(sql);

stmt.setString(1, uname);
stmt.setString(2, schoolname);
stmt.setString(3, gradeclass);
stmt.setString(4, uid);
stmt.setString(5, upw);
stmt.setString(6, route);
stmt.setString(7, boardingplace);

res = stmt.executeUpdate();
} catch(Exception e) {
	
} finally {
//닫기
if(stmt != null) stmt.close();
if(conn != null) conn.close();
}
%>

<script>
<%
if(res <= 0){
%>
	alert("회원가입에 실패했습니다.");
	history.go(-1);
<%
} else {
%>
	location.href = "join03.jsp";
<%
}
%>
</script>

<!-- res == 0 : 회원가입 정보가 안날라갔을때. 회원가입 실패 -->






