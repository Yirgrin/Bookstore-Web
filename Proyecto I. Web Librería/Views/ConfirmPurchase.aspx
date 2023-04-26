<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmPurchase.aspx.cs" Inherits="Bookstore_Web.Views.ConfirmPurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
    <script src="../css/JS.js"></script>
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
                    <button class="btn btn-outline-warning" id="btnLogout" runat="server" onserverclick="btnLogout_ServerClick">Cerrar Sesion</button>
                </div>

                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="ShoppingCart.aspx" class="cart-nav">
                        <img src="../css/PageStyle/img/core-img/cart.png" />
                        Carrito <span id="lblBooksCount" runat="server"></span></a>
                    <a href="Favorites.aspx" class="fav-nav">
                        <img src="../css/PageStyle/img/core-img/favorites.png" />Favoritos <span id="lblfavoritesCount" runat="server"></span></a>
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

                <div class="cart-title">
                    <h2>Tus Datos</h2>
                    <p>Por favor, completa este formulario para completar tu compra.</p>
                </div>

                <div class="row" style="margin-top: 2em;">
                    <div class="col-md-6 mb-3">
                        <label for="first_name" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="first_name" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="last_name" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="last_name" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputCountry" class="form-label">País</label>
                        <input type="text" class="form-control" id="inputCountry" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputCity" class="form-label">Ciudad (Provincia)</label>
                        <input type="text" class="form-control" id="inputCity" runat="server" />
                    </div>
                    <div class="col-12 mb-3">
                        <label for="textAddress" class="form-label">Dirección de envío</label>
                        <textarea type="text" class="form-control" id="textAddress" runat="server" rows="3"> </textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputCardNumber" class="form-label">Número de tarjeta</label>
                        <input type="number" class="form-control" id="inputCardNumber" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputPostalCode" class="form-label">Código Postal</label>
                        <input type="number" class="form-control" id="inputPostalCode" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputExpDate" class="form-label">Fecha de expiración de la tarjeta</label>
                        <input type="date" class="form-control" id="inputExpDate" runat="server" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="inputSecCode" class="form-label">Código de seguridad</label>
                        <input type="number" class="form-control" id="inputSecCode" runat="server" />
                    </div>
                </div>

                <div class="row">
                    <div class="cart-btn mt-100">
                        <a id="btnConfirm" runat="server" onserverclick="btnConfirm_ServerClick" class="btn amado-btn w-100">Confirmar Compra</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Bill-->
        <div class="modal" id="exampleModal" tabindex="-1">
            <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Librería Internacional</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <h6 style="text-align: center;">Sucursal San José</h6>
                        <br />
                        <h6 id="lblClient" runat="server"></h6>
                        <h6 id="lblName" runat="server"></h6>
                        <br />
                        <br />
                        <h6 id="lblBooks" runat="server" style="text-align: center;  font-weight: bold;"></h6>
                        <br />
                        <br />
                        <h6 id="lblTotal" runat="server" style="text-align: center;  font-weight: bold;"></h6>
                        <br />
                        <br />
                        <h6 id="lblCard" runat="server"></h6>
                        <h6 id="lblAddress" runat="server"></h6>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                    </div>
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
