<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <!-- Thanh điều hướng bên trái -->
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

        <!-- Phần nội dung bên phải -->
        <div class="main-content">
            <h2>Danh Sách Đơn Hàng</h2>
            <div class="table-container">
                <div class="table-responsive">
                    <table id="userTable" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>STT</th>
                                <th>Tên Khách Hàng</th>
                                <th>Số Điện Thoại</th>
                                <th>Địa Chỉ</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.fullname}</td>
                                    <td>${order.phone}</td>
                                    <td>${order.address}</td>
                                    <td>
                                        <button class="btn btn-info btn-sm" onclick="showOrderDetails(${order.id})">Chi Tiết</button>
                                        <form action="shipper" method="post" style="display: inline">
                                            <input type="hidden" name="orderId" value="${order.id}" />
                                            <button class="btn btn-success btn-sm" name="action" value="getOrder">Nhận Đơn</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Thêm thành công!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery và Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('#userTable').DataTable({
                                                    "paging": true,
                                                    "lengthChange": true,
                                                    "searching": true,
                                                    "ordering": true,
                                                    "info": true,
                                                    "autoWidth": false,
                                                    "language": {
                                                        "emptyTable": "Không có dữ liệu",
                                                        "info": "Hiện _START_ đến _END_ trong tổng số _TOTAL_ mục",
                                                        "infoEmpty": "Hiện 0 đến 0 trong tổng số 0 mục",
                                                        "infoFiltered": "(lọc từ _MAX_ mục)",
                                                        "lengthMenu": "Hiển thị _MENU_ mục",
                                                        "search": "Tìm kiếm:",
                                                        "paginate": {
                                                            "first": "Đầu",
                                                            "last": "Cuối",
                                                            "next": "Tiếp",
                                                            "previous": "Trước"
                                                        }
                                                    }
                                                });
                                            });
        </script>
        <script>
            $(document).ready(function () {
                // Kiểm tra nếu `param.isSuccess` có giá trị
                let isSuccess = "${param.isSuccess}" !== "";
                if (isSuccess) {
                    $('#successModal').modal('show'); // Hiển thị modal
                }
            });
            function showOrderDetails(id) {
                window.location.href = '?page=order-detail&orderId=' + id;
            }
        </script>
    </body>
</html>

