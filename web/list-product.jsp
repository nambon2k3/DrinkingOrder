
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
        <title>Login Form</title>
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
            <section class="mt-5">
                <div class="container">
                    <div class="row">
                        <!-- sidebar -->
                        <div class="col-lg-3">
                            <!-- Toggle button -->
                            <button
                                class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
                                type="button"
                                data-mdb-toggle="collapse"
                                data-mdb-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent"
                                aria-expanded="false"
                                aria-label="Toggle navigation"
                                >
                                <span>Show filter</span>
                            </button>
                            <!-- Collapsible wrapper -->
                            <div class="collapse card d-lg-block mb-5" id="navbarSupportedContent">
                                <form action="list-product">
                                    <input type="hidden" name="searchQuery" value="${searchQuery}" />
                                <div class="accordion" id="accordionPanelsStayOpenExample">

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingTwo">
                                            <button
                                                class="accordion-button text-dark bg-light"
                                                type="button"
                                                >
                                                Category
                                            </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
                                            <div class="accordion-body">
                                                <div>
                                                    <!-- Checked checkbox -->
                                                    <c:forEach items="${categories}" var="c">
                                                        <div class="form-check">
                                                            <input class="form-check-input" name="category" type="checkbox" value="${c.ID}" ${categoriesCheckBox.contains(c.ID.toString()) == true ? 'checked' : ''}/>
                                                            <label class="form-check-label">${c.categoryName}</label>

                                                        </div>
                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 >
                                            <button
                                                class="accordion-button text-dark bg-light"
                                                type="button"
                                                >
                                                Price
                                            </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                            <div class="accordion-body">

                                                <div class="row mb-3">
                                                    <div class="col-6">
                                                        <p class="mb-0">
                                                            Min
                                                        </p>
                                                        <div class="form-outline">
                                                            <input type="number" value="${minPrice}" name="minPrice" id="typeNumber" class="form-control border" />

                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">
                                                            Max
                                                        </p>
                                                        <div class="form-outline">
                                                            <input type="number" value="${maxPrice}" name="maxPrice" id="typeNumber" class="form-control border" />

                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-white w-100 border border-secondary">apply</button>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                        </div>
                    </div>
                    <!-- sidebar -->
                    <!-- content -->
                    <div class="col-lg-9">
                        <header class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
                            <div class="ms-auto">
                                <select class="form-select d-inline-block w-auto border pt-1">
                                    <option value="1">Decreasing price</option>
                                    <option value="2">Decreasing price</option>
                                    <option value="3">Increasing price</option>
                                </select>
                            </div>
                        </header>

                        <div class="row">

                            <c:forEach items="${products}" var="p">
                                <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
                                    <div class="card w-100 my-2 shadow-2-strong">
                                        <img src="${p.productDetail.imageURL}" class="card-img-top" />
                                        <div class="card-body d-flex flex-column">
                                            <div class="d-flex flex-row">
                                                <h5 class="mb-1 me-1">${p.productDetail.price * ( 100 - p.productDetail.discount eq null ? 100 : p.productDetail.discount)/100}</h5>
                                                <span class="text-danger"><s>${p.productDetail.price}</s></span>
                                            </div>
                                            <p class="card-text">${p.productName}</p>
                                            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                                <a href="#!" class="btn btn-primary shadow-0 me-1">View detail</a>
                                                <a href="#!" class="btn btn-light border icon-hover px-2 pt-2"><i class="fas fa-heart fa-lg text-secondary px-1"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <hr />

                        <!-- Pagination -->
                        <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                            <button style="margin-right: 10px; width: fit-content" class="btn btn-primary">Go to Page:</button>
                            <input class="form-control" oninput="valid(this)" style="width: 30px; font-size: 15px; padding: 5px; height: 25px; margin-right: 5px" pattern="\d{1,}" title="Enter number" type="text" name="page" value="${page}" min="1" max="${endPage}">
                            / ${endPage}
                            </form>
                        </nav>
                        <!-- Pagination -->
                    </div>
                </div>
            </div>            
        </section>
        <!-- Products -->



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
