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
        <link href="css2/bootstrap.min.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/8e2244e830.js"
            crossorigin="anonymous"
        ></script>
        <link href="css2/prettyPhoto.css" rel="stylesheet">
        <link href="css2/price-range.css" rel="stylesheet">
        <link href="css2/animate.css" rel="stylesheet">
        <link href="css2/main.css" rel="stylesheet">
        <link href="css2/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>

        <jsp:include page="Header.jsp"></jsp:include>

            <section id="form" style="margin-top: 60px"><!--form-->
                <div class="container" style="display: flex; justify-content: center; flex-direction: column; align-items: center">
                <c:if test="${errorMessage != null}">
                    <div style="color: red">${errorMessage}</div>
                </c:if>
                <p id="error-message" style="color: red; display: none;">Mật khẩu không khớp!</p>
                <div class="login-form" style="width: 500px;"><!--login form-->
                    <h2>Mật khẩu mới</h2>
                    <form id="passwordForm" action="new-password" method="post">
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="otp" value="${otp}">
                        <input id="password" name="password" type="password" placeholder="Mật khẩu" required/>
                        <input id="retypePassword" name="retypePassword" type="password" placeholder="Nhập lại mật khẩu" required/>
                        <button type="submit" class="btn btn-default">Xác nhận</button>
                    </form>
                </div><!--/login form-->

            </div>
        </section><!--/form-->



        <jsp:include page="footer.jsp"></jsp:include>


        <script src="js2/jquery.js"></script>
        <script src="js2/bootstrap.min.js"></script>
        <script src="js2/jquery.scrollUp.min.js"></script>
        <script src="js2/price-range.js"></script>
        <script src="js2/jquery.prettyPhoto.js"></script>
        <script src="js2/main.js"></script>
        <script>
            const password = document.getElementById('password');
            const retypePassword = document.getElementById('retypePassword');
            const form = document.getElementById('passwordForm');
            const errorMessage = document.getElementById('error-message');

            function checkPasswordsMatch() {
                let message = '';

                // Kiểm tra độ dài và khoảng trắng
                if (password.value.length < 8) {
                    message = 'Mật khẩu phải có ít nhất 8 ký tự.';
                } else if (/\s/.test(password.value)) {
                    message = 'Mật khẩu không được chứa khoảng trắng.';
                } else if (password.value !== retypePassword.value) {
                    message = 'Mật khẩu không khớp!';
                }

                // Hiển thị hoặc ẩn thông báo lỗi
                if (message) {
                    errorMessage.textContent = message;
                    errorMessage.style.display = 'block';
                    return false;
                } else {
                    errorMessage.style.display = 'none';
                    return true;
                }
            }

            password.addEventListener('input', checkPasswordsMatch);
            retypePassword.addEventListener('input', checkPasswordsMatch);

            form.addEventListener('submit', function (event) {
                if (!checkPasswordsMatch()) {
                    event.preventDefault(); // Ngăn gửi form nếu điều kiện không đúng
                }
            });
        </script>

    </body>
</html>
