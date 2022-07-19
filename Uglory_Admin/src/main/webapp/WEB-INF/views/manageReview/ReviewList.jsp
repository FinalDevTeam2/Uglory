<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

    <!-- 회원, 결제, 리뷰 조회 Style sheet -->
    <link href="${contextPath}/resources/css/adminselect-style.css" rel="stylesheet">
    

    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

    <style>
    .openModal:hover{
        cursor: pointer;
    }

    .review_content{
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        width: 460px;
    }
    </style>


</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            
            <!-- Navbar Start -->
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>
            <!-- Navbar End -->


            <!-- 리뷰 관리 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded justify-content-center mx-0 m-5 p-4">
                    <div class="col-lg-12 text-center">
                        <h2 class="text-start">리뷰 관리</h2>
                        <hr>

                        <%-- 검색창 form 태그 --%>
                        <div class="listHead">
                            <form action="selectAll">
                                <select name="key">
                                    <option value="enrollDate">작성일</option>
                                    <option value="customerName">회원 이름</option>
                                </select>

                                <input type="text" name="query" id="reviewSearch">
                                <button type="submit" class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>


                        <%-- 메인 --%>
                        <div class="listBody">
                            <table class="table table-borderless farmTable mt-4">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">글쓴이</th>
                                        <th scope="col">내용</th>
                                    </tr>
                                </thead>
                                <tbody id="reviewList">
                                    <c:forEach var="review" items="${reviewList}">
                                        <tr>
                                            <th scope="row">${review.reviewNo}</th>
                                            <td>${review.enrollDate}</td>
                                            <td>${review.customerName}</td>
                                            <td>
                                                <div class="review_content">${review.reviewContent}</div>
                                            </td>
                                            <td>
                                                <%-- 버튼 클릭시 모달창 open --%>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="openModal">
                                                    <button type="button" class="btn btn-review-detail selectDetail">상세</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>




            <!-- 모달창 -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" style="object-fit: contain;">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            <div class="modal-title" id="exampleModalLabel"></div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body" style="display: flex;">
                            <div class="modal-mainImage">
                                <div>
                                    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">

                                        <div class="carousel-inner">
                                            <div class="carousel-item active" >
                                                <img src="${contextPath}/resources/img/review/review_img1.png" class="d-block w-100" style="object-fit: contain;">
                                            </div>

                                            <div class="carousel-item">
                                                <img src="${contextPath}/resources/img/review/review_img10.png" class="d-block w-100">
                                            </div>

                                            <div class="carousel-item">
                                                <img src="${contextPath}/resources/img/review/review_img11.png" class="d-block w-100">
                                            </div>
                                        </div>

                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>

                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button>

                                    </div>
                                </div>

                                <div class="modal-imgList">
                                    <div><img class="small" src="${contextPath}/resources/img/review/review_img1.png"></div>
                                    <div><img class="small" src="${contextPath}/resources/img/review/review_img10.png"></div>
                                    <div><img class="small" src="${contextPath}/resources/img/review/review_img11.png"></div>
                                    <div class="img4">x</div>
                                </div>

                            </div>
                            
                            <div class="modal-mycontent">
                                <div class="modal-content-info">
                                    
                                    <div>
                                        <div class="info-name-date">
                                            <span>${reviewDetail.customerName}</span>
                                            <span>${reviewDetail.enrollDate}</span>
                                        </div>

                                        <div class="purchase">${reviewDetail.productName}</div>
                                    </div>

                                    <div class="modal-star">
                                        <div class="avgstar">${reviewDetail.starRating}</div>
                                    </div>
            
                                </div>

                                <div class="modal-content-text">
                                    ${reviewDetail.reviewContent}
                                </div>

                                <div class="modal-bottom">
                                    <div class="modal-sub">
                                        <img src="${contextPath}/resources/img/icon/tomato.png" width="50px">
                                        <a href="#">   구독 박스가 궁금하다면? >></a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                style="background-color:rgb(113, 214, 199); border:0; font-weight: bold;">삭제하기</button>
                        </div>

                    </div>
                </div>
            </div>


            <!-- Footer Start -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/review.js"></script>
</body>

</html>