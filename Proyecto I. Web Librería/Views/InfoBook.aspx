<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoBook.aspx.cs" Inherits="Bookstore_Web.Views.InfoBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>Librería Internacional</title>

    <!-- Favicon  -->
    <link rel="icon" href="../css/PageStyle/img/core-img/favicon.ico" />

    <!-- Core Style CSS -->
    <link href="../css/PageStyle/css/core-style.css" rel="stylesheet" />
    <link rel="stylesheet" href="style.css" />

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="../css/PageStyle/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../css/PageStyle/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../css/PageStyle/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="../css/PageStyle/js/plugins.js"></script>
    <!-- Active js -->
    <script src="../css/PageStyle/js/active.js"></script>

</head>

<body>

    <form id="form1" runat="server">

        <div class="main-content-wrapper d-flex clearfix">

            <!-- Mobile Nav (max width 767px)-->
            <div class="mobile-nav">
                <!-- Navbar Brand -->
                <div class="amado-navbar-brand">
                    <a href="Homepage.aspx">
                        <img src="../css/PageStyle/img/core-img/logo.png" />
                    </a>
                </div>
                <!-- Navbar Toggler -->
                <div class="amado-navbar-toggler">
                    <span></span><span></span><span></span>
                </div>
            </div>

            <!-- Header Area Start -->
            <header class="header-area clearfix">
                <!-- Close Icon -->
                <div class="nav-close">
                    <i class="fa fa-close" aria-hidden="true"></i>
                </div>
                <!-- Logo -->
                <div class="logo">
                    <a href="Homepage.aspx">
                        <img src="../css/PageStyle/img/core-img/logo.png" /></a>
                </div>
                <!-- Amado Nav -->
                <nav class="amado-nav">
                    <ul>
                        <li><a href="Homepage.aspx">Página Principal</a></li>
                        <li><a href="Homepage.aspx">Libros</a></li>
                        <li><a id="lblUser" runat="server" href="SingIn.aspx">Iniciar Sesión</a></li>
                    </ul>
                </nav>

                <!-- Button Group -->
                <div class="amado-btn-group mt-30 mb-100">
                    <button class="btn btn-outline-warning" id="btnLogout" runat="server" onserverclick="btnLogout_ServerClick"> Cerrar Sesion</button>
                </div>

                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="ShoppingCart.aspx" class="cart-nav">
                        <img src="../css/PageStyle/img/core-img/cart.png" />
                        Carrito <span>(0)</span></a>
                    <a href="Favorites.aspx" class="fav-nav">
                        <img src="../css/PageStyle/img/core-img/favorites.png" />Favoritos</a>
                    <a href="Homepage.aspx" class="search-nav">
                        <img src="../css/PageStyle/img/core-img/search.png" />Buscar </a>
                </div>

                <!-- Social Button -->
                <div class="social-info d-flex justify-content-between">
                    <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>
            </header>
            <!-- Header Area End -->

            <asp:Repeater ID="repInfoBook" runat="server">
                <ItemTemplate>
                    <!-- Product Details Area Start -->
                    <div class="single-product-area section-padding-100 clearfix">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-12">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb mt-50">
                                            <li class="breadcrumb-item"><a href="Homepage.aspx">Inicio</a></li>
                                            <li class="breadcrumb-item"><a href="Homepage.aspx">Búsquedas</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><%#Eval ("Title")%></li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-lg-7">
                                    <div class="single_product_thumb">
                                        <a class="gallery_img">
                                            <img src="<%#Eval ("Photo")%>" />
                                        </a>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-5">
                                    <div class="single_product_desc">
                                        <!-- Product Meta Data -->
                                        <div class="product-meta-data">
                                            <div class="line"></div>
                                            <p class="product-price">₡ <%#Eval ("Price")%></p>
                                            <h2><%#Eval ("Title")%></h2>

                                            <!-- Ratings & Review -->
                                            <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                                <div class="ratings">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <div>
                                                    <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p>
                                                </div>
                                            </div>

                                            <div class="review">
                                                <br>
                                                ISBN: <%#Eval ("ISBN")%>
                                                <br>
                                                Autor: <%#Eval ("Author")%>
                                                <br>
                                                Fecha de lanzamiento: <%#Eval ("ReleaseDate")%>
                                            </div>



                                            <div class="short_overview my-5">
                                                <p><%#Eval ("Description")%></p>
                                            </div>

                                            <!-- Add to Cart Form -->
                                            <button href="#?Id=<%# Eval("Id")%>" id="btnCart" type="submit" class="btn amado-btn">Añadir al Carrito</button>
                                            <button id="btnFavorite" runat="server" onserverclick="btnFavorite_ServerClick" type="submit" class="btn amado-btn">Añadir a Favoritos</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Product Details Area End -->
                </ItemTemplate>
            </asp:Repeater>
        </div>



        <!-- Single Widget Area -->
        <div class="col-12 col-lg-8">
            <div class="single_widget_area">
                <!-- Footer Menu -->
                <div class="footer_menu">
                    <nav class="navbar navbar-expand-lg justify-content-end">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                        <div class="collapse navbar-collapse" id="footerNavContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="Homepage.aspx">Inicio</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="https://www.libreriainternacional.com/contacto">Contacto</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="https://www.libreriainternacional.com/nosotrosNosotros">Nosotros</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="https://www.libreriainternacional.com/terminos-y-condiciones">Políticas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="https://www.libreriainternacional.com/encuentra-una-tienda.html">Encuentrános</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
