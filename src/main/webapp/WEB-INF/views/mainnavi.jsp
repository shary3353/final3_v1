<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>
body {
	min-width: 1000px;
}

.logo-area {
	/*  height: 50px; */
}
/*네비*/
#네비ul{
height:71px;
padding-left: 0;
}

.네비li {
	 line-height: 50px; 
	/*  border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue; */
	float: left;
	/* 	padding: 0px 20px; */
	margin:20px;
	/* background-color: white; */
	font-size: 17px;
	font-weight: 600;
	text-align: center;
	/* width: auto; */
	height: 45px;
	list-style: none;
	position:relative;
	float:left;
}

.네비a:link {
	color: #2E2E2E;
	text-decoration: none;
}

.네비a:visited {
	color: #2E2E2E;
}

.네비li:hover a{
font-weight:600px;
	color: deepskyblue;
	/* background-color: deepskyblue; */
}

div.네비bar {
	background-color: white;
	width: 1300px;
	border-top: 2px solid dodgerblue;
	border-bottom: 2px solid dodgerblue;
	height: 50px;
	/*중앙정렬*/
	margin: 0 auto;
	justify-content: center;
	align-items: center;
	display: flex;
}

#btn:hover {
	color: rgb(143, 201, 248);
	box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
}

span:hover {
	color: black;
}
/*검색바*/
#mainSearch {
	margin: 10px;
}

#mainTop {
	margin: 0 auto;
	margin-top:7px;
	margin-bottom:5px;
}

#mainTopTable {
	text-align: center;
	width: 1050px;
}

#mainTopTable td, #mainTopTable tr, #mainTopTable table {
	border: none;
}

</style>
<div style="text-align: center; position: relative; width: 1000px;" id="mainTop">

	<table id="mainTopTable">
		<tr >
			<td style="width: 150px"></td>
			<td style="width: 150px"><a href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/css/memberCSS/logo.png"
					style="height: 50px; width: 80px;">
			</a></td>
			<!-- <td style="width: 700px"><input type="text" size="75"
				style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); width:600px; height:30px;"
				placeholder="검색어를 입력해주세요." >
				<button id="btn"
					style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
 -->

			</td>
			<td style="width: 210px"><c:set var="loginId" value="${sessionScope.loginId}" /> <c:set
					var="comloginId" value="${sessionScope.cLoginId}" /> <c:if
					test="${empty loginId and empty comloginId}">
					<a class="네비a" href="${pageContext.request.contextPath}/FAQ"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="padding-left: 5px;">고객센터</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/registForm"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="padding-left: 5px;">회원가입</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/membership"
						style="font-weight: bold; font-size: small; float: right; color: gray;"><span
						class="네비span">로그인</span></a>
				</c:if> <c:if test="${!empty loginId}">
					<a class="네비a" href="${pageContext.request.contextPath}/FAQ"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="font-weight: bold; padding-left: 5px;">고객센터</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/mywrite"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="font-weight: bold; padding-left: 5px;">마이페이지</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/logOut"
						style="font-weight: bold; font-size: small; float: right; color: gray;"><span
						class="네비span">로그아웃</span></a>
				</c:if> <c:if test="${!empty comloginId}">
					<a class="네비a" href="${pageContext.request.contextPath}/FAQ"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="font-weight: bold; padding-left: 5px;">고객센터</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/companydetail"
						style="font-weight: bold; font-size: small; float: right; color: gray; padding-left: 5px;">|<span
						class="네비span" style="font-weight: bold; padding-left: 5px;">업체페이지</span></a>
					<a class="네비a" href="${pageContext.request.contextPath}/logOut"
						style="font-weight: bold; font-size: small; float: right; color: gray;"><span
						class="네비span">로그아웃</span></a>
				</c:if></td>
		</tr>
	</table>
	<%-- <div class="logo-area"> 
               <a href="main">
                    <img src="resources/css/memberCSS/logo.png" style="height: 50px; width: 80px;">
               </a>
          </div>
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
            placeholder="검색어를 입력해주세요.">
        <button id="btn"
            style="border-radius: 5px;background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
            
   
            
            <c:set var="loginId" value="${sessionScope.loginId}" />
             <c:set var="comloginId" value="${sessionScope.cLoginId}" />
            <c:if  test="${empty loginId and empty comloginId}">
        <a class="네비a" href="FAQ" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="padding-left: 5px;">고객센터</span></a>
        <a class="네비a" href="registForm" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="padding-left: 5px;">회원가입</span></a>
        <a class="네비a" href="membership" style="font-weight: bold; font-size:small; float: right; color: gray; "><span class="네비span">로그인</span></a>
        </c:if>
          <c:if  test="${!empty loginId}">
        <a class="네비a" href="FAQ" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="font-weight: bold; padding-left: 5px;">고객센터</span></a>
        <a class="네비a" href="mywrite" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="font-weight: bold; padding-left: 5px;">마이페이지</span></a>
        <a class="네비a" href="membership" style="font-weight: bold; font-size:small; float: right; color: gray; "><span class="네비span">로그아웃</span></a>
        </c:if>
         <c:if  test="${!empty comloginId}">
        <a class="네비a" href="FAQ" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="font-weight: bold; padding-left: 5px;">고객센터</span></a>
        <a class="네비a" href="companydetail" style="font-weight: bold; font-size:small; float: right; color: gray; padding-left: 5px;">|<span class="네비span"
                style="font-weight: bold; padding-left: 5px;">업체페이지</span></a>
        <a class="네비a" href="membership" style="font-weight: bold; font-size:small; float: right; color: gray; "><span class="네비span">로그아웃</span></a>
        </c:if>
 --%>
</div>
<div class="네비bar">
	<ul id="네비ul">
		<li class="네비li"><a class="네비a" href="${pageContext.request.contextPath}/Freelist" target="_parent">자유게시판</a></li>
		<li class="네비li"><a class="네비a" href="${pageContext.request.contextPath}/homemain" target="_parent">우리집자랑</a></li>
		<li class="네비li"><a class="네비a" href="${pageContext.request.contextPath}/groupListPage" target="_parent">공동구매</a></li>
		<li class="네비li"><a class="네비a" href="${pageContext.request.contextPath}/helpMain" target="_parent">도와줘요 자취만렙</a></li>
		<li class="네비li"><a class="네비a" href="${pageContext.request.contextPath}/interiorexamList" target="_parent">전문가 인테리어</a></li>
	</ul>

</div>
</html>