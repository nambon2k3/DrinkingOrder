<%-- 
    Document   : Header
    Created on : Sep 15, 2024, 2:12:19 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Jumbotron -->
<div class="p-3 text-center bg-white border-bottom">
    <div class="container">
        <div class="row gy-3">
            <!-- Left elements -->
            <div class="col-lg-2 col-sm-4 col-4">
                <a
                    href="${pageContext.request.contextPath}/home"
                    class="float-start"
                    >
                    <img
                        src="${pageContext.request.contextPath}/Image/logo.png"
                        height="35"
                        />
                </a>
            </div>
            <!-- Left elements -->

            <!-- Center elements -->
            <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                <div class="d-flex float-end">

                    <a
                        href="https://github.com/mdbootstrap/bootstrap-material-design"
                        class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
                        target="_blank"
                        >
                        <i class="fas fa-heart m-1 me-md-2"></i>
                        <p class="d-none d-md-block mb-0">Wishlist</p>
                    </a>
                    <a
                        href="https://github.com/mdbootstrap/bootstrap-material-design"
                        class="border rounded py-1 px-3 nav-link d-flex align-items-center"
                        target="_blank"
                        >
                        <i class="fas fa-shopping-cart m-1 me-md-2"></i>
                        <p class="d-none d-md-block mb-0">My cart</p>
                    </a>
                    <c:if test="${sessionScope.user == null}">
                        <a
                            href="${pageContext.request.contextPath}/login"
                            class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
                            >
                            <i class="fas fa-user-alt m-1 me-md-2"></i>
                            <p class="d-none d-md-block mb-0">Login</p>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <div class="btn-group">
                            <button type="button" class="btn btn-link dropdown-toggle" data-mdb-dropdown-init data-mdb-ripple-init aria-expanded="false">
                                <img src="${sessionScope.user.avatar}" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 18px;">
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/common/profile">Profile</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Log out</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- Center elements -->

            <!-- Right elements -->
            <div class="col-lg-5 col-md-12 col-12">
                <div class="input-group float-center">
                    <div class="form-outline">
                        <input type="search" id="form1" class="form-control" />
                        <label class="form-label" for="form1">Search</label>
                    </div>
                    <button type="button" class="btn btn-primary shadow-0">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
            <!-- Right elements -->
        </div>
    </div>
</div>

