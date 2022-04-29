<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT uid, uname, schoolname FROM g_member "); 
qry.append(" WHERE uid = ? AND upw = sha(?) ");
//join02ACT에 sha(?) 이용시. 이 곳 upw에도 똑같이 sha(?) 로 작성 해야 값이 맞아 로그인이 된다.

String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null; 
ResultSet rs = null;

boolean loginSuccess = false;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");

	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql);

	stmt.setString(1, uid);
	stmt.setString(2, upw);
	rs = stmt.executeQuery();

	if(rs.next()){
		session.setAttribute("sessid", rs.getString("uid"));
		session.setAttribute("sessName", rs.getString("uname"));
		session.setAttribute("sessSchName", rs.getString("schoolname"));
		loginSuccess = true;
	}
	
} catch (Exception e){
	e.getLocalizedMessage();
} finally {
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
}
//페이지 이동
if(loginSuccess){
	response.sendRedirect("mypage.jsp");
} else {
	response.sendRedirect("login.jsp");
}
%>




