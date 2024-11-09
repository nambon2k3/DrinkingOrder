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
    </head><!--/head-->

    <body>

        <jsp:include page="Header.jsp"></jsp:include>

            <section id="form" style="margin-top: 60px"><!--form-->
                <div class="container" style="display: flex; justify-content: center; flex-direction: column; align-items: center">
                <c:if test="${errorMessage != null}">
                    <div style="color: red">${errorMessage}</div>
                </c:if>
                <div class="login-form" style="width: 500px;" id="registerForm"><!--login form-->
                    <h2>Đổi mật khẩu</h2>
                    <form id="changePassForm" action="change-pass" method="post">
                        <div class="form-group">
                            <input name="oldpassword" type="password" class="form-control" placeholder="Mật khẩu cũ" required />
                        </div>
                        <div class="form-group">
                            <input id="password" name="password" type="password" class="form-control" placeholder="Mật khẩu mới" required />
                            <p id="error-password" class="text-danger" style="display: none;"></p>
                        </div>
                        <div class="form-group">
                            <input id="retypePassword" name="retypepassword" type="password" class="form-control" placeholder="Nhập lại mật khẩu" required />
                            <p id="error-retypePassword" class="text-danger" style="display: none;"></p>
                        </div>
                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                    </form>
                </div><!--/login form-->

            </div>
        </section><!--/form-->  



        <jsp:include page="footer.jsp"></jsp:include>


            <script src="${pageContext.request.contextPath}/js2/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js2/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/price-range.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/js2/main.js"></script>
        <script>
            // Tối giản chỉ cần kiểm tra hai trường mật khẩu
            const passwordField = document.getElementById('password');
            const retypePasswordField = document.getElementById('retypePassword');
            const passwordError = document.getElementById('error-password');
            const retypePasswordError = document.getElementById('error-retypePassword');

            document.getElementById('changePassForm').addEventListener('submit', function (event) {
                let isValid = true;

                // Kiểm tra mật khẩu mới
                const password = passwordField.value.trim();
                if (password.length < 8) {
                    passwordError.textContent = 'Mật khẩu phải có ít nhất 8 ký tự.';
                    passwordError.style.display = 'block';
                    isValid = false;
                } else {
                    passwordError.style.display = 'none';
                }

                // Kiểm tra nhập lại mật khẩu
                if (password !== retypePasswordField.value.trim()) {
                    retypePasswordError.textContent = 'Mật khẩu không khớp.';
                    retypePasswordError.style.display = 'block';
                    isValid = false;
                } else {
                    retypePasswordError.style.display = 'none';
                }

                if (!isValid)
                    event.preventDefault();
            });
        </script>
    </body>
</html>
