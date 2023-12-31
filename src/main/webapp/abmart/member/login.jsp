<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%
	String t_id=(String)session.getAttribute("id");
	boolean t_isLogin=false;
	if(t_id!=null && !t_id.isEmpty()){ //세션에 값이 있으면 로그인된 경우
		t_isLogin=true;
	}
%>
<link rel="stylesheet" href="../../css/loginstyle.css">

<style type="text/css">
  .links{
        text-align: center;
        margin-bottom: 10px;
        font-size: 1.5em;
        color:black;
    }
    a {
    color: #7e4016;
}
.inset {
    color: black;
}
</style>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<%
	//쿠키 읽어오기
	String ck_value="";
	Cookie[] ckArr= request.getCookies();
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			String ck_name=ckArr[i].getName();
			if(ck_name.equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}	
		}//for
	}//if
%>

<form id="accesspanel" action="login_ok.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="id" id="id" placeholder="userid" value="<%= ck_value%>">
      <input type="password" name="pwd" id="pwd" placeholder="user pwd">
    </p>
   </div>
    
   
    <div style="text-align: center;">
      <div class="checkboxouter">
        <input type="checkbox" name="rememberme" id="remember" value="Remember"
        <%if(ck_value!=null && !ck_value.isEmpty()){ %>
						checked="checked"
					<%} %>>
        <label class="checkbox"></label>
      </div>
      <label for="remember">아이디를 기억하시겠습니까?</label>
    </div>
    <input class="loginLoginValue" type="hidden" name="service" value="login" />
  
  <p class="p-container" >
  <!-- jq에서 클릭 링크걸기 -->
     <input type="submit" name="Login" id="go" value="로그인">
  </p>
  <p class ="links">
  <a href="<%=request.getContextPath()%>/abmart/userfind/findid.jsp">아이디 찾기</a> | 
  <a href="<%=request.getContextPath()%>/abmart/userfind/findpwdjsp.jsp">비밀번호 찾기</a> |
  <a href="<%=request.getContextPath()%>/abmart/member/register.jsp">회원가입</a>
  </p>
</form>

</body>
</html>