<%-- 
    Document   : newjsp
    Created on : Sep 14, 2024, 4:59:23 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Material Design for Bootstrap</title>
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            />

        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <!-- Custom styles -->
        <style>
            .icon-hover:hover {
                border-color: #3b71ca !important;
                background-color: white !important;
            }

            .icon-hover:hover i {
                color: #3b71ca !important;
            }
        </style>
    </head>
    <body>
        <!--Main Navigation-->
        
            <header>
            <jsp:include page="Header.jsp"></jsp:include>
            <!-- Carousel wrapper -->
            <div id="carouselMaterialStyle" class="carousel slide carousel-fade" data-mdb-ride="carousel" data-mdb-carousel-init>
                <!-- Indicators -->
                <div class="carousel-indicators">
                    <c:forEach var="slider" items="${sliders}" varStatus="status">
                        <button type="button" data-mdb-target="#carouselMaterialStyle" data-mdb-slide-to="${status.index}" 
                                class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index}"></button>
                    </c:forEach>
                </div>

                <!-- Inner -->
                <div class="carousel-inner rounded-5 shadow-4-strong">
                    <c:forEach var="slider" items="${sliders}" varStatus="status">
                        <!-- Single item -->
                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                            <img src="${slider.imageUrl}" class="d-block w-100" alt="..." />
                            <div class="carousel-caption d-none d-md-block">
                                <h5>${slider.title}</h5>
                                <p>${slider.notes}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- Inner -->

                <!-- Controls -->
                <button class="carousel-control-prev" type="button" data-mdb-target="#carouselMaterialStyle" data-mdb-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-mdb-target="#carouselMaterialStyle" data-mdb-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Carousel wrapper -->
        </header>
        <!-- Products -->
        <section>
            <div class="container my-5">
                <header class="mb-4 d-flex justify-content-between align-items-center">
                    <h3>New products</h3>
                    <a href="public/list-product" class="btn btn-link text-primary">See more</a>
                </header>

                <div class="row">
                    <c:forEach items="${products}" var="p">

                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card my-2 shadow-0">
                                <a href="public/product-detail?id=${p.productId}" class="">
                                    <c:if test="${p.listProductDetail[0].discount != null && p.listProductDetail[0].discount != 0}">
                                        <div class="mask" style="height: 50px;">
                                            <div class="d-flex justify-content-start align-items-start h-100 m-2">
                                                <h6><span class="badge bg-danger pt-1">New</span></h6>
                                            </div>
                                        </div>
                                    </c:if>

                                    <img src="${p.listProductDetail[0].imageURL}" class="card-img-top rounded-2" style="aspect-ratio: 1 / 1"/>
                                </a>
                                <div class="card-body p-0 pt-3">
                                    <h5 class="card-title">${p.productName}</h5>
                                    <p class="card-text mb-0">${p.listProductDetail[0].price}</p>
                                    <!--                                <p class="text-muted">
                                                                        Model: X-200
                                                                    </p>-->
                                    <div
                                        class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto"
                                        >
                                        <a href="public/product-detail?id=${p.productId}" class="btn btn-primary shadow-0 me-1">View detail</a>
                                    </div>
                                </div
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </div>
        </section>
        <!-- Products -->


        <!-- Blog -->
        <section class="mt-5 mb-4">
            <div class="container text-dark">
                <header class="mb-4 d-flex justify-content-between align-items-center">
                    <h3>Blog posts</h3>
                    <a href="marketing/list-post" class="btn btn-link text-primary">See more</a>
                </header>

                <div class="row">

                    <c:forEach var="post" items="${posts}" begin="0" end="3" step="1">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                            <article>
                                <a href="public/post-detail?id=${post.id}" class="img-fluid">
                                    <img
                                        class="rounded w-100"
                                        src="${post.imgURL}"
                                        style="object-fit: cover"
                                        height="160"
                                        alt="${post.title}"
                                        />
                                </a>
                                <div class="mt-2 text-muted small d-block mb-1">
                                    <span>
                                        <i class="fa fa-calendar-alt fa-sm"></i>
                                        23.12.2022
                                    </span>
                                    <a href="#"><h6 class="text-dark">${post.title}</h6></a>
                                    <p>
                                        ${fn:substring(post.content, 0, 50)}...
                                    </p>
                                </div>
                            </article>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        <!-- Blog -->

        <!-- Footer -->
        <footer
            class="text-center text-lg-start text-muted mt-3"
            style="background-color: #f5f5f5"
            >
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start pt-4 pb-4">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-12 col-lg-3 col-sm-12 mb-2">
                            <!-- Content -->
                            <a href="https://mdbootstrap.com/" target="_blank" class="">
                                <img
                                    src="Image/logo.png"
                                    height="35"
                                    />
                            </a>
                            <p class="mt-2 text-dark">© 2024 Copyright: SWP391 - FPT University</p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Store</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">About us</a></li>
                                <li><a class="text-muted" href="#">Find store</a></li>
                                <li><a class="text-muted" href="#">Categories</a></li>
                                <li><a class="text-muted" href="#">Blogs</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Information</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">Help center</a></li>
                                <li><a class="text-muted" href="#">Money refund</a></li>
                                <li><a class="text-muted" href="#">Shipping info</a></li>
                                <li><a class="text-muted" href="#">Refunds</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Support</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">Help center</a></li>
                                <li><a class="text-muted" href="#">Documents</a></li>
                                <li><a class="text-muted" href="#">Account restore</a></li>
                                <li><a class="text-muted" href="#">My orders</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-12 col-sm-12 col-lg-3">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Newsletter</h6>
                            <p class="text-muted">
                                Stay in touch with latest updates about our products and offers
                            </p>
                            <div class="input-group mb-3">
                                <input
                                    type="email"
                                    class="form-control border"
                                    placeholder="Email"
                                    aria-label="Email"
                                    aria-describedby="button-addon2"
                                    />
                                <button
                                    class="btn btn-light border shadow-0"
                                    type="button"
                                    id="button-addon2"
                                    data-mdb-ripple-color="dark"
                                    >
                                    Join
                                </button>
                            </div>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

        </footer>
        <!-- Footer -->
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
        <!-- Custom scripts -->
        <script type="text/javascript">

        </script>
    </body>
</html>

