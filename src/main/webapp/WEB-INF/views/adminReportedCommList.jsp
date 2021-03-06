<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
table, td, th {
	border-collapse: collapse;
	padding: 10px 10px;
	margin: 10px;
	line-height: 100%;
	text-align: center;
}

table {
	border-top: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
}

th {
	border-bottom: 1px solid lightgray;
}

td {
	height: 55px;
}

.flexBox {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.inputs {
	width: 130px;
	height: 35px;
	border: 2px solid lightslategrey;
	line-height: 100%;
	font-size: 16px;
}

.headDESC {
	font-size: 25px;
	font-weight: 600;
	color: tomato;
	margin-left: 10px;
	margin-bottom: 0px;
}

input[type="button"], input[type="submit"] {
	background-color: #acd3fb;
	cursor: pointer;
	color: white;
	font-weight: bold;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #acd3fb;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 79, 255, 0.6);
	border: 2px solid white;
	color: white;
}

#monitor {
	width: 750px;
	height: 500px;
	overflow: auto;
	border: 2px solid #acd3fb;
}

select:hover {
	cursor: pointer;
}

.pagingBtn {
	text-decoration: none;
	color: black;
	font-weight: 600;
	background-color: lightgray;
	margin: 1px 2px;
	margin-top: 0px;
	padding: 3px;
	border: 1px white;
}

.sideBar {
	float: left;
}

#reportedComm {
	font-weight: 600;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="flexBox">
		<div>
			<form>
				<div>
					<jsp:include page="adminSideBar.jsp" />
					<div class="sideBar" style="margin-right: 15px;">
						<div
							style="display: flex; justify-content: space-between; margin-right: 10px;">
							<div class="headDESC">????????? ??????</div>
							<div>
								<select id="repCtgIdx" class="inputs">
									<option value="0">????????????</option>
									<option value="11">???????????? ?????? ??? ??????</option>
									<option value="12">????????? ??????</option>
									<option value="13">????????? ??????</option>
									<option value="14">??????</option>
								</select>
							</div>
						</div>
						<table style="min-width: 900px;">
							<tr>
								<th style="width: 250px;">????????? ??????</th>
								<th style="width: 100px;">?????? ??????</th>
								<th style="width: 150px;">???????????? ??????</th>
								<th style="width: 100px;">?????????</th>
								<th style="width: 100px;">?????? ??????</th>
								<th>??????</th>
							</tr>
							<tbody id="list">
								
							</tbody>
							<tr>
								<td colspan="6">
									<!-- PlugIn -->
									<div class="container">
										<nav aria-label="page navigation" style="text-align: center;">
											<ul class="pagination" id="pagination"></ul>
										</nav>
									</div> <!-- /PlugIn -->
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
function detailPopUp(idx){
	var url = "adminReportedBrdDetail/";
	var boardIdx = idx;
	console.log(idx);
	url += boardIdx;
	window.open(url ,"????????????","width=600, height=650");
}

var thisPage = 1;
var repCtg = 0;
listCall(thisPage, repCtg);

$("#repCtgIdx").change(()=>{
	thisPage = 1;
	repCtgIdx = $("#repCtgIdx").val();
	listCall(thisPage, repCtgIdx);
});

function listCall(reqPage,repCtgIdx) {	
	var reqUrl = 'adminReportedCommList/'+10+'/'+reqPage+'/'+repCtgIdx;
	$.ajax({
		url:reqUrl
		,data:{}
		,type:'GET'
		,dataType:'JSON'
		,success:(data)=>{
			if(reqPage > data.maxPage){listCall(data.maxPage,repCtgIdx);}
			console.log(reqUrl);
			console.log(data);
			thisPage = data.currPage;
			listPrint(data.list);
			$("#pagination").twbsPagination({
				startPage:data.currPage
				,totalPages:data.maxPage
				,visiblePages:5
				,first : '<span aria-hidden="true"><<</span>'
					,prev : "??????"
					,next : "??????"
					,last : '<span aria-hidden="true">>></span>'
				,onPageClick:(evt, page)=>{
					console.log(evt);
					console.log(page);
					listCall(page,repCtgIdx);
				}
			});
		}
		,error:(data)=>{
			console.log(data);
		}
	});
}

function listPrint(list){
	var content = "";
	console.log("list.length : "+list.length);
		if(list.length == 0) {
			content += "<tr><td colspan='6'>?????? ????????? ????????? ????????????.</td></tr>";
		} else {
			for(var i=0;i<list.length;i++){
			content += "<tr>"
				content += "<td style='text-align: left;' onclick='detailPopUp("+(list[i].boardIdx)+")'>"+list[i].comments+"</td>"
				if(list[i].repCtgIdx == 11) {
					content += "<td>???????????? ?????? ??? ??????</td>"
				} else if (list[i].repCtgIdx == 12) {
					content += "<td>????????? ??????</td>"
				} else if (list[i].repCtgIdx == 13) {
					content += "<td>????????? ??????</td>"
				} else if (list[i].repCtgIdx == 14) {
					content += "<td>??????</td>"
				}
				content += "<td>"+list[i].targetId+"</td>"
				var date = new Date(list[i].reg_date);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				if(list[i].blind =='n'){
					content += "<td><input type='checkbox' id="+(i)+" value='"+(list[i].commIdx)+"' />????????????</td>"
				} else {
					content += "<td style='color: red;'>???????????? ???</td>"
				}
				content += "<td><input type='button' value='??????' style='width: 50px;' class='inputs' onclick='blind("+(i)+")' /></td>"
			content += "</tr>"
		}
	}
	$("#list").empty();
	$("#list").append(content);
}

function blind(i){	
	if($("#"+i).prop("checked")){
		var commIdx = $("#"+i).val();
		$.ajax({
			url: "adminCommBlind/"+commIdx
			,data: {}
			,type: "get"
			,dataType: "JSON"
			,success:(data)=>{
				listCall(1, 0);
			}
			,error:(error)=>{
				console.log(error);
			}
		});
	}
}

</script>
</html>
