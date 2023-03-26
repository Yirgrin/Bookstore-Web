<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="Bookstore_Web.Views.Favorites" %>

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

        <!-- ##### Main Content Wrapper Start ##### -->
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
                    <button class="btn btn-outline-warning" id="btnLogout" runat="server"> Cerrar Sesion</button>
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


                    <div class="row no-gutters">
                        <%--REPEATER QUE MUESTRA LOS LIBROS--%>
                        <asp:Repeater ID="repFavorites" runat="server">
                            <ItemTemplate>
                                <!-- Product Area -->
                                <div class="col-12 col-sm-6">
                                    <div class="single-product-wrapper">
                                        <!-- Product Image -->
                                        <div>
                                            <a href="InfoBook.aspx?Id=<%# Eval("Id")%>">
                                                <img src="<%#Eval ("Photo")%>" style="width: 300px; height: 400px;" />
                                        </div>

                                        <!-- Product Description -->
                                        <div class="product-description d-flex align-items-center">
                                            <!-- Product Meta Data -->
                                            <div class="product-meta-data">
                                                <div class="line"></div>
                                                <p class="product-price">₡ <%#Eval ("Price")%></p>
                                                <a href="InfoBook.aspx?Id=<%# Eval("Id")%>">
                                                    <h4><%#Eval ("Title")%> </h4>
                                                </a>
                                            </div>
                                            <!-- Ratings & Cart -->
                                            <div class="ratings-cart text-right">
                                                <div class="ratings">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <div class="cart">
                                                    <button dataid='<%# Eval("Id")%>' runat="server" onserverclick="btnDeleteFavorite_ServerClick" data-toggle="tooltip" data-placement="left" title="Eliminar libro de favoritos">
                                                        <img src="../css/PageStyle/img/core-img/trash-2.jpg" /></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
           

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer_area clearfix">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Single Widget Area -->
                    <div class="col-12 col-lg-4">
                        <div class="single_widget_area">
                            <!-- Logo -->
                            <div class="footer-logo mr-50">
                                <a href="index.html">
                                    <img src="../css/PageStyle/img/core-img/logo.png" /></a>
                            </div>
                            <!-- Copywrite Text -->
                            <p class="copywrite">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a> & Re-distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
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
                </div>
            </div>
        </footer>
    </form>
</body>
</html>



