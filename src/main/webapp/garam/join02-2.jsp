<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String agree = request.getParameter("agree");
    String method = request.getMethod(); //get,post
    if((agree == null || !agree.equals("Y")) || method.equals("Get")){
    %>
    <!-- !agree 자체가 null이라서 2번째로 적어야 한다. 아니면 nullpotinexception 발생.
    또는 !Y.equals("agree") 로 사용하면 오류 발생 안함.-->
    <script>
    	history.go(-1);
    </script>
    <%
    }
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입<%=method %></title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
    <div class="jointit w100 tC"><b>회원가입</b></div>

    <div class="pd16">
	<form method="post" action="join02Act.jsp">
	<input type="hidden" name="uid" id="uid">
        <div>
            <h4>이름</h4>
            <input type="text" name="uname" id = "uname">
        </div>

        <div>
            <h4>학교</h4>
            <input type="text" name="schoolname" id = "sc">
        </div>

        <div>
            <h4>학년/반</h4>
            <input type="text" name="gradeclass" id = "cl">
        </div>

        <div class="pnum">
            <div><h4 class="inline">휴대폰번호</h4> <span>(※휴대폰 번호가 ID로 설정됩니다.)</span></div>
            <input type="text" id="phone1"> - <input type="text" id="phone2"> - <input type="text" id="phone3">
        </div>

        <div>
            <h4 class="inline">비밀번호</h4> <span>(※최대 12자리)</span>
            <input type="password" maxlength='12' name="upw" id = "upw">
        </div>

        <div>
            <h4>비밀번호 확인</h4>
            <input type="password" maxlength='12'>
        </div>

        <div>
            <h4>노선</h4>
            <div class="sltbox">
                <select name="route" id = "route">
                    <option value="N">선택</option>
                    <option value="A">A노선</option>
                    <option value="B">B노선</option>
                    <option value="C">C노선</option>
                </select>
            </div>
        </div>
        
        <div>
            <h4 class="inline">탑승장소</h4> <span>(※노선을 먼저 선택해주세요)</span>
            <div class="sltbox">
                <select name="boardingplace" id = "pl">
                	<option value="N">선택</option>
                    <option value="A">A장소</option>
                    <option value="B">B장소</option>
                    <option value="C">C장소</option>
                </select>
            </div>
        </div>
        
        <div class="jw100 tC">
            <button type="submit" id="go">가입하기</button>
        </div>
        </form>
    </div>
    <script>
    
    function chkName(str){
    	   var nameCheck = /^[가-힣]{2,6}$/;
    	   if(!nameCheck.test(str)){
    	      return false;
    	   }
    	   return true;
    	}

    $(document).ready(function(){
    	
    	
    	 $('#go').click(function(){
    	      
    	      if($('#uname').val() == 0){
    	         alert("이름을 입력하세요");
    	         $('#uname').focus();
    	         return false;
    	      }      
    	      if(!chkName($('#uname').val())){
    	         console.log("잘못됨"+$('#uname').val());
    	         alert("올바른 형식의 이름을 입력하세요");
    	         $('#uname').val('');
    	         $('#uname').focus();
    	         return false;
    	      }
    	   });

    	//key up으로 한글입력칸에 한글 외 입력시 경고창 뜨게 해보기.
    	
    	
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
    	});
    	
    	$("button[type=submit]").on("click", function(){
    		var p1 = $("#phone1").val();
    		var p2 = $("#phone2").val();
    		var p3 = $("#phone3").val();
    		$("#uid").val(p1+p2+p3);
    		return true;
    	});
    });
    </script>
</body>
</html>
