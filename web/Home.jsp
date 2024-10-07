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
        <title>Trang chủ</title>
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

            <section id="slider"><!--slider-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                <c:forEach items="${sliders}" var="slide" varStatus="status">
                                    <li data-target="#slider-carouse${status.index+1}" data-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}"></li>
                                    </c:forEach>
                            </ol>

                            <div class="carousel-inner">
                                <c:forEach items="${sliders}" var="slide" varStatus="status">

                                    <div class="item ${status.index == 0 ? 'active' : ''}">
                                        <div class="col-sm-6">
                                            <h1><span>Drinking</span>-Order</h1>
                                            <h2>${slide.title}</h2>
                                            <p>${slide.notes}</p>
                                            <a class="btn btn-default get" href="${pageContext.request.contextPath}/public/list-product">Khám phá nào</a>
                                        </div>
                                        <div class="col-sm-6">
                                            <img src="${slide.imageUrl}" class="girl img-responsive" alt="" />
                                        </div>
                                    </div>

                                </c:forEach>
                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <section>
            <div class="container">
                <div class="row">			
                    <div class="col-sm-12 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Sản phẩm nôi bật</h2>

                            <c:forEach items="${products}" var="product">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="${product.productDetail.imageURL}" alt="" />
                                                <h2>${product.productDetail.price * (1 - product.productDetail.discount)} VND</h2>
                                                <p>${product.productName}</p>
                                                <a href="public/product-detail?id=${product.productId}" class="btn btn-default add-to-cart"><i class="fa-solid fa-eye"></i>Chi tiết</a>
                                            </div>
                                            <c:if test="${product.productDetail.discount != null && product.productDetail.discount != 0}">
                                                <img src="images/home/sale.png" class="new" alt="" />
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div><!--features_items-->	

                        <div class="recommended_items"><!--recommended_items-->
                            <h2 class="title text-center">Bài viết gần đây</h2>

                            <div style="width: 100%; display: flex; justify-content: center;">
                                <c:forEach begin="0" end="2" items="${posts}" var="post">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="${post.imgURL}" alt="" />
                                                    <h2>${post.title}</h2>
                                                    <p>${post.createdAt}</p>
                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa-solid fa-eye"></i>Chi tiết</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div><!--/recommended_items-->

                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>


        <script src="js2/jquery.js"></script>
        <script src="js2/bootstrap.min.js"></script>
        <script src="js2/jquery.scrollUp.min.js"></script>
        <script src="js2/price-range.js"></script>
        <script src="js2/jquery.prettyPhoto.js"></script>
        <script src="js2/main.js"></script>
    </body>
</html>
