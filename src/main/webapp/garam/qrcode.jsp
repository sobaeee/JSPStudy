<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR코드 확인</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page05 tC">
	<div class="mXY">
		<div class="qrcode">
			<div class="qrimg" style="padding: 0">
				<%
				
				String savedFileName = "";
				String qrMsg = "{'name':'이지미'}";
				//한글깨짐 방지
				String data = new String(qrMsg.getBytes("UTF-8"), "ISO-8859-1");
				
				//파일 만들기
				File path = new File(application.getRealPath("/") + "garam/qrImages/");
				savedFileName = UUID.randomUUID().toString().replace("-", "");
					
				//폴더생성
				if (!path.exists()) path.mkdirs(); //A파일만 만들땐 mkdir. A/B/C 파일 안의 파일을 만들땐 mkdirs.
				
				//폴더 속 파일삭제
				File[] delFile = path.listFiles();
				for (int i = 0; i < delFile.length; i++) {
					delFile[i].delete();
				}

				//QR 이미지 만들기. lib 안에 QR코드 생성 jar를 넣어야 사용가능.
				QRCodeWriter writer = new QRCodeWriter();
				BitMatrix qrCode = writer.encode(data, BarcodeFormat.QR_CODE, 200, 200);

				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
				File file = new File(path, savedFileName + ".png");
				ImageIO.write(qrImage, "PNG", file);
				%>
				<img src="<%=request.getContextPath()+"/garam/qrImages/"+savedFileName + ".png" %>">
				<!-- 사이사이 / 중요하다. 경로 확인 잘하기. -->
			</div>
			<span>잔여횟수</span>
			<div class="count">
				<b>4</b>회
			</div>
		</div>
		<img src="./img/logo_bt.png" class="mt40">
	</div>

	<div class="FAB">
		<ul class="ulFl">
			<li><a href="mypage.jsp"><img src="./img/ico01.png">
					<p>내정보</p></a></li>
			<li class="on"><a href="02_bus.jsp"><img
					src="./img/ico02_on.png">
					<p>버스탑승</p></a></li>
			<li><a href="list.jsp"><img src="./img/ico03.png">
					<p>이용내역</p></a></li>
		</ul>
	</div>
</body>
</html>
<%
//file.delete();

%>