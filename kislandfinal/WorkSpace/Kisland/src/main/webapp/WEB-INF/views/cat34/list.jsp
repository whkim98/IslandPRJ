<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/WEB-INF/views/layout/header.jsp" %>
   
    
<script type="text/javascript">
	
function check(f) {
	
	if(f.type.value == "num"){
		var num_pattern = /^[0-9]{1,20}$/;
		
		if(f.word.value == "" || !num_pattern.test(f.word.value)){
			alert("글번호를 입력하십시오!");
			return false;
		}
	}else if(f.word.value == ""){
		alert("검색어를 입력하십시오!");
		return false;
	}
	
	return true;
}

</script>    

<style>

.slider{
    width: 640px;
    height: 480px;
    position: relative;
    margin: 0 auto;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}

.slider input[type=radio]{
    display: none;
}

.slider ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;    
}
.slider ul.imgs li{
    position: absolute;
    left: 640px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */

    padding: 0;
    margin: 0;
}

.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}

</style>


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
			<div class="card-content">
   				<div class="table-responsive"> 
					<div align="center">

						<table class="gallerytable">
							<tr>
								<th clospan="4">제목</th>
								<td clospan="4">${vo.MNGBRD_TITLE }</td> <!-- map에서는 key값을 대문자로 받아 오기 때문에 대문자로 입력해야 오류가 나지 않음 -->
							</tr>
							<tr>
								<th>조회수</th>
								<td>${vo.MNGBRD_HIT }</td>
								<th>작성일</th>
								<fmt:parseDate value="${vo.MNGBRD_DATE }" var="mngDate" pattern="yyyy-MM-dd HH:mm"/>
								<td><fmt:formatDate value="${mngDate }" pattern="yyyy-MM-dd HH:mm"/></td>
							</tr>
							<tr>
								<td colspan="4">
									${vo.MNGBRD_CONTENT}
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<a href="${pageContext.request.contextPath }/resources/upload/${vo.MNGBRD_FILE}" download>${vo.MNGBRD_FILE}</a> 
								</td>
							</tr>
						</table>
		
						<c:if test="${!empty mngcheck }">
							<div class="btnBox">
								<button class="btn" onclick="document.location.href='${pageContext.request.contextPath }/cat34/writeform'">관리자 글쓰기</button>
								<input class="btn" type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/cat34/updateform?no=${vo.NO}'">
								<input class="btn" type="button" value="삭제" onclick="deleteAction()">
							</div>
						</c:if>





		<div class="slider">
		
			<input type="radio" name="slide" id="slide1" checked>
		    <input type="radio" name="slide" id="slide2">
		    <input type="radio" name="slide" id="slide3">
		    <input type="radio" name="slide" id="slide4">
	    
		    <ul id="imgholder" class="imgs">
		        <li><img src="${pageContext.request.contextPath }/resources/upload/materials/mainlogo.png"></li>
		        <li><img src="${pageContext.request.contextPath }/resources/upload/materials/mainlogo.png"></li>
		        <li><img src="${pageContext.request.contextPath }/resources/upload/materials/mainlogo.png"></li>
		        <li><img src="${pageContext.request.contextPath }/resources/upload/materials/mainlogo.png"></li>
		    </ul>
		    
		    <div class="bullets">
		        <label for="slide1">&nbsp;</label>
		        <label for="slide2">&nbsp;</label>
		        <label for="slide3">&nbsp;</label>
		        <label for="slide4">&nbsp;</label>
		    </div>
		</div>
				<div>
				<c:choose>
		
			<c:when test="${list == null}">
				<tr>
					<td colspan="5" align="center">
						<span style="font-weight: bold;">작성한 글이 없습니다.</span>
					</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td class="center">${dto.num}</td>
						<td class="center">${dto.mngbrd_part}</td>
						<td class="center"><a href="${pageContext.request.contextPath }/cat34/content?no=${dto.no}">${dto.mngbrd_title}</a></td>
						<td class="center">${dto.manager_name }</td>
						<fmt:parseDate value="${dto.mngbrd_date }" var="mngDate" pattern="yyyy-MM-dd"/>
						<td class="center"><fmt:formatDate value="${mngDate}" pattern="yyyy-MM-dd"/></td>
						<td class="center">${dto.mngbrd_hit }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
		</c:choose>
		</div>

	
					</div>	
				</div>	
			</div>	
		</div>	
	</div>	
</div>	

	
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>		





