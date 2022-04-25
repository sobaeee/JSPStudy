<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>내정보</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page02">
        <div class="b01 pd16">
            <div class="oH w100">
                <div class="name fL">
                    <b>김영희</b>님 안녕하세요!
                </div>
                <div class="fR">
                    <button>내정보수정</button>
                    <button class="blue">완료</button>
                    <!--평소에는 내정보수정 버튼만 보이고, 수정 중일때만 완료버튼 표시-->
                </div>
            </div>  

            <table>
                <tr>
                    <td>이름</td>
                    <td>김영희</td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                    <td>010-6371-0370</td>
                </tr>
                <tr>
                    <td>학교</td>
                    <td>포항고등학교</td>
                </tr>
                <tr>
                    <td>학년반</td>
                    <td>3학년 5반</td>
                </tr>
                <tr>
                    <td>노선</td>
                    <td>노선 A</td>
                </tr>
                <tr>
                    <td>탑승장소</td>
                    <td>우방비치타운</td>
                </tr>
            </table>
        </div>

        <div class="b02 pd16">
            <a href="bus.jsp" class="mb16 qrbtn">
                <img src="./img/img01.png">QR 승하차 체크하기<img src="./img/ico_arrow.png" class="fR">
            </a>
            <div class="mb16">
                <img src="./img/img02.png">잔여 이용 횟수
                <span class="fR"><b>4</b>회</span>
            </div>
            <a href="map.jsp" class="mb16">
                <img src="./img/img03.png">실시간 버스 위치<img src="./img/ico_arrow2.png" class="fR">
            </a>
            <a href="line.jsp">
                <img src="./img/img05.png">버스 노선 안내<img src="./img/ico_arrow2.png" class="fR">
            </a>
        </div>
        

        <div class="cscenter">
            가람광광여행사 고객센터 <span>054-251-3800</span><br><a href="privacy.jsp">[개인정보처리방침]</a><br>
        </div>

    <div class="FAB">
        <ul class="ulFl">
            <li class="on"><a href="mypage.jsp"><img src="./img/ico01_on.png"><p>내정보</p></a></li>
            <li><a href="bus.jsp"><img src="./img/ico02.png"><p>버스탑승</p></a></li>
            <li><a href="list.jsp"><img src="./img/ico03.png"><p>이용내역</p></a></li>
        </ul>
    </div>
</body>
</html>
