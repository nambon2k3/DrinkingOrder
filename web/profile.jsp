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
            <section style="background-color: #eee;">
            <c:if test="${param.success ne null}">
                <div class="alert alert-success" role="alert">
                    Success!
                </div>
            </c:if>
            <c:if test="${param.fail ne null}">
                <div class="alert alert-danger" role="alert">
                    Failed!
                </div>
            </c:if>
            <form id="profileForm" onsubmit="return validateForm()" action="profile" method="post">
                <div class="container py-5">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img id="image0" src="${user.avatar}" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <h5 class="my-3">${sessionScope.user.fullname}</h5>
                                    <div class="d-flex justify-content-center mb-2">
                                        <input type="file" class="form-control" id="imageFile0" accept="image/*" onchange="updateImage(0)">
                                        <input type="hidden" class="form-control" id="imageUrl0" name="avatar" value="${user.avatar}">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="fullname" class="form-control" value="${sessionScope.user.fullname}" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" class="form-control" value="${sessionScope.user.email}" disabled/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="phone" class="form-control" value="${sessionScope.user.phone}" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Gender</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <select class="select" name="gender">
                                                <option value="Male" ${sessionScope.user.gender eq 'Male' ? 'selected' : ''}>Male</option>
                                                <option value="Female" ${sessionScope.user.gender eq 'Female' ? 'selected' : ''}>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="address" class="form-control" value="${sessionScope.user.address}" required/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center mb-2">
                                <button  type="submit" class="btn btn-primary">Submit</button>
                                <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary ms-1">Change password</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
                                            function validateForm() {
                                                let email = document.getElementById('email').value;
                                                let fullname = document.getElementById('fullname').value;
                                                let gender = document.getElementById('gender').value;
                                                let address = document.getElementById('address').value;
                                                let phone = document.getElementById('phone').value;

                                                if (!validateEmail(email)) {
                                                    alert("Please enter a valid email address.");
                                                    return false;
                                                }
                                                if (fullname.trim() === "") {
                                                    alert("Full name is required.");
                                                    return false;
                                                }
                                                if (gender !== "Male" && gender !== "Female") {
                                                    alert("Please select a valid gender.");
                                                    return false;
                                                }
                                                if (address.trim() === "") {
                                                    alert("Address is required.");
                                                    return false;
                                                }
                                                if (!validatePhone(phone)) {
                                                    alert("Please enter a valid phone number.");
                                                    return false;
                                                }
                                                return true;
                                            }

                                            function validateEmail(email) {
                                                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                                return re.test(String(email).toLowerCase());
                                            }

                                            function validatePhone(phone) {
                                                const re = /^\d{10}$/;
                                                return re.test(phone);
                                            }

                                            function updateImage(sliderId) {
                                                let fileInput = document.getElementById(`imageFile` + sliderId);
                                                let image = document.getElementById(`image` + sliderId);
                                                let hiddenInput = document.getElementById(`imageUrl` + sliderId);
                                                console.log(fileInput, image, hiddenInput)

                                                // check file uploaded
                                                if (fileInput.files && fileInput.files[0]) {
                                                    const file = fileInput.files[0];
                                                    const maxSize = 1 * 1024 * 1024; // 2 MB in bytes

                                                    if (file.size > maxSize) {
                                                        alert("The selected file is too large. Please select a file smaller than 1 MB.");
                                                        fileInput.value = ''; // Clear the file input
                                                        return;
                                                    }

                                                    // dịch image thành url
                                                    const reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        // Update the image src
                                                        image.src = e.target.result;

                                                        // Optionally, update the hidden input with the base64 data URL
                                                        hiddenInput.value = e.target.result;
                                                    };

                                                    reader.readAsDataURL(file);
                                                }
                                            }
        </script>
    </body>
</html>

