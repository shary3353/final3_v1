<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>우리집 자랑</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
 <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
}
.sidenavi-area{
	width:190px;
}
table{
	text-align:left;
	margin-left:50px;
	width:300px;
	table-layout: fixed;
}
table th{
	width:200px;
		
	
}
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
	 h2{
			border: 1px solid black;
			width: 178px;
			margin: 10px;
			text-align: center;
			font-size: 18px;
			background-color: cornflowerblue;
			margin-left:50px;
			border-radius: 7px;
			
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
				<h2>우리집 자랑</h2>
			</div>
			<div class="table-area">
				<table>
				
			<div id="list" style="display: flex; flex-flow: wrap; max-width: 900px; justify-content: left; border: 1px solid rgb(250px, 250px, 250px);">

			</div> 
					<tr>
						<td id="paging" colspan="6">
							<!-- 플러그인 사용 -->
							<div class="container">
								<nav aria-label="page navigation" style="text-align: center; width:700px;">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div> <!--// 플러그인 사용 -->
						</td>
					</tr>
				</table>
			</div>
			</div>
		</div>
</body>
<script>
var showPage = 1;
var pagePerNum = 9;
listCall(showPage,pagePerNum);

function listCall(reqPage,reqPagePerNum){
	 
	 var reqUrl ='./mywritehomeList/' + reqPagePerNum + "/" + reqPage;
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
			 listPrint(data.list);
			 
				$("#pagination").twbsPagination({
					startPage:data.currPage,//시작 페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:5//5개씩 보여 주겠다.(1~5)
					,first : '<span aria-hidden="true"><<</span>'
					,prev : "이전"
					,next : "다음"
					,last : '<span aria-hidden="true">>></span>'
					,onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page,pagePerNum);
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
			content += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
			content +="<a href='${pageContext.request.contextPath}/boarddetail?boardIdx="+list[i].boardIdx+"'>"	
			content += "<img src='/photo/"+list[i].newfilename+"' width='200' height='200' style=' border-radius:20px;'>"
			content += "</a></div>"
	}
	
	
	$("#list").empty();
	$("#list").append(content);
}
var msg = "${msg}";
if(msg != ""){
	 alert(msg);
}
</script>
</html>
