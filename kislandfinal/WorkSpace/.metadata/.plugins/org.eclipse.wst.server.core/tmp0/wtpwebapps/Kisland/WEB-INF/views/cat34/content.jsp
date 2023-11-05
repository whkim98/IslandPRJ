<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	
	function deleteAction() {
		var check = confirm("삭제 하시겠습니까?");
		
		if(!check){
			return;
		}
		
		location.href = '${pageContext.request.contextPath }/cat34/delete?no=${vo.NO}';
	}
	
</script>

<%@include file="/WEB-INF/views/layout/header.jsp"%>
<%@ include file="/WEB-INF/views/layout/header_cat3.jsp" %>

<div class="main_image">
     <a href="${pageContext.request.contextPath}/cat34/list?mngbrd_ctgrno=34"> <img src="${pageContext.request.contextPath }/resources/photo/sum.jpg" width="100%" height="250px">
</a>
    <h1 class="main_image_text" style="font-size:30px">아름다운섬풍경</h1>

</div>
<br>
<div class="main"> 
	<div id="page-inner">  
		 <div class="row"> 
		

	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
		<tr>
			<th>제목</th>
			<td>${vo.MNGBRD_TITLE }</td> <!-- map에서는 key값을 대문자로 받아 오기 때문에 대문자로 입력해야 오류가 나지 않음 -->
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.MANAGER_NAME }</td>
			<th>작성일</th>
			<fmt:parseDate value="${vo.MNGBRD_DATE }" var="mngDate" pattern="yyyy-MM-dd HH:mm"/>
			<td><fmt:formatDate value="${mngDate }" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
		<tr>
			<td colspan="4">
				${vo.MNGBRD_CONTENT }
			</td>
		</tr>
	</table>
		
		<input type="button" value="이전" onclick="history.back()">
		<button class="btn" onclick="document.location.href='${pageContext.request.contextPath }/cat34/writeform'">글쓰기</button>
		
		<c:if test="${!empty mngcheck }">
			<div class="btnBox">
				<button class="btn" onclick="document.location.href='${pageContext.request.contextPath }/cat34/writeform'">관리자 글쓰기</button>
				<input class="btn" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/cat34/updateform?no=${vo.NO}'">
				<input class="btn" type="button" value="삭제" onclick="deleteAction()">
			</div>
		</c:if>
		</div>
	
</div>
</div>
</div>

<%@include file="/WEB-INF/views/layout/footer.jsp"%>
















