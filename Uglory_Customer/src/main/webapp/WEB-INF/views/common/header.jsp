<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 이미지 있는 헤더 --%>
<header>

    <div class="container-xxl bg-white p-0">
        <%-- <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End --> --%>

        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand">
                    <span class="text-primary m-0">
                        <i class="me-3" style="font-size:30px"></i>
                        <img src="${contextPath}/resources/img/main/logo/Uglory_farmar.png">
                        <img src="${contextPath}/resources/img/main/logo/Uglory_whitecali.png" width="150px">
                    </span>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="${contextPath}" class="nav-item nav-link active">Home</a>
                        <a href="${contextPath}/common/mission" class="nav-item nav-link">Mission</a>
                        <a href="${contextPath}/common/about" class="nav-item nav-link">About</a>
                        <a href="${contextPath}/product/list" class="nav-item nav-link">Market</a>
                        <a href="${contextPath}/review/list" class="nav-item nav-link icon">Review</a>
                    </div>
                    <a href="${contextPath}/product/cart" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/shopping-cart-white.png"></a>
                    <c:choose>

                        <c:when test="${empty sessionScope.loginMember}">
                            <a href="${contextPath}/member/login" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/user-white.png"></a>
                        </c:when>

                        <c:otherwise>
                            <a href="${contextPath}/member/myPage" class="nav-item icon"><img class="menu-chart" src="${contextPath}/resources/img/main/user-white.png"></a>
                        </c:otherwise>

                    </c:choose>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container my-5 py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft">REAP EVERY CROP<br></h1>
                            <p class="text-white animated slideInLeft mb-4 pb-2">
                                There is no fruit that is not precious.<br>
                                We sell products that are discarded<br>
                                because they have no problem with taste and nutrition<br>
                                but do not meet consumer standards.<br>
                                We want to change the structure that lowers farmers' incomes,<br>
                                generates a lot of waste and creates unnecessary waste.<br> 
                                ALL CROPS ARE PRECIOUS!</p>
                            <a href="${contextPath}/subscription" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">SUBSCRIBE</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                            <img class="img-fluid" src="${contextPath}/resources/img/main/vagetable.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>