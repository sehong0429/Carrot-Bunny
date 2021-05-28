<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.qna.model.vo.Qna"%>
<%
Qna q = (Qna) request.getAttribute("qna");
%>
<%@ include file="../common/header.jsp"%>

<style>
section#notice-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#notice-container h2 {
	margin: 10px 0;
}

table#tbl-notice {
	width: 500px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-notice th {
	width: 125px;
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

table#tbl-notice td {
	border: 1px solid;
	padding: 5px 0 5px 10px;
	text-align: left;
}

textarea {
	width : 88%;
	height : auto;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}
</style>
<div id="notice-container">
	<div class="noticetitle">
	<p>1:1 문의 등록</p>
	</div>
	<form name="qnaWrite"
		action="<%=request.getContextPath()%>/qna/qnaWriteEnd"
		method="post">
	<table id="tbl-notice">
		<tr>
			<th>문의 제목</th>
			<td><textarea name="qnaTitle" id="qnaTitle" required> </textarea>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td><textarea name="qnaContent" id="qnaContent" required></textarea><br></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="문의 등록하기"></th>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../common/footer.jsp"%>