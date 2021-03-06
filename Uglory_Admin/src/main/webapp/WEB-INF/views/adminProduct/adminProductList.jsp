<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            <!-- 상품 목록 조회 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row justify-content-center mx-0 m-5 p-4">
                    <h2>상품 목록</h2>
                    <!-- 카테고리 분류 -->
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active" id="nav-root-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-root" type="button" role="tab" aria-controls="nav-root"
                                aria-selected="true">근채류</button>
                            <button class="nav-link" id="nav-beans-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-beans" type="button" role="tab"
                                aria-controls="nav-beans" aria-selected="false">곡식류/견과류</button>
                            <button class="nav-link" id="nav-veg-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-veg" type="button" role="tab"
                                aria-controls="nav-veg" aria-selected="false">채소류</button>
                            <button class="nav-link" id="nav-fnv-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-fnv" type="button" role="tab"
                                aria-controls="nav-fnv" aria-selected="false">과채류</button>
                            <button class="nav-link" id="nav-herbs-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-herbs" type="button" role="tab"
                                aria-controls="nav-herbs" aria-selected="false">나물류</button>
                            <button class="nav-link" id="nav-mush-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-mush" type="button" role="tab"
                                aria-controls="nav-mush" aria-selected="false">버섯류</button>
                            <button class="nav-link" id="nav-fruit-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-fruit" type="button" role="tab"
                                aria-controls="nav-fruit" aria-selected="false">과일류</button>
                        </div>

                    </nav>

                    <!-- 상품 리스트 시작 -->
                    <article class="tab-content pt-3" id="nav-tabContent">
                        <!-- root 시작 -->
                        <div class="tab-pane fade show active" id="nav-root" role="tabpanel" aria-labelledby="nav-root-tab">
                            
                            <div class="listBody" id="rootBox">
                            </div>
                        </div>

                        <!-- beans 시작 -->
                        <div class="tab-pane fade" id="nav-beans" role="tabpanel" aria-labelledby="nav-beans-tab">

                            <div class="listBody" id="beansBox">
                            </div>

                        </div>

                        <!-- veg 시작 -->
                        <div class="tab-pane fade" id="nav-veg" role="tabpanel" aria-labelledby="nav-veg-tab">

                            <div class="listBody" id="vegBox">
                            </div>

                        </div>

                        <!-- fnv 시작 -->
                        <div class="tab-pane fade" id="nav-fnv" role="tabpanel" aria-labelledby="nav-fnv-tab">

                            <div class="listBody" id="fnvBox">
                            </div>

                        </div>

                        <!-- herbs 시작 -->
                        <div class="tab-pane fade" id="nav-herbs" role="tabpanel" aria-labelledby="nav-herbs-tab">

                            <div class="listBody" id="herbsBox">
                            </div>

                        </div>

                        <!-- mush 시작 -->
                        <div class="tab-pane fade" id="nav-mush" role="tabpanel" aria-labelledby="nav-mush-tab">

                            <div class="listBody" id="mushBox">
                            </div>

                        </div>

                        <!-- fruit 시작 -->
                        <div class="tab-pane fade" id="nav-fruit" role="tabpanel" aria-labelledby="nav-fruit-tab">

                            <div class="listBody" id="fruitBox">
                            </div>

                        </div>

                    </article>
                    <!-- 상품 리스트 끝-->

                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        </div>
        <!-- Content End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <script>
        const contextPath = '${contextPath}';
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <%-- <script src="../lib/chart/chart.min.js"></script> --%>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>  
    <script src="${contextPath}/resources/js/adminProduct.js"></script>  

</body>

</html>