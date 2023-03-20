<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create Account.aspx.cs" Inherits="Bookstore_Web.Views.Create_Account" %>

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
                        <li><a id="lblUser" href="SingIn.aspx">Iniciar Sesión</a></li>
                    </ul>
                </nav>

                <!-- Button Group -->
                <div class="amado-btn-group mt-30 mb-100">
                </div>

                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="ShoppingCart.aspx" class="cart-nav">
                        <img src="../css/PageStyle/img/core-img/cart.png" />
                        Carrito <span>(0)</span></a>
                    <a href="#" class="fav-nav">
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

            <div class="cart-table-area section-padding-100">
                <div class="row">

                    <div class="cart-title">
                        <h2>Iniciar Sesión</h2>
                    </div>

                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input type="text" class="form-control" id="first_name" value="" placeholder="Nombre" required />
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="text" class="form-control" id="last_name" value="" placeholder="Apellidos" required />
                            </div>
                            <div class="col-12 mb-3">
                                <input type="email" class="form-control" id="email" placeholder="Correo Electrónico" value="" required />
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="text" class="form-control" id="zipCode" placeholder="Identificación" value="" required />
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="password" class="form-control" id="phone_number" placeholder="Contraseña" value="" required />
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="custom-control custom-checkbox d-block mb-2">
                                <input type="checkbox" class="custom-control-input" id="customCheck2" />
                                <label class="custom-control-label" for="customCheck2">Acepto los términos y condiciones</label>
                            </div>
                        </div>


                        <div class="cart-btn mt-100">
                            <a href="#" class="btn amado-btn w-100">Registrarse</a>
                        </div>

                    </form>
                </div>
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
