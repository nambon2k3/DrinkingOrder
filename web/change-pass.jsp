
<%-- 
    Document   : profile
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
            <!-- Jumbotron -->
            <jsp:include page="Header.jsp"></jsp:include>
                <!-- Jumbotron -->


            </header>
            <!-- Products -->

            <!-- Products -->

            <div class="container w-100 d-flex justify-content-center my-5">

                <div class="card">
                    <div class="card-header">
                        <h3>Change password</h3>
                    </div>
                    <div class="w-100 text-center">
                        <div class="text-success ư" style="visibility: ${param.success ne null ? 'visiable' : 'hidden'}" role="alert">
                        Success!
                    </div>
                    <div class="text-danger" style="display: ${param.fail ne null ? 'block' : 'none'}" role="alert">
                        Failed!
                    </div>

                </div>
                <div class="card-body">
                    <form id="profileForm" action="change-pass" method="post">
                        <!-- Hidden Fields -->
                        <input type="hidden" id="id" name="id" value="${user.id}">
                        <input type="hidden" id="password" name="check-password" value="${user.password}">

                        <div class="form-group">
                            <label for="email">Old password:</label>
                            <input type="password" class="form-control" name="oldpassword" value="" required>
                        </div>

                        <div class="form-group">
                            <label for="email">New password:</label>
                            <input type="password" class="form-control" name="password" value="" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Retype password:</label>
                            <input type="password" class="form-control" name="repassword" value="" required>
                        </div>


                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary mt-2">Submit</button>

                        <!-- Go Back Button -->
                        <a href="profile" class="btn btn-secondary mt-2 ms-5">Go Back</a>
                    </form>
                </div>
            </div>
        </div>

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
                                    src="${pageContext.request.contextPath}/Image/logo.png"
                                    height="35"
                                    />
                            </a>
                            <p class="mt-2 text-dark">© 2023 Copyright: SWP391 - FPT University</p>
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


