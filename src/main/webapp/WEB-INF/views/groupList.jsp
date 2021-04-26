<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 반응형 디자인을 위한 CSS/JS 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>

<title>공동구매</title>
<style>
table {
	width: 70%;
	margin-top: 10px;
}

table, td {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px 10px;
}

head td, #paging {
	text-align: center;
}
</style>
</head>
<body>

<button onclick="location.href='groupWriteForm'">글쓰기</button>
<h3>리스트 페이지</h3>
	
	<table>
		<thead>
			<tr>
				<td>글번호</td>
				<td>글종류</td>
				<td>현재상태</td>
				<td>마감날짜</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>

		</thead>
		<tbody id="list">
			<!-- 불러온 데이터를 뿌리는 영역 -->
		</tbody>
		<tr>
			<td id="paging" colspan="8">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="pagenavigation" style="text-aglin:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			
			</td>
		</tr>
	</table>
</body>
<script>
var msg="${msg}";
if(msg!=""){
	 alert(msg);
}

var showPage = 1;

// 몇개/몇페이지 를 보여줄 것인지
listCall(showPage); // 시작하자마자 이 함수를 호출


function listCall(reqPage) {
	var reqUrl = "./groupList/"+10+"/"+reqPage; 
	$.ajax({
		url : reqUrl,
		type : "get",
		data : {},
		dataType : "JSON",
		success : function(data) {
			console.log("success:"+data);
			showPage = data.currPage; //서비스에서 보낸 페이지를 현재 페이지에 넣기
			listPrint(data.list); //list내용을 뿌려주는 함수 실행
					
			/* 플러그인 사용한 페이징 처리*/
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages:data.range, //생성가능 최대 페이지
				visiblePages:5, //5개씩 보여주겠다(1~5)
				onPageClick:function(event,page){ //각 페이지를 클릭한 경우
					console.log("event: "+event);
					console.log("page: "+page);
					listCall(page);
				}
			});
		},
		error : function(error) {
			console.log("error:"+error);
		}
	});
}

function listPrint(list) {
	var content = "";
	var category="";
	var progress="";

	for (var i = 0; i < list.length; i++) {
		content += "<tr>"
		content += "<td>"+list[i].gpIdx+"</td>" //글번호
		
		if(list[i].gpCtgIdx == 1){
			category ="공동구매";
		}else{
			category="무료나눔";
		}
		content += "<td>"+category+"</td>" //글종류
		
		if(list[i].progIdx ==1){
			progress="진행중";
		}if(list[i].progIdx ==2){
			progress="인원부족마감";
		}else{
			progress="마감"
		}
		content += "<td>"+progress+"</td>" //현재상태
		
		//JAVA에서 가끔 날짜가 milliseconds로 나올 경우..
		 var deadline = new Date(list[i].deadline); 
		content += "<td>"+deadline.toLocaleDateString("ko-KR")+"</td>" //마감날짜
	
		content += "<td>"+list[i].subject+"</td>" //제목
		content += "<td>"+list[i].id+"</td>"  //작성자
		content += "<td>"+list[i].gHit+"</td>" //남은자리(->조회수로 대체)
		
		 var reg_date = new Date(list[i].reg_date); 
		content += "<td>"+reg_date.toLocaleDateString("ko-KR")+"</td>"  //작성일
		content += "</tr>" 
		
	}
	$("#list").empty(); //#list안의 내용을 버려라
	$("#list").append(content);
}

</script>
</html>