<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>

   .logo-area{
   height: 50px;
   }
   	.네비li{
        line-height: 4;
        border-top: 2px solid dodgerblue;
        border-bottom: 2px solid dodgerblue;
        float: left;
       
        padding: 0px 20px;
        background-color: white;
        font-size: 25px;
        font-weight: 700;
        text-align: center;
        width:auto;
        height: 100px;
        list-style: none;
         }
        .네비a:link{
            color: black;
            text-decoration: none;
        }
        .네비a:visited{
            color: pink;
        }
        .네비li:hover{
            color: white;
            background-color: deepskyblue;
        }
        div.네비bar{
            background-color: white;
            min-width: 300px;
        }
            #btn:hover{
            color: rgb(143, 201, 248);
	        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
        }
         span:hover {
        color: black;
       
    }
     
</style>
<div class="logo-area">
               <a href="main">
                    <img src="resources/css/memberCSS/logo.png" style="height: 50px; width: 100px;">
               </a>
           </div>
<div style="text-align: center; position: relative;
	width: 1000px;">
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
    </div>
<div class="네비bar">
    <ul>
        <li class="네비li"><a class="네비a" href="Freelist" target="_parent">자유게시판</a></li>   
        <li class="네비li"><a class="네비a" href="homemain" target="_parent">우리집 자랑</a></li>
        <li class="네비li"><a class="네비a" href="groupListPage" target="_parent">공동 구매</a></li>
        <li class="네비li"><a class="네비a" href="helpMain" target="_parent">도와줘요 자취만렙</a></li> 
        <li class="네비li"><a class="네비a" href="interiorexamList" target="_parent">전문가 인테리어</a></li>
    </ul>

</div>
</html>