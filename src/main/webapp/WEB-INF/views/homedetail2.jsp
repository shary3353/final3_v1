
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>
<meta charset="UTF-8">
<title>우리집 자랑 게시물</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>

a {
	text-decoration: none;
    border-radius: 10px;
   
	border: none;
}
#button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	border-radius: 5px;
	border: none;
}

#button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}
#commentSave{
color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
	border-radius: 5px;
	border: none;

}

#commentSave :hover{
color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;

}

#contentbtn{
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(255, 210, 180);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 2px inset;
	border-radius: 5px;
	border: none;
}

#contentbtn:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(255, 210, 180) 0 0px 0px 40px inset;
}
#btn{
	 background-color: white;
	 border:none;
}
#btn:hover{
	background-color:white;
}
/* 생성된 댓글 테이블 설정*/
.commentTable {
	margin: 10px;
	
}
/* 댓글작성란 스타일 */
#comment {
	background-color: rgb(241, 160, 122);
	color: rgb(8, 8, 8);
	font-weight: bold;
	padding: 7px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 800px;
	height: 40px;
	border-radius: 5px;
}

.commDel {
	border: none;
	
}

.commentDiv {
	border: 2px solid red;
}

.commentTable {
 min-width:900px;
	margin: 10px;
}

.commDel {
	border: none;
}

.grade {
	color: orange;
	font-weight: 600;
	font-size: 90%;
}

a:link {
	text-decoration: none;
}
/*대댓글창 영역*/
#recommentBox {
	margin-left: 50px;
}

.recommentTable {
	background-color: #F2F1F1;
}

#recomment {
	height: 30px;
	width: 800px;
}

#recommentSave {
	margin: 7px;
	background-color: rgb(172, 172, 172);
	color: rgb(8, 8, 8);
	font-weight: bold;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	padding: 7px;
}
#recommentSave:hover{

	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

#loginId {
	margin: 20px;
}

.commDel {
	color: red;
}
#groupTable{
margin-top:10px;
width: 1200px;

}

#groupTable table, #groupTable td, #groupTable th {
	padding: 5px 10px;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-collapse: collapse;
}
#groupTable th{
border-top:1px solid lightgray;
}


