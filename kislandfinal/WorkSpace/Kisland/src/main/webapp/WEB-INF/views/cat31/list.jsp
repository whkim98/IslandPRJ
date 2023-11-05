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


<%@ include file="/WEB-INF/views/layout/header_cat3.jsp" %>

<div class="main_image">
     <a href="${pageContext.request.contextPath}/cat31/list?mngbrd_ctgrno=31"> <img src="${pageContext.request.contextPath }/resources/photo/sum.jpg" width="100%" height="250px">
</a>
    <h1 class="main_image_text" style="font-size:30px">섬정보검색</h1>

</div>
<br>
<div class="main"> 	
	<div id="page-inner">  
		<div class="row">
			<div class="card-content">
				<div class="table-responsive"> 
					<div align="center">
					
						<c:if test="${!empty mngcheck }">
							<div class="btnBox">
								<button class="btn" onclick="document.location.href='${pageContext.request.contextPath }/cat31/writeform'">섬정보업데이트</button>
							</div>
						</c:if>
						
						<div class="col-md-4 mb-3">
						<form action="${pageContext.request.contextPath }/cat31/list" method="get" onsubmit="return check(this)" >
							<span style="float: center;">
								<select name="type" class="form-control input-sm">
									<option value="no" ${param.type == 'no' ? 'selected' : '' }>글번호로 검색</option>
									<option value="island_name" ${param.type == 'island_name' or empty param.type ? 'selected' : '' }>섬 이름으로 검색</option>
									<option value="island_addr" ${param.type == 'island_addr' ? 'selected' : '' }>주소로 검색</option>
								</select>
							</span>
								<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word}" autocomplete="off">
								<input class="btn" type="submit"  value="검색">
						</form>
						</div>

						<table class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead>
							<tr>
								<th class="center">번호</th>
								<th class="center">섬이름</th>
								<th class="center">주소</th>
								<th class="center">유/무인도</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
							
								<c:when test="${list == null}">
									<tr>
										<td colspan="5" align="center">
											<span style="font-weight: bold;">섬 정보가 없습니다.</span>
										</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="dto" items="${list }">
										<tr>
											<td class="center">${dto.no}</td>
											<td class="center"><a href="${pageContext.request.contextPath}/cat31/content?no=${dto.no}">${dto.island_name}</a></td>
											<td class="center">${dto.island_addr}</td>
											
											<c:choose>
												<c:when test="${island_inhabited == 1}">
													<td>유인도</td>
												</c:when>
												<c:otherwise>
													<td>무인도</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
								
							</c:choose>
							</tbody>
						</table>
			
						<br>

					</div>	
				</div>	
			</div>	
		</div>	
	</div>	
</div>	

	
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>		





