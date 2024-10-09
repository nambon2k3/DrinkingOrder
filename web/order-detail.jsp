<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login</title>
        <link href="${pageContext.request.contextPath}/css2/bootstrap.min.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/8e2244e830.js"
            crossorigin="anonymous"
        ></script>
        <link href="${pageContext.request.contextPath}/css2/prettyPhoto.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css2/price-range.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css2/animate.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css2/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css2/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
        <style>
            /* Modal Overlay */
            .modal-overlay {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            /* Modal Content */
            .modal-dialog {
                background-color: white;
                border-radius: 8px;
                padding: 20px;
                width: 50%;
                max-width: 600px;
                position: relative;
            }

            /* Modal Header */
            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
            }

            /* Close Button */
            .close-button {
                cursor: pointer;
                font-size: 20px;
                color: black;
            }

            /* Modal Body */
            .modal-body {
                margin-top: 20px;
                display: flex;
            }

            .image-container {
                text-align: center;
                margin-right: 20px;
            }

            .product-image {
                width: 100%;
                height: auto;
                max-width: 200px;
            }

            /* Product Info Table */
            .product-info {
                width: 100%;
                border-collapse: collapse;
            }

            .product-info th, .product-info td {
                padding: 8px;
                text-align: left;
            }

            .product-info th {
                width: 30%;
                background-color: #f9f9f9;
                font-weight: bold;
            }



            .total_area {
                max-width: 600px; /* Đặt chiều rộng tối đa cho biểu mẫu */
                padding: 20px; /* Thêm khoảng cách bên trong */
                border: 1px solid #ccc; /* Đường viền xung quanh biểu mẫu */
                border-radius: 10px; /* Bo góc cho đường viền */
                background-color: #f9f9f9; /* Màu nền cho biểu mẫu */
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng */
            }

            .form-group {
                margin-bottom: 15px; /* Khoảng cách giữa các phần tử */
                display: flex; /* Sử dụng Flexbox */
                flex-direction: column; /* Đặt chiều dọc */
            }

            .form-group label {
                display: block; /* Hiển thị label dưới dạng block */
                font-weight: bold; /* Đậm cho label */
                margin-bottom: 5px; /* Khoảng cách giữa label và input */
            }

            .form-control {
                width: 100%; /* Chiều rộng 100% cho input */
                max-width: 400px; /* Chiều rộng tối đa cho input */
                padding: 10px; /* Khoảng cách bên trong */
                border: 1px solid #ccc; /* Đường viền cho input */
                border-radius: 5px; /* Bo góc cho input */
                box-sizing: border-box; /* Đảm bảo padding không ảnh hưởng đến chiều rộng */
            }

            .bank-info {
                margin-top: 10px; /* Khoảng cách phía trên cho thông tin ngân hàng */
                padding: 10px; /* Khoảng cách bên trong */
                background-color: #eef; /* Màu nền cho thông tin ngân hàng */
                border: 1px solid #aac; /* Đường viền cho thông tin ngân hàng */
                border-radius: 5px; /* Bo góc cho thông tin ngân hàng */
            }

            .button-group {
                display: flex; /* Sử dụng Flexbox cho nhóm nút */
                justify-content: space-between; /* Khoảng cách đều giữa các nút */
                margin-top: 20px; /* Khoảng cách phía trên cho nhóm nút */
            }


        </style>
    </head><!--/head-->

    <body>

        <jsp:include page="Header.jsp"></jsp:include>

            <section id="cart_items">
                <div class="container">
                    <div class="breadcrumbs">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                        <li class="active">Giỏ hàng</li>
                    </ol>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div style="width: 100%">
                            <h2>Đơn hàng</h2>
                            <p>Mã đơn hàng: ${order.id}</p>
                            <p>Ngày đặt: ${order.createdAt}</p>
                            <p>Trạng thái: ${order.status}</p>
                            <p>Phương thức thanh toán: ${order.paymentMethod}</p>

                            <!-- Receiver Information -->
                            <h3>Người nhận</h3>
                            <p>Họ tên: ${order.fullname}</p>
                            <p>Địa chỉ ${order.address}</p>
                            <p>SĐT ${order.phone}</p>
                        </div>
                    </div>
                </div>

                <div class="table-responsive cart_info">                        
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Sản phẩm</td>
                                <td class="description"></td>
                                <td class="price">Danh mục</td>
                                <td class="price">Giá</td>
                                <td class="quantity">Số lượng</td>
                                <td class="price">Ăn kèm</td>
                                <td class="total">Tổng</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                            <c:set value="0" var="totalToppingProducts"/>
                            <c:forEach var="product" items="${orderedProducts}">
                                <tr>
                                    <td class="cart_product">
                                        <img src="${product.imageURL}" alt="" style="width: 150px; height: 100; object-fit: cover">
                                    </td>
                                    <td class="cart_description">
                                        <h4>${product.getProductName()}</h4>
                                        <p></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>${product.getCateogryName()}</p>
                                    </td>
                                    <td class="cart_price">
                                        ${product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100) : product.price}
                                    </td>
                                    <td class="cart_quantity">
                                        ${product.buyQuantity}
                                    </td>
                                    <td class="cart_total">
                                        <c:set value="0" var="totalTopping"/>
                                        <c:forEach items="${product.listTopping}" var="t">
                                            <c:set value="${totalTopping + t.price}" var="totalTopping"/>
                                            <c:set value="${totalToppingProducts + t.price}" var="totalToppingProducts"/>
                                        </c:forEach>
                                        ${String.format("%.2f", Double.parseDouble(totalTopping))}
                                    </td>
                                    <td class="cart_total">
                                        <c:set value="${product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100)*(product.buyQuantity) + totalTopping: product.price*product.buyQuantity + totalTopping}" var="ttprice"/>
                                        ${String.format("%.2f", Double.parseDouble(ttprice))}
                                    </td>
                                    <td class="cart_delete">
                                        <a  style="margin-top: 0" href="${pageContext.request.contextPath}/public/product-detail?id=${product.productId}&pdid=${product.productDetailId}" class="btn btn-primary">Mua lại</a>
                                        <button style="margin: 0" class="btn-info btn-sm" onclick="openModal(${product.orderDetailId})">Thông tin</button>
                                    </td>
                                </tr>

                                <!-- Modal Structure -->


                            </c:forEach>

                        </tbody>
                    </table>
                </div>

                <c:forEach var="product" items="${orderedProducts}">
                    <div id="customModal_${product.orderDetailId}" class="modal-overlay">
                        <div class="modal-dialog">
                            <div class="modal-header">
                                <h5>Thông tin sản phẩm</h5>
                                <span class="close-button" onclick="closeModal(${product.orderDetailId})">&times;</span>
                            </div>
                            <div class="modal-body">
                                <div class="image-container">
                                    <img src="${product.imageURL}" alt="Product Image" class="product-image">
                                    <strong>Ảnh sản phẩm</strong>
                                </div>

                                <table class="product-info">
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <td>${product.productName}</td>
                                    </tr>
                                    <tr>
                                        <th>Kích thước</th>
                                        <td>${product.size}</td>
                                    </tr>
                                    <tr>
                                        <th>Giá</th>
                                        <td>${product.price}</td>
                                    </tr>
                                    <tr>
                                        <th>Số lượng</th>
                                        <td>${product.buyQuantity}</td>
                                    </tr>
                                    <tr>
                                        <th>Ăn kèm</th>
                                        <td>
                                            <c:forEach items="${product.listTopping}" var="t">
                                                <p>${t.toppingName}: ${t.price}$</p>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Mô tả</th>
                                        <td>${product.description}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:forEach>



            </div>
        </section> <!--/#cart_items-->



        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <strong>Tổng đơn hàng:</strong> ${order.totalCost + totalToppingProducts}
                </div>
                <c:if test="${order.status ne 'Close' && order.status ne 'Canceled' && order.status ne 'Failed' && order.status ne 'Success' && order.status ne 'Rejected' && order.status ne 'Delivering'}">
                    <div class="mt-4">
                        <a href="cancel-order?orderId=${order.id}" class="btn btn-danger">Hủy đơn hàng</a>
                    </div>
                </c:if>
            </div>
            <div class="recommended_items"><!--recommended_items-->
                <h2 class="title text-center">Sản phẩm mới</h2>

                <div id="recommended-item-carousel">
                    <div class="container">
                        <div class="item">	

                            <c:forEach items="${latestProducts}" var="p">

                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="${p.productDetail.imageURL}" alt="" />
                                                <h2><c:if test="${p.productDetail.discount != null && p.productDetail.discount != 0}">
                                                        <span class="text-muted text-decoration-line-through">$${p.productDetail.price}</span>
                                                        $${p.productDetail.price * (100.0- p.productDetail.discount)/100}
                                                    </c:if>

                                                    <c:if test="${p.productDetail.discount == null || p.productDetail.discount == 0}">
                                                        $${p.productDetail.price}
                                                    </c:if></h2>
                                                <p>${p.productName}</p>
                                                <a href="product-detail?id=${p.productId}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Xem chi tiết</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>			
                </div>
            </div><!--/recommended_items-->
        </section><!--/#do_action-->


        <jsp:include page="footer.jsp"></jsp:include>


            <script src="${pageContext.request.contextPath}/js2/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js2/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/price-range.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/js2/main.js"></script>

        <script>
                                    // Open the modal with the corresponding product ID
                                    function openModal(productId) {
                                        var modal = document.getElementById('customModal_' + productId);
                                        modal.style.display = 'flex';
                                    }

                                    // Close the modal with the corresponding product ID
                                    function closeModal(productId) {
                                        var modal = document.getElementById('customModal_' + productId);
                                        modal.style.display = 'none';
                                    }

                                    // Optional: Close modal when clicking outside of it
                                    window.addEventListener('click', function (event) {
                                        var modals = document.querySelectorAll('.modal-overlay');
                                        modals.forEach(function (modal) {
                                            if (event.target == modal) {
                                                modal.style.display = 'none';
                                            }
                                        });
                                    });

        </script>
    </body>
</html>