</style>
</head>
	
	
<body>
  <div style="min-height: 210px; padding-top:30px;">
	            <jsp:include page="mainnavi.jsp"></jsp:include> 
            </div>
    
   <!--   <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); " placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">로그인</a></span>
    </div>-->
   <br/>

    <div class="container"  style="height:280px; background-color:rgb(170, 187, 247); text-align:center;">
  
        <h1 style="padding-top: 8%; font-weight: bold; ">${dto.subject}</h1>
    
        <div  style="padding-top: 4%;">
         <c:set var="loginId" value="${sessionScope.loginId}" />
         <c:if test="${ dto.id == loginId }">
				<button id="button" style="margin-left: 300;" onclick="location.href='./boardUpdateForm/${dto.boardIdx}'">수정</button>
				<button id="button" style="margin-left: 50;" onclick="location.href='./boardDel/${dto.boardIdx}'">삭제</button>
		</c:if>
		    <c:if  test="${ dto.id != loginId}">
		        <button id="button" style="margin-left: 300;" onclick="boardRec('${dto.boardIdx}')">추천하기</button>
				<button id="button" style="margin-left: 50;" onclick="location.href='./boardScrap/${dto.boardIdx}/${sessionScope.loginId}'">스크랩</button>
        	</c:if>
        </div>
    </div>
    <div class="container" style="float:right; padding-left:15%;">
    </div>
    <div class="container">
            <table id="groupTable" style="width: 100%;">
					<tr >
						<th>글번호</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천 수</th>
					</tr>
					<tr >
						<td>${dto.boardIdx}</td>
						<c:if test="${dto.gradeIdx == 1}">
						<td><span class="grade">초보</span>&nbsp;${dto.id}</td>
						</c:if> 	
						<c:if test="${dto.gradeIdx == 2}">
						<td><span class="grade">중수</span>&nbsp;${dto.id}</td>
						</c:if> 	
						<c:if test="${dto.gradeIdx == 3}">
						<td><span class="grade">고수</span>&nbsp;${dto.id}</td>
						</c:if> 	
						<c:if test="${dto.gradeIdx == 4}">
						<td><span class="grade">초고수</span>&nbsp;${dto.id}</td>
						</c:if> 	
						<c:if test="${dto.gradeIdx == 5}">
						<td><span class="grade">신</span>&nbsp;${dto.id}</td>
						</c:if> 	
						<td>${dto.reg_date}</td>
						<td>${dto.bhit}</td>
						<td>${dto.CNTRECO}</td>
					</tr>
				</table>
        </div>
    <div class="container">
        <table class="table">
            <div class="container" >
                <table class="table" style="width: 300px;" >
                    <thead>
                    <tr>
                        <th style="border:none;">주거형태</th>
                        <th style="border:none;">평수</th>
                        <th style="border:none;">예산</th>
                       
                     </tr>
                    </thead>
                    <thead>
                    <tr>
                        <td style="border:none;">${dto.formcategory}</td>
                        <td style="border:none;">${dto.roomsize}</td>
                        <td style="border:none;">${dto.budget}</td>
                        
                        </tr>
                    </thead>
                </table>
                <table>
                    		${dto.content}
                </table>
                <br/>
                <table class="table" >
                    <thead>
                    <tr>
                        <th style="border:none;padding-top: 10%;">아이템:</th>
                        <th style="border:none;"> ${dto.keyitems} </th>
                     </tr>
                    </thead>
                    
                </table>
            </div>
        </table>
         </div>       
        <div class="container">
            <button id="contentbtn" class="contentbtn" onclick="location.href='./homemain'" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">목록</button>
             <c:set var="loginId" value="${sessionScope.loginId}" />
			 <c:if  test="${!empty loginId}">
            <button id="contentbtn" class="contentbtn" onclick="reportBoard()" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">신고</button>
        	</c:if>
        </div>
        <br/>
        <br/> 
        <br/>
        <br/>
        <div class="container">
            
            
           <div>
               <table class="table">
               <tr>
                <td>
             	  댓글<span id ="listSize" style="font-size: medium; font-weight: bold; ">개</span>
            	</td>
               </tr>
                <c:if test="${listSize = '0' }">
        	<div>현재 댓글이 없습니다.</div>
			</c:if>     
                </table>
            </div>
      <div id="commentBox" class="container">
      <c:set var="loginId" value="${sessionScope.loginId}" />
      <c:if  test="${!empty loginId}">
           <sapn><b id="loginId">${sessionScope.loginId}</b></sapn> : <input type="text" name="comment" id="comment" size="75" placeholder="댓글을 입력해주세요."/> 
            <button id="commentSave"  class="contentbtn" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold;">저장</button>
       </c:if>
        <c:if  test="${empty loginId}">
         <sapn><b id="loginId">${sessionScope.loginId}</b></sapn> : <input type="text" name="comment" id="comment" size="75" placeholder="로그인이 필요한 서비스입니다."/> 
            <button id="commentSave"  class="contentbtn" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold;">저장</button>
        </c:if>
        <div>
			<div id="commentListDiv"></div>
		</div>
      </div>
        </div>
        
   </body>
   <script>
   var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	boardCommentList(); //댓글리스트
	/*글 신고 새창*/
	function reportBoard(){
		window.open("./boardRepBoardForm/${dto.boardIdx}","reportBoard","width=800, height=600");
		//요청url,타이틀,옵션
	}
	/* 댓글 등록 */
	$("#commentSave").click(function() {
		var comment = $("#comment").val();
		var loginId = "${sessionScope.loginId}";
		var boardIdx = "${dto.boardIdx}";
		console.log("loginID:" + loginId + "/comment:" + comment);
		if (comment != '') {


			var reqUrl = ' ./boardCommentWrite';
			$.ajax({
				url : reqUrl,
				type : "GET",
				data : {
					"boardIdx" : boardIdx,
					"comment" : comment,
					"loginId" : loginId
				},
				dataType : "JSON",
				success : function(data) {
					console.log("success: ", data);
					alert(data.msg);
					$("#comment").val('');
					boardCommentList();// 작성후 댓글 리스트 요청

				},
				error : function(error) {
					console.log("error:", error);
				}
			});
		}
	})

	/* 댓글 목록 불러오기 */
	function boardCommentList() {
		var reqUrl = './boardCommentList/' + ${dto.boardIdx};
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("success: ", data);
				console.log("listSize:" + data.listSize);
				$("#listSize").html(data.listSize);
				if (data.listSize == 0) {
					$("#commentListDiv").html("현재 댓글이 없습니다!");
				} else {
					commentListPrint(data.list);
					recCommList(); //내가 추천한 댓글 이미지 활성화로 고정
				}
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}

	/* 댓글 리스트 뿌리기 */
	function commentListPrint(list) {
		var content = "";

		for (var i = 0; i < list.length; i++) {
			content += "<div id='commentDiv"+list[i].commIdx+"'>";
			content += "<table class='commentTable'>";
			content += "<tr>";
			content += '<td style="width:14%;"><b>' + list[i].id + '</b></td>';
			content += '<td colspan="2" style="text-align:left; min-width:900;">';
			content += list[i].comments;
			content += '</td>';
			content += '</tr>';
			content += '<tr>';
			content += '<td style="width:14%; font-size:90%; color:gray; ">';
			var reg_date = new Date(list[i].reg_date);
			content += reg_date.toLocaleDateString("ko-KR");
			content += '</td>';
			content += ' <td style="width:7%" >';
			//댓글추천 
			content += '<a href="javascript:void(0)"; onclick="boardCommRec('
					+ list[i].commIdx
					+ ')"><img alt="decommend" src="resources/images/decommend.png" width="15px" height="15px" id="'+list[i].commIdx+'"> </a>';
			//댓글 추천수
			if (list[i].recCnt != 0) {
				content += '<span class="commIdxRecCnt">' + list[i].recCnt
						+ '</span></td>';
			}
			content += '<td style="text-align:left">';
			if ("${sessionScope.loginId}" == list[i].id) {
				content += '<a href="javascript:void(0)"; onclick="recommForm('
						+ list[i].commIdx + ')">답글달기</a>&nbsp;&nbsp;';
				content += '<button class="commDel" id="+list[i].commIdx+" onclick="boardCommentDel('
						+ list[i].commIdx + ')">삭제</button></td>'; //댓글삭제호출
			} else if("${sessionScope.loginId}" != list[i].id){
				content += '<a href="#"; onclick="recommForm('+ (list[i].commIdx) + ')">답글달기</a>&nbsp;&nbsp;';
				content += '<a href="#"; onclick="repCommForm('+(list[i].commIdx)+')">신고</a></td>'; 
			}
			content += '</tr>';
			content += '</table>';
			content += "</div>";
			content += "<div id='recommentListDiv"+list[i].commIdx+"'></div>"; //대댓글 리스트 가져올 영역
			boardRecommList(list[i].commIdx); //대댓글 리스트 호출 
		}
		$("#commentListDiv").empty(); //#list안의 내용을 버려라
		$("#commentListDiv").append(content);

	}
	/* 댓글삭제 */
	function boardCommentDel(commIdx) {

		//삭제 confirm	
		if (confirm("정말로 삭제하시겠습니까?")) {
			var reqUrl = "./boardCommDel/" + commIdx;
			$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("success: ", data);
					boardCommentList(); //삭제 후 댓글리스트 요청
				},
				error : function(error) {
					console.log("error:", error);
				}
			});

		} else {
			console.log("삭제취소");
		}
	}
	/* 내가 추천한 댓글 이미지 활성화로 고정*/
	function recCommList() {
		var reqUrl = "./brdrecCommList";
		$.ajax({
			url : reqUrl,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("recCommListsuccess: ", data);
				for (var i = 0; i < data.recCommList.length; i++) {
					console.log(data.recCommList[i].commIdx);
					$("#" + data.recCommList[i].commIdx + "").attr('src','resources/images/recommend.png');
				}
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}
	/*대댓글 창 노출*/
	function recommForm(commIdx) {
		console.log("대댓글달기: " + commIdx);
		var content = "";
		content += '<div id="recommentBox">';
		content += '<span><b id="loginId">${sessionScope.loginId }</b></span>';
		content += '<input type="text" name="recomment" id="recomment" placeholder="답글 작성해주세요."/>';
		content += '<input type="button" value="등록" id="recommentSave" onclick="recommWirte('
				+ commIdx + ')"/>';
		content += '</div>';
		$("#recommentBox").remove();
		$("#commentDiv" + commIdx).after(content);

	}
	/*대댓글 작성*/
	function recommWirte(commIdx) {
		var recomment = $("#recomment").val();
		var loginId = "${sessionScope.loginId }";
		console.log("loginID:" + loginId + "/commIdx" + commIdx + "/recomment:"
				+ recomment);
		if (recomment != '') {

			$.ajax({
				url : "./boardRecommWrite",
				type : "get",
				data : {
					"commIdx" : commIdx,
					"comments" : recomment,
					"loginId" : loginId
				},
				dataType : "JSON",
				success : function(data) {
					console.log(data);
					alert(data.msg);

					$("#recommentBox").remove();
					boardCommentList();
				},
				error : function(error) {
					console.log("recommWirteError:", error);
				}
			});
		}
	}
	/*대댓글 리스트 불러오기*/
	function boardRecommList(commIdx) {
		$.ajax({
			url : "./boardRecommList/" + commIdx,
			type : "get",
			data : {},
			dataType : "JSON",
			success : function(data) {
				console.log("commentsListsuccess: ", data);
				for (var i = 0; i < data.list.length; i++) {
					console.log(data.list[i].commIdx);
					boardRecommPrint(data.list[i]); //대댓글 리스트 뿌리기
				}
				console.log("--------------------------------");
			},
			error : function(error) {
				console.log("error:", error);
			}
		});
	}

	/*대댓글 리스트 뿌리기*/
	function boardRecommPrint(list) {
		var content = "";
		var loginId = "${sessionScope.loginId}";
		content += "<div id='recommentDiv"+list.commIdx+"'>";
		content += "<table class='recommentTable'>";
		content += "<tr>";
		content += '<td  style="width:14%"><b>' + list.id + '</b></td>';
		content += '<td colspan="2" style="text-align:left; min-width:900">';
		content += list.comments;
		content += '</td>';
		content += '</tr>';
		content += '<tr>';
		content += '<td style=" font-size:90%; color:gray; ">';
		var reg_date = new Date(list.reg_date);
		content += reg_date.toLocaleDateString("ko-KR");
		content += '</td>';
		//대댓글삭제
		if (loginId == list.id) {
			content += ' <td  style="text-align:left">';
			content += '<button class="commDel" onclick="boardRecommentDel('
					+ list.com2ndIdx + ')">삭제</button></td>';
					

		} if(loginId != list.id) {
			content += '<td><a href="javascript:void(0)" ; onclick="repRecommForm('+list.com2ndIdx+')">신고</a></td>';
			content += '<td><a href="javascript:void(0)"; onclick="boardReCommRec(';
			content += list.com2ndIdx;
			content +=  ')"><img alt="decommend" src="resources/images/decommend.png" width="15px" height="15px" id="'+list.com2ndIdx+'"> </a></td>';
		}
		content += '</tr>';
		content += '</table>';
		content += "</div>";

		$("#recommentListDiv" + list.commIdx).empty(); //#list안의 내용을 버려라
		$("#recommentListDiv" + list.commIdx).after(content);

	}
	function boardRecommentDel(com2ndIdx) {
		//삭제 confirm	
		if (confirm("정말로 삭제하시겠습니까?")) {

			var reqUrl = "./boardRecommentDel/" + com2ndIdx;
			$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("success: ", data);
					boardCommentList(); //삭제 후 댓글리스트 요청
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
		} else {
			console.log("삭제취소");
		}
	}
	/* 대댓글 추천-취소 */
	function boardReCommRec(com2ndIdx){
		console.log("com2ndIdx: "+com2ndIdx);
		var reqUrl = "./boardReCommRec/"+com2ndIdx;
		$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("commRecSuccess: ", data);
					console.log("rescResult:"+data.recResult);
					if(data.recResult =='true'){
						console.log($("#"+com2ndIdx+""));
						$("#"+com2ndIdx+"").attr('src','resources/images/recommend.png');
						boardRecommList(); //댓글리스트 호출(댓글추천수 새로고침)
					}else{
						console.log($("#"+com2ndIdx+""));
						$("#"+com2ndIdx+"").attr('src','resources/images/decommend.png');
						boardRecommList(); //댓글리스트 호출(댓글추천수 새로고침)
					}
					
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
	}
	/* 댓글 추천-취소 */
	function boardCommRec(commIdx){
		console.log("commIdx: "+commIdx);
		var reqUrl = "./boardCommRec/"+commIdx;
		$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("commRecSuccess: ", data);
					console.log("rescResult:"+data.recResult);
					if(data.recResult =='true'){
						console.log($("#"+commIdx+""));
						$("#"+commIdx+"").attr('src','resources/images/recommend.png');
						boardCommentList(); //댓글리스트 호출(댓글추천수 새로고침)
					}else{
						console.log($("#"+commIdx+""));
						$("#"+commIdx+"").attr('src','resources/images/decommend.png');
						boardCommentList(); //댓글리스트 호출(댓글추천수 새로고침)
					}
					
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
	}
	/* 게시판추천하기*/
	function boardRec(boardIdx){
		console.log("boardIdx: "+boardIdx);
		var reqUrl = "./boardRec/"+boardIdx;
		$.ajax({
				url : reqUrl,
				type : "get",
				data : {},
				dataType : "JSON",
				success : function(data) {
					console.log("Success: ", data);
					console.log("rescResult:"+data.recResult);
					console.log("page:"+data.page);
					if(data.recResult =='true'){
						alert(data.msg);
					
					}else{
						alert(data.msg);
						
					}
					
				},
				error : function(error) {
					console.log("error:", error);
				}
			});
	}
		/* 댓글 신고 새창 */
	function repCommForm(commIdx){
		window.open("./boardRepCommForm/1/"+commIdx,"reportComment","width=800, height=600");
	}
	
	/* 대댓글 신고 새창 */
	function repRecommForm(com2ndIdx){
		window.open("./boardRepCommForm/2/"+com2ndIdx,"reportRecomment","width=800, height=600");
	}
   </script>
</html>
          
   