<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

    <%-- favicon --%>
    <link rel="icon" href="${contextPath}/resources/img/main/logo/favicon.ico" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style-1.css" rel="stylesheet">
    
    <link href="${contextPath}/resources/css/member/member.css" rel="stylesheet">
    
</head>
<body>
    
    <main class="main">

    <jsp:include page="/WEB-INF/views/common/header-1.jsp" />

        <section class="subscribe">
        
        <form action="subscriptionStatus" method="POST" name="myPage-subscription" onsubmit="return subscriptionCancelValidate()">
            
            <div>
                <h1 class="subscribe-text" style="margin-bottom: 2.5rem;">??? ?????? ??????</h1>
            </div>
                <%-- ?????? ????????? ?????? ???  --%>
                <c:if test="${subCount == 0}">
                <div class=sub-area>
                    <div class="subscribe-box-1">
                        <div class="subscribe-situation">
                            <p>?????? ?????? ????????? ?????????!!</p>
                        </div>

                        <div class="subscribeBtn" style="padding-top: 35px;">
                            <button type="button" class="subscribe-btn" onclick="location.href='${contextPath}/subscription'">???????????? ????????????</button>
                        </div>
                    </div>
                </div>   
                </c:if>
                

                <%-- ?????? ????????? ?????? ???  --%>

            

                <c:if test="${subCount > 0}">
                    <div class=sub-area>

                        <div class="subscribe-box">
                            
                            <div style="padding-top:45px; padding-left:100px; font-size:20px; font-weight:bold;">
                                <p>${substatus.memberName} ?????????</p>
                                <p>${substatus.subName} ?????? </p>
                                <p>${substatus.subCycle}??? ?????? ?????? ??? ?????????.</p>
                            </div>

                            <c:if test="${substatus.subName == '????????????'}">

                                <div class= "subBox">
                                    <img src="${contextPath}/resources/img/product/standard.png" style="width:250px; height:180px">
                                </div>

                            </c:if>

                            <c:if test="${substatus.subName == '??????'}">

                                <div class= "subBox">
                                    <img src="${contextPath}/resources/img/product/jumbo.png" style="width:250px; height:180px">
                                </div>

                            </c:if>

                            <div class="subscribeBtn">
                                <button type="submit" class="subscribe-btn">???????????? ?????? ??????</button>
                            </div>
                        </div>


                    </div>
                </c:if>

            </form>



        </section>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <%-- <!??? jQuery ?????? ???> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    
    
    <%-- Template Javascript --%>
    <%-- <script src="${contextPath}/resources/js/main.js"></script> --%>
    <script src="${contextPath}/resources/js/member/subscriptionStatus.js"></script>
</body>
</html>