<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SubscriptionStatus</title>

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
            <div>
                <h1 class="subscribe-text">내 구독 정보</h1>
            </div>

                <%-- 구독 상품이 없을 때  --%>
                <c:if test="${substatus.subCount == 0}">
                <div class=sub-area>
                    <div class="subscribe-box">
                        <div class="subscribe-situation">구독 중인 박스가 없어요!!</div>
                    </div>

                    <div class="subscribeBtn">
                        <button type="button" class="subscribe-btn" onclick="location.href='${contextPath}/SubscriptionStatus'">어글로리 구독하기</button>
                    </div>
                </div>
                </c:if>
                

                <%-- 구독 상품이 있을 때  --%>
                <c:if test="${substatus.subCount == 1}">
                    <div class=sub-area>

                        <div class="subscribe-box">
                            
                            <div style="padding-top:30px; padding-left:64px; font-weight:bold;">
                                <p>${substatus.memberName} 고객님</p>
                                <p>[${substatus.subName}]</p>
                                <p>[${substatus.subCycle }] 이용 중 입니다.</p>
                            </div>

                            <div class="subscribeBtn">
                                <a href="${contextPath}/member/subscriptionStatus" id="subCancle-btn" class="subscribe-btn">어글로리 구독 취소</a>
                                <button class="subscribe-btn" onclick="location.href='${contextPath}/SubscriptionStatus'">어글로리 구독 취소</button>
                            </div>
                        </div>


                    </div>
                </c:if>

            </form>



        </section>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>