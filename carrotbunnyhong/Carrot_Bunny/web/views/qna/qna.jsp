<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List,com.qna.model.vo.Qna" %>
<%@ page import="com.member.model.vo.Member" %>
<%
	List<Qna> list =(List<Qna>)request.getAttribute("qna");
%>
<%@ include file="../common/header.jsp"%>

<style>
#wrap {
    width: 100%;
    min-height: 700px;
    /* position: relative; */
   
} 
.notice .noticeList {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 900px;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.noticetitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.noticetb {	
    width: 100%;
    margin-top:20px;
    line-height: 35px;
    text-align: center;
    font-size: 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
}

.noticetb th, td {
	border-bottom: 1px solid lightgray;
}

.noticewrite {
	margin-top : 10px;
	float : right;
}


</style>
<div id="wrap">
	
	<div class="notice">
		<!--1:1문의 제목-->
		<div class="noticetitle">
			<p><%=loginMember.getUserName() %> 님의</p>1:1 문의
		</div>
		
		<%if(loginMember.getUserId().equals("admin")) {%>
			
			<!-- 1:1 admin 리스트 -->
			<div class="noticeList">
				<table class="noticetb">
		            <tr>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>작성일</th>
		                <th>답변여부</th>
		            </tr>
					<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="2">등록된 1:1 문의가 없습니다.</td>
						</tr>
					<%}else{ 
						for(Qna q : list){%>
							<tr>
								<td>
									<a href="<%=request.getContextPath()%>/qna/qnaView?qnaNo=<%=q.getQnaNo() %>"><%=q.getQnaTitle() %></a>
								</td>
								<td><%=q.getQnaWriter() %></td>
								<td><%=q.getQnaDate() %></td>
								<%if(q.getQnaAnswer() == null){ %>
									<td style="color: red; font-weight: bold;">답변 대기 중</td>
								<%}else{%>
									<td style="color: blue;">답변완료</td>
								<%}%>
							</tr>
						<%}
					}%>
				</table>
			</div>
			
		<%}else{ %>
			
			<!-- 1:1 USER 리스트 -->
			<div class="noticeList">
				<table class="noticetb">
		            <tr>
		                <th>제목</th>
		                <th>작성일</th>
		                <th>답변여부</th>
		            </tr>
					<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="3">등록된 1:1 문의가 없습니다.</td>
						</tr>
					<%}else{ 
						for(Qna q : list){%>
							<tr>
								<td>
									<a href="<%=request.getContextPath()%>/qna/qnaView?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle() %></a>
								</td>
								<td><%=q.getQnaDate() %></td>
								<%if(q.getQnaAnswer() == null){ %>
									<td style="color: red;">답변 대기 중</td>
								<%}else{%>
									<td style="color: blue;">답변완료</td>
								<%}%>
							</tr>
						<%}
					}%>
				</table>
					<div style="">
						<input class="noticewrite" type="button" value="1:1 문의 등록"
						onclick="location.assign('<%=request.getContextPath()%>/qna/qnaWrite')">
					</div>
			</div>
	            
		<%}%>
		
		
		
		
	</div>
</div>	
	

<%@ include file="../common/footer.jsp"%>