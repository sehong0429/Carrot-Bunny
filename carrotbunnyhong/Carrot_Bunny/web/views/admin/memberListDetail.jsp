<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
Member m = (Member) request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp"%>
<style>
#tbl-member {
	width: 90%;
	min-height: 300px;
	/* position: relative; */
}

.members .memberlist {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height: 500px;
}

.membertitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.membertb p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.membertb {
	width: 100%;
	margin-top: 20px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
}

.memberlistbtn{
	text-align:center;
	margin-top : 10px;

}
</style>

<div id="tbl-member">

	<div class="members">
		<div class="membertitle">회원상세</div>

		<!-- 회원 리스트 -->
		<div class="memberlist">
			<table class="membertb">
				<p align="center">관리자는 비매너 회원, 부적절한 게시물을 올린 회원을 삭제 할 수 있습니다.</p>
				<!-- <thead> -->
				<tr>
					<th>회원번호</th>
					<td><%=m.getmemberNum()%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=m.getUserName()%></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><%=m.getPhone()%></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><%=m.getenrollDate()%></td>
				</tr>
			</table>
			<div class ="memberlistbtn">
				<input type="button" value="목록"
					style="width: 50px; height: 30px;"
					onclick="location.assign('<%=request.getContextPath()%>/memberList')"></input>
				<input type="button" value="삭제" style="width: 50px; height: 30px;"
					onclick="fn_delete_member();"> 
			</div>
		</div>
	</div>
</div>

	<script>
	
	const fn_delete_member=()=>{
		if(confirm("정말로 삭제하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/adminupdatemember?memberNum="+'<%=m.getmemberNum()%>');
		}
	}
	</script>




<%@ include file="/views/common/footer.jsp"%>