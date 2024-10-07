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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">

        <style>
            /* Định dạng cho phần lựa chọn size và topping */
            .product-options {
                margin-top: 20px;
            }

            .size-option,
            .topping-option {
                margin-bottom: 15px;
            }

            .size-option label,
            .topping-option label {
                font-weight: bold;
                margin-right: 10px;
            }

            #size-select {
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .topping-checkboxes {
                display: block;
            }

            .topping-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px; /* Khoảng cách giữa các hàng topping */
            }

            .topping-item label {
                font-weight: normal;
                margin-right: 10px;
                min-width: 100px; /* Đặt kích thước tối thiểu để căn chỉnh nhãn */
            }

            .topping-image {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 50%;
                border: 1px solid #ccc;
                margin-top: 5px;
            }

            .topping-checkboxes input[type="checkbox"] {
                margin-right: 5px;
            }
        </style>

    </head><!--/head-->

    <body>

        <jsp:include page="Header.jsp"></jsp:include>


            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-1">

                        </div>

                        <div class="col-sm-9 padding-right">
                            <div class="product-details">
                                <!--product-details-->
                                <div class="col-sm-5">
                                    <div class="view-product">
                                        <img src="${product.productDetail.imageURL}" alt="" />
                                    <h3>ZOOM</h3>
                                </div>
                                <div
                                    id="similar-product"
                                    class="carousel slide"
                                    data-ride="carousel"
                                    >
                                    <!-- Wrapper for slides -->
                                    <!--                                    <div class="carousel-inner">
                                                                            <div class="item active">
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar1.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar2.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar3.jpg" alt=""
                                                                                      /></a>
                                                                            </div>
                                                                            <div class="item">
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar1.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar2.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar3.jpg" alt=""
                                                                                      /></a>
                                                                            </div>
                                                                            <div class="item">
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar1.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar2.jpg" alt=""
                                                                                      /></a>
                                                                                <a href=""
                                                                                   ><img src="images/product-details/similar3.jpg" alt=""
                                                                                      /></a>
                                                                            </div>
                                                                        </div>-->

                                    <!-- Controls -->
                                    <a
                                        class="left item-control"
                                        href="#similar-product"
                                        data-slide="prev"
                                        >
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a
                                        class="right item-control"
                                        href="#similar-product"
                                        data-slide="next"
                                        >
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="product-information">
                                    <!--/product-information-->
                                    <img
                                        src="images/product-details/new.jpg"
                                        class="newarrival"
                                        alt=""
                                        />
                                    <h2>${product.productName}</h2>
                                    <img src="${pageContext.request.contextPath}/images/product-details/rating.png" alt="" />
                                    <p><strong>91%</strong> người hài lòng với sản phẩm! <strong>(87 đánh giá)</strong></p>
                                    <span>
                                        <span>
                                            <c:if test="${product.productDetail.discount != null && product.productDetail.discount != 0}">
                                                <span style="color: grey; text-decoration: line-through; margin: 0 10px">
                                                    ${product.productDetail.price}$</span> 
                                                </c:if>
                                                ${String.format("%.2f", product.productDetail.price * (1 - product.productDetail.discount/100))}VND 

                                        </span><br>
                                        <label>Số lượng</label>
                                        <input type="number" oninput="valid(this)" id="quantity" value="1" />
                                    </span>
                                    <button type="button" class="btn btn-fefault cart" onclick="addToCart(${product.productDetail.productDetailId})" style="margin-left: 0">
                                        <i class="fa fa-shopping-cart"></i>
                                        Thêm vào giỏ hàng
                                    </button>
                                    <p><b>Trong kho:</b> ${product.productDetail.stock - product.productDetail.hold}</p>

                                    <div class="product-options">
                                        <div class="size-option">
                                            <label for="size-select">Kích cỡ:</label>
                                            <select id="size-select" onchange="changeSize(this, ${product.productId})">
                                                <c:forEach items="${listDetails}" var="pd">
                                                    <option value="${pd.productDetailId}" ${pd.size == product.productDetail.size ? 'selected' : ''}>${pd.size}</option>

                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="topping-option">
                                            <label for="topping-select">Đồ ăn kèm:</label>
                                            <div class="topping-checkboxes">
                                                <c:forEach var="topping" items="${toppings}">
                                                    <div class="topping-item">
                                                        <label
                                                            ><input type="checkbox" class="select-topping" value="${topping.id}" />
                                                            ${topping.toppingName} (${topping.price} VNĐ)</label
                                                        >
                                                        <img
                                                            src="${topping.img}"
                                                            alt="${topping.toppingName}"
                                                            class="topping-image"
                                                            />
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!--/product-information-->
                            </div>
                        </div>
                        <!--/product-details-->

                        <div class="category-tab shop-details-tab">
                            <!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#details" data-toggle="tab">Mô tả</a></li>
                                    <li>
                                        <a href="#reviews" data-toggle="tab">Đánh giá</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="details">
                                    <p>
                                        ${product.description}
                                    </p>
                                </div>

                                <div class="tab-pane fade" id="reviews">
                                    <div class="col-sm-12">
                                        <ul>
                                            <li>
                                                <a href=""><i class="fa fa-user"></i>EUGEN</a>
                                            </li>
                                            <li>
                                                <a href=""><i class="fa fa-clock-o"></i>12:41 PM</a>
                                            </li>
                                            <li>
                                                <a href=""
                                                   ><i class="fa fa-calendar-o"></i>31 DEC 2014</a
                                                >
                                            </li>
                                        </ul>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                            sed do eiusmod tempor incididunt ut labore et dolore magna
                                            aliqua.Ut enim ad minim veniam, quis nostrud exercitation
                                            ullamco laboris nisi ut aliquip ex ea commodo
                                            consequat.Duis aute irure dolor in reprehenderit in
                                            voluptate velit esse cillum dolore eu fugiat nulla
                                            pariatur.
                                        </p>
                                        <p><b>Write Your Review</b></p>

                                        <form action="#">
                                            <span>
                                                <input type="text" placeholder="Your Name" />
                                                <input type="email" placeholder="Email Address" />
                                            </span>
                                            <textarea name=""></textarea>
                                            <b>Rating: </b>
                                            <img src="images/product-details/rating.png" alt="" />
                                            <button type="button" class="btn btn-default pull-right">
                                                Submit
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/category-tab-->


                        <!--/recommended_items-->
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="footer.jsp"></jsp:include>


            <script src="${pageContext.request.contextPath}/js2/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js2/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/price-range.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/js2/main.js"></script>
        <script>
                                                function valid(input) {
                                                    input.value = input.value.replace(/[^0-9]/g, '');
                                                    if (input.value > ${product.productDetail.stock}) {
                                                        input.value = ${product.productDetail.stock};
                                                    }

                                                    if (input.value < 1) {
                                                        input.value = 1;
                                                    }

                                                }

                                                function addToCart(id) {
                                                    let quantity = document.getElementById('quantity').value;
                                                    var listTopping = document.getElementsByClassName('select-topping');
                                                    let toppings = '';
                                                    for (let i = 0; i < listTopping.length; i ++) {
                                                       if(listTopping[i].checked) {
                                                           if(i !== 0) {
                                                               toppings += ',';
                                                           }
                                                           toppings += listTopping[i].value;
                                                              
                                                       } 
                                                    }
                                                    
                                                    
                                                    
                                                    console.log(toppings);

                                                    fetch('add-cart?id=' + id + '&quantity=' + quantity + '&toppings=' + toppings);
                                                    window.alert('ADDED Successfully');
                                                }

                                                function changeSize(select, productID) {
                                                    let value = select.value;
                                                    window.location.href = 'product-detail?pdid=' + value + '&id=' + productID;
                                                }
        </script>
    </body>
</html>
