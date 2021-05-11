<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>나의 공동구매 전체</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   

<style>
body {
	display: flex;
	justify-content: center;
	
}
.sender{
	width:200px;
}
reg_date{
	width:100px;
}
.delete{
	width:40px;
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
	 text-align: center;
	margin-left:50px;
	width:300px;
	table-layout: fixed;

}
table th{
	width:200px;

	margin: 20px
		
	
}
	 h2{
			border: 1px solid black;
			width: 178px;
			margin: 10px;
			text-align: center;
			font-size: 18px;
			background-color: cornflowerblue;
			margin-left:50px;
			
		}
	
	 th{
      border:1px solid gray;
      border-collapse: collapse;
      text-align: center;
      background-color: cornflowerblue;
      
		
.table-content tr:hover {
	  background-color:rgb(235, 232, 232);
	 
}
.name{
	font-size:20px;
}
.list-area{
margin-top:50px;
}
   button{
      color: white;
    background-color: #166cea;
    border:none;
    border-radius: 2px;
    font-weight: bold;
     padding: 2px 2px;
    }
    button:hover{
       background-color: white;
    color: #166cea;
    border: 1px solid #166cea;
    cursor: pointer;
    box-shadow: 0px 5px 5px rgb(235, 232, 232);
     transition: all .3s ease;
    }
    .ctn:hover{
		text-decoration: none;
		color:black;
	}
	
}
</style>

<body>
	<div class="all-area">
		<div class="mainnavi-area">
			<jsp:include page="mainnavi.jsp"></jsp:include>
		</div>
		<div class="center-area">
		<div class="sidenavi-area">
			<jsp:include page="sidemenu.jsp"></jsp:include>
		</div>

		<div class="list-area">
			<div class="title-area">
				<h2>내가 작성한 공동구매</h2>
			</div>
			<div class="table-area">
				<table>
						<thead>
							<tr>
                     	<th style="width:70px">글 번호</th>
						<th style="width:70px">현재상태</th>
						<th style="width:80px">작성자</th>
						<th style="width:250px">제목</th>
						<th style="width:100px">작성일</th>
							</tr>
						</thead>
					<tbody id="list" class="table-content">

					</tbody>
				
				</table>
				
				<div class="title-area">
				<h2>내가 신청한 공동구매</h2>
				</div>
				<table>
						<thead>
							<tr>
                 		<th style="width:70px">글 번호</th>
						<th style="width:70px">현재상태</th>
						<th style="width:80px">작성자</th>
						<th style="width:250px">제목</th>
						<th style="width:100px">작성일</th>
							</tr>
						</thead>
					<tbody id="list2" class="table-content">

					</tbody>
			
				</table>
			</div>
			</div>
		</div>
</body>
<script>
var showPage = 1;
var pagePerNum = 10;
listCall(showPage,pagePerNum);
listCall2(showPage,pagePerNum);

function listCall(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mygroupwriteList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 //listPrint(data.list);
			 listPrint(data.list);
				$("#pagination").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall2(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
				console.log(error);
		 }
	 });
}
function listCall2(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mygroupbuyList/' + reqPagePerNum + "/" + reqPage;
	 $.ajax({
		 url:reqUrl
		 ,type:'GET'
		 ,data:{}
		 ,dataType:'JSON'
		 ,success:function(data){
			 console.log(data);
			 showPage = data.currPage;
			 console.log(showPage);
			 console.log(data.list);
			 //listPrint(data.list);
			 listPrint2(data.list);
				$("#pagination2").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:3,//5개씩 보여 주겠다.(1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall2(page,pagePerNum);
					}
				});
		 },
		 error:function(error){
				console.log(error);
		 }
	 });
}
	 
function listPrint(list){
	 var content = "";
	 for(var i = 0; i<list.length; i++){
		 
		 
		content +="<tr>"
			content +="<td>"+list[i].gpIdx+"</td>"
		 if(list[i].progIdx == 1){//현재상태
				content += "<td style='color:red'>진행중</td>" 
			}else if(list[i].progIdx == 2){
				content += "<td >인원부족마감</td>"
			}else{
				content += "<td>마감</td>" 
			}
/* 			content +="<td>"+list[i].progIdx+"</td>" */
			content +="<td>"+list[i].id+"</td>"
			content +="<td>"+list[i].subject+"</td>"
			var date = new Date(list[i].reg_date);
		content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
		
		content +="</tr>"
	}
	$("#list").empty();
	$("#list").append(content);
}

function listPrint2(list){
	 var content = "";
	 for(var i = 0; i<list.length; i++){
		 
		 
		content +="<tr>"
			content +="<td>"+list[i].gpIdx+"</td>"
		 if(list[i].progIdx == 1){//현재상태
				content += "<td style='color:red'>진행중</td>" 
			}else if(list[i].progIdx == 2){
				content += "<td >인원부족마감</td>"
			}else{
				content += "<td>마감</td>" 
			}
/* 			content +="<td>"+list[i].progIdx+"</td>" */
			content +="<td>"+list[i].id+"</td>"
			content +="<td>"+list[i].subject+"</td>"
			var date = new Date(list[i].reg_date);
		content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"		
		
		content +="</tr>"
	}
	$("#list2").empty();
	$("#list2").append(content);
}
var msg = "${msg}";
if(msg != ""){
	 alert(msg);
}
	


</script>
</html>
