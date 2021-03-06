<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>견적서-상세보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
 <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>


.sideBar {
	float: left;
}

/*콘텐츠*/
#content {
	/*  background-color: lightgray; */
	position: relative;
	left: 20px;
	margin: 0 auto;
	width: 650px;
	 height: 700px;
}



table#est {
	background-color: white;
	position: relative;
	top: 80px;
	margin: 0 auto;
	width: 80%;
	clear: both;
	font-size: 20px;
}

span {
	font-size: 17px;
	color: black;
	
}
.btn{
	float:right;
}
h2{
	color: black;
    margin-left: 7%;
    
}
.content{
    border: 1px solid black;
}
body {
	display: flex;
	justify-content: center;
	
}
.sender{
	width:200px;
}


.content{
	width:300px;

}
.center-area{
	display:flex;
	text-align:center;
	padding :50px;
	

}
.sidenavi-area{
	width:190px;
}
table{
	text-align:left;
	margin-left:50px;
	width:450px;
	table-layout: fixed;
	
}
table th{
	width:200px;
		
	
}
	
	 th{
 	text-align: center;

      width: 300px;
		
.table-content tr:hover {
	  background-color:rgb(235, 232, 232);
}
.name{
	font-size:20px;
}

.list-area{
margin-top:50px;
 width: 300px;
}

.ctn:hover{
text-decoration: none;
color:black;
	}
	
}

        
</style>
</head>
<body>
		<div class="all-area">
		<div class="mainnavi-area">
			<jsp:include page="mainnavi.jsp"></jsp:include>
		</div>
		<div class="center-area">
		<div class="sidenavi-area">
			<jsp:include page="sidemenu.jsp"></jsp:include>
		</div>

                <div id="content">
                    <table id="est">
						<h2>견적서</h2>
                        		 <tr>
									<th>업체명</th>
									<td>${info.comId}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${info.address}</td>
								</tr>
								<tr>
									<th>평수</th>
									<td>${info.roomsize}</td>
								</tr>
								<tr>
									<th>예산</th>
									<td>${info.budget}만원</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${info.phone}</td>
								</tr>
								 <td colspan="2" style="padding-top:15px;padding-bottom:50px; color: black;" ><hr/>
							 	</td>
								<tr>
									<th>내용</th><br/><br/>
									<td>${info.content}</td>
								</tr>
                      
                       
                 </table>
                 </div>
                 </div>
                 
          </div>

</body>
<script>


</script>
</html>
