
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

<head>

<meta  charset= "UTF-8">
<title>자유게시판 글쓰기</title>

<!-- 부트스트랩 사용 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<style>
a {
	text-decoration: none;
    border-radius: 10px;
}
a.button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}
</style>
</head>

<body>

    
    <form method="post" action="">
        <div class="container" style="text-align: center; padding-top: 10px;">
            <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); " placeholder="검색어를 입력해주세요.">
            &nbsp;
            <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
            <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
            <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;" >|회원가입</a></span>
            <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">로그인</a></span>
        </div>
        <br/>
        <div class="container" style="height:200px; background-color: rgb(163, 182, 248); text-align:center;">

        <h2 style="padding-top: 70px; font-weight: bold; ">자유게시판 글쓰기</h2>
        <th>글 작성하기</th>          
        
        </div>
        <br/>
        <div class="container">

        <table class="table">
            <tr>
                <td><input type="text" class="form-control" placeholder="제목을 100자 내로 입력해주세요" name="content" maxlength="40"></td>
            </tr>
            <tr>
                <td><textarea type="text" class="form-control" placeholder="내용을 입력하세요" name="contentDetail" maxlength="1024" style="height: 400px;"></textarea></td>
            </tr>
        </table>
      
        <div class="container">
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; ">첨부파일</a>
            <div class="row" style="float: right;">
                <a href="#" class="button2" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; ">저장</a>
            </div>
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">취소</a>
           
            
               

</form>

</body>

</html>