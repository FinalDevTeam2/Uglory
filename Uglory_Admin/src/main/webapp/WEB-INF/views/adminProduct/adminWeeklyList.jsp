<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${!empty mapT}">
    <c:set var="thisWeek" value="${mapT.weeklyList}"/>
    <c:set var="thisProductList" value="${mapT.weeklyProductList}"/>
</c:if>
<c:if test="${!empty mapN}">
    <c:set var="nextWeek" value="${mapN.weeklyList}"/>
    <c:set var="nextProductList" value="${mapN.weeklyProductList}"/>
</c:if>
<c:if test="${!empty mapA}">
    <c:set var="afterWeek" value="${mapA.weeklyList}"/>
    <c:set var="afterProductList" value="${mapA.weeklyProductList}"/>
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uglory</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextPath}/resources/img/favicon.ico" rel="icon">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    
    <!-- Product Style sheet -->
    <link href="${contextPath}/resources/css/adminproduct-style.css" rel="stylesheet">

    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner include -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>

        <!-- Sidebar include -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

        <!-- Content Start -->
        <div class="content">

            <!-- Header include -->
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>

            <!-- 구독 상품 목록 조회 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row rounded justify-content-center mx-0 m-5 p-4">
                    <article class="col-lg-12 text-center">
                        <h2 class="text-start">구독 상품 알림</h2>
                        <hr>

                        <div class="pListBody">

                            <div class="col-xl-4 p-4">
                                <div class="pList-tit m-2">이번주 배송 상품</div>                           
                                <div class="text-start p-3 dl-date">배송예정일 : ${thisWeek.deliveryDate}</div>                           
                                <ul class="pListBox">

                                    <c:if test="${!empty thisProductList}">
                                    
                                        <c:forEach var="product" items="${thisProductList}">
                                            <li>
                                                <p>${product.productName}</p>
                                                <p>${product.optionName}</p>
                                            </li>
                                        </c:forEach>
                                    </c:if>
    
                                </ul>
    
                                <div class="p-btn-area">
                                    <button type="button" class="btn btn-primary">알림</button>
                                    <i class="fa-solid fa-lightbulb text-warning" style="font-size:36px;"></i>
                                </div>                           
                            </div>

                            <div class="col-xl-4 p-4">
                                <div class="pList-tit m-2">다음주 배송 상품</div>                           
                                <div class="text-start p-3 dl-date">배송예정일 : ${nextWeek.deliveryDate}</div>                           
                                <ul class="pListBox">
                                    
                                    <c:choose>
                                        <c:when test="${!empty nextProductList}">
                                        
                                            <c:forEach var="product" items="${nextProductList}">
                                                <li>
                                                    <p>${product.productName}</p>
                                                    <p>${product.optionName}</p>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                    
                                        <c:otherwise>
                                                <li class="row justify-content-center" style="color:#ccc; font-size:24px;">상품을 등록해주세요</li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
    
                                <div class="p-btn-area">
                                    <c:choose>
                                        <c:when test="${!empty nextProductList}">
                                            <div>
                                                <button type="button" class="btn btn-primary" onclick="location.href='register?mode=update&ex=${nextWeek.expectedUploadDate}'">수정</button>
                                                <button type="button" class="btn btn-primary">알림</button>
                                            </div>
                                            <i class="fa-solid fa-lightbulb text-warning" style="font-size:36px;"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <div>
                                                <button type="button" class="btn btn-primary" onclick="location.href='register?mode=insert&ex=N'">등록</button>
                                                <button type="button" class="btn btn-secondary">알림</button>
                                            </div>
                                            <i class="fa-regular fa-lightbulb text-warning" style="font-size:36px;"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                           
                            </div>

                            <div class="col-xl-4 p-4">
                                <div class="pList-tit m-2">다다음주 배송 상품</div>                           
                                <div class="text-start p-3 dl-date">배송예정일 : ${afterWeek.deliveryDate}</div>                           
                                <ul class="pListBox">
                                    <c:choose>
                                        <c:when test="${!empty afterProductList}">
                                            <c:forEach var="product" items="${afterProductList}">
                                                <li>
                                                    <p>${product.productName}</p>
                                                    <p>${product.optionName}</p>
                                                </li>
                                            </c:forEach>
                                        </c:when>

                                        <c:otherwise>
                                            <li class="row justify-content-center" style="color:#ccc; font-size:24px;">상품을 등록해주세요</li>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
    
                                <div class="p-btn-area">
                                    <c:choose>
                                        <c:when test="${!empty afterProductList}">
                                            <button type="button" class="btn btn-primary" onclick="location.href='register?mode=update&ex=${afterWeek.expectedUploadDate}'">수정</button>
                                            <i class="fa-solid fa-lightbulb text-warning" style="font-size:36px;"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="btn btn-primary" onclick="location.href='register?mode=insert&ex=A'">등록</button>
                                            <i class="fa-regular fa-lightbulb text-warning" style="font-size:36px;"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                           
                            </div>
                            
                        </div>
                    </article>
                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <%-- <script src="${contextPath}/resources/lib/chart/chart.min.js"></script> --%>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>  

</body>

</html>