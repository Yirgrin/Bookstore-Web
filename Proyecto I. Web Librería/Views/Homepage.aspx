<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Bookstore_Web.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <title></title>
    <link rel="stylesheet"
        id="theme_link"
    <link href="../css/Books.css" rel="stylesheet" />
    <script src="../js/site.js"></script>
</head>

<body>
    <div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="Homepage.aspx">Librería Internacional</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="Homepage.aspx">Libros</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#modalLogin">Iniciar Sesión</a>
                    </li>

                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" runat="server" id="txtSearchedBook" placeholder="Buscar libros" aria-label="Search"/>
                    <button class="btn btn-outline-success" id="btnSearch" runat="server" type="submit" onserverclick="btnSearch_ServerClick">Buscar</button>
                </form>
            </div>
        </div>
    </nav>


<%--REPEATER QUE MUESTRA LOS LIBROS--%>
    <asp:Repeater ID="repBooks" runat="server">
        <HeaderTemplate>
            <div class="container">
                <div class="row">
        </HeaderTemplate>
        <ItemTemplate>
            <div id="cardBooks" class="card">
                <img src="<%#Eval ("Photo")%>" class="rounded-4"" alt="...">
                <h4 class="card-title"><%#Eval ("Title")%> </h4>
                <div class="card-body">
                    <h5 class="card-text">₡ <%#Eval ("Price")%> </h5>
                    <hr>
                    <a href="InfoBook.aspx?Id=<%# Eval("Id")%>" class="btn btn-outline-secondary">Ver más!</a>
                    <a href="#?Id=<%# Eval("Id")%>" id="btnCart"class="btn btn-warning">Añadir a la bolsa</a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
			</div>
        </FooterTemplate>
    </asp:Repeater>
</div>

     <%--MODAL INICIO DE SESION--%>
     <div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="modalLogin" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5"> Formulario Inicio Sesión</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="form-label mt-4">Login form</label>
                            <div class="form-floating mb-3">
                                <input type="email" runat="server" class="form-control" id="txtEmail" value="prisiaguilar@gmail.com" placeholder="name@example.com" />
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" runat="server" class="form-control"  id="txtPass" value="admin123" placeholder="Password" />
                                <label for="floatingPassword">Password</label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnLogin" class="btn btn-primary" runat="server" onserverclick="btnLogin_ServerClick">Iniciar Sesión</button>
                    </div>
                </div>
            </div>
        </div>

                <div hidden="hidden" id="cardUser" runat="server">
                    <div class="form-group">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="row">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                        alt="Generic placeholder image" class="img-fluid"
                                        style="width: 180px; border-radius: 10px;" />
                                    <div class="row">
                                        <h5 id="lblName" runat="server" class="mb-1"></h5>
                                        <div class="d-flex pt-1">
                                            <button type="button" class="btn btn-outline-primary me-1 flex-grow-1">View profile</button>
                                             </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           

    <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">
                            <label id="lblModalTitle"></label>
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label id="lblModalMessage"></label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>
    
 
