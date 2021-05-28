<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
<div id="notice-container">
	<form action="<%=request.getContextPath() %>/board/boardWriteEnd" 
    method="post" enctype="multipart/form-data">
        <table id="tbl-notice">
        <tr>
            <th>첨부파일</th>
            <td>
            	<input type="file" name="boardFilepath1" >
            </td>
        </tr>
        <tr>
            <th>상품명</th>
            <td><input type="text" name="boardTitle" id="noticeTitle" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>
	            <input type="text" name="boardWriter" id="noticeWrite" 
	            value="<%=loginMember.getUserId()%>" readonly>
            </td>
        </tr>
        <tr>
            <th>상품가격</th>
            <td><input type="text" name="boardPrice" id="noticePrice" required>원</td>
        </tr>
        <tr>
            <th>가격협의 가능</th>
            <td>
            	<input type="checkbox" name="boardIsNego" value="가능" id="isNego"><label for="isNego">가능</label>
        	</td>
        </tr>
        <tr>
            <th>수량</th>
            <td><input type="text" name="boardAmount" id="noticeAmount" required>개</td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea rows="5" cols="50" name="boardContent"></textarea></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="submit" value="등록하기" onclick="">
            </th>
        </tr>
    	</table>
    </form>
</div>




<%@ include file="../common/footer.jsp"%>