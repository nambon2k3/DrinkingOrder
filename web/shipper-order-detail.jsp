<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh Sách Đơn Hàng</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            body {
                display: flex;
                min-height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .sidebar {
                width: 200px; /* Độ rộng cố định của sidebar */
                background-color: #343a40;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                padding: 50px 0 10px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }

            .sidebar ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            .sidebar li {
                padding: 10px 20px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .sidebar a {
                color: #f8f9fa;
                text-decoration: none;
                display: block;
                width: 100%;
            }

            .sidebar a:hover {
                background-color: #495057;
            }

            .main-content {
                flex-grow: 1; /* Chiếm toàn bộ không gian còn lại */
                padding: 20px;
                background-color: #f8f9fa;
                overflow-x: auto; /* Thêm thanh cuộn ngang nếu cần */
            }

        </style>
    </head>
    <body>

        <nav class="sidebar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/shipper?page=view-all-order">Tất cả đơn hàng</a></li>
                <li><a href="${pageContext.request.contextPath}/shipper?page=view-my-order">Đơn hàng của tôi</a></li>
            </ul>
            <ul class="logout">
                <li class="text-light"><i class="fas fa-users mr-2"></i>${sessionScope.staff.fullname}</li>
                <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt mr-2"></i>Đăng xuất</a></li>
            </ul>
        </nav>


        <div class="main-content">
            <h2>Chi tiết đơn hàng</h2>
            <div class="table-container">
                <div class="row">
                    <div class="col-sm-6">
                        <div style="width: 100%">

                            <p>Mã đơn hàng: ${order.id}</p>
                            <p>Ngày đặt: ${order.createdAt}</p>
                            <p>Trạng thái: 
                                <c:choose>
                                    <c:when test="${order.status.trim() eq 'Submitted'}">
                                        Đã thanh toán
                                    </c:when>
                                    <c:when test="${order.status.trim() eq 'Shipped'}">
                                        Đã giao
                                    </c:when>
                                    <c:when test="${order.status.trim() eq 'Wait for pay'}">
                                        Chưa thanh toán
                                    </c:when>
                                    <c:when test="${order.status.trim() eq 'Delivering'}">
                                        Đang giao
                                    </c:when>
                                    <c:when test="${order.status.trim() eq 'Canceled'}">
                                        Đã hủy
                                    </c:when>
                                    <c:otherwise>
                                        Đang giao - Trả sau
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p>Phương thức thanh toán: ${order.paymentMethod}</p>

                            <!-- Receiver Information -->
                            <h3>Người nhận</h3>
                            <p>Họ tên: ${order.fullname}</p>
                            <p>Địa chỉ: ${order.address}</p>
                            <p>SĐT: ${order.phone}</p>
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
                            </tr>
                        </thead>
                        <tbody>

                            <c:set value="0" var="totalToppingProducts"/>
                            <c:forEach var="product" items="${orderedProducts}">
                                <tr>
                                    <td class="cart_product">
                                        <img src="${product.imageURL}" alt="" style="width: 75px; height: 50; object-fit: cover">
                                    </td>
                                    <td class="cart_description">
                                        <h4>${product.getProductName()}</h4>
                                        <p></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>${product.getCateogryName()}</p>
                                    </td>
                                    <td class="cart_price">
                                        ${String.format("%.2f", Double.parseDouble(product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100) : product.price))}
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
                                        <fmt:formatNumber value="${totalTopping}" type="number" groupingUsed="true" maxFractionDigits="0" />VND
                                    </td>
                                    <td class="cart_total">
                                        <c:set value="${product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100)*(product.buyQuantity) + totalTopping: product.price*product.buyQuantity + totalTopping}" var="ttprice"/>
                                        <fmt:formatNumber value="${ttprice}" type="number" groupingUsed="true" maxFractionDigits="0" />VND
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div>
                    <strong>Tổng đơn hàng:</strong><fmt:formatNumber value="${order.totalCost + totalToppingProducts}" type="number" groupingUsed="true" maxFractionDigits="0" />VND
                </div>
            </div>
        </div>

        <!-- jQuery và Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>



    </body>
</html>

