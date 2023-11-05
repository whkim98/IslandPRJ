<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Morris Chart Styles-->
    <link href="${pageContext.request.contextPath }/resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
 
  <style type="text/css">
	.main_image {
    position: relative;
  }
  .main_image_text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
  }
  .main {
	width: 800px;
	min-height: 400px;
	padding-top: 15px;
}
.ckid {
	float: left;
}

.ckid_text {
	font-size: 10px;
}


/*cat34*/
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
    transition-delay: 1s;

    padding: 0;
    margin: 0;
}
  
  
</style>