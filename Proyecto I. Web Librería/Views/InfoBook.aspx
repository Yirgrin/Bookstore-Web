<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoBook.aspx.cs" Inherits="Bookstore_Web.Views.InfoBook" %>

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
                            <a class="nav-link" href="#">Books</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Log In</a>
                        </li>


                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search Book" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <asp:Repeater ID="repInfoBook" runat="server">
            <HeaderTemplate>
                <div class="container">
                    <div class="row">
            </HeaderTemplate>
            <ItemTemplate>
                <div id="cardInfoBook" class="card" margin-top="20px">
                    <h3 class="card-header"><%#Eval ("Title")%> </h3>
                    <div class="card-body">
                        <div class="row justify-content-start">
                        <div class="col-4">
                          <img src="<%#Eval ("Photo")%>" class="rounded-4"" alt="...">
                        </div>
                            <div class="col-4">
                                <h5><p class="card-text">
                                        <br>
                                        ISBN: <%#Eval ("ISBN")%>
                                        <br>
                                        Autor: <%#Eval ("Author")%>
                                        <br>
                                        Fecha de lanzamiento: <%#Eval ("ReleaseDate")%>
                                        <br>
                                        Precio: ₡ <%#Eval ("Price")%>
                                        <br>
                                        <br>
                                        <hr>
                                    </p></h5>
                                <p> <%#Eval ("Description")%></p>
                            </div>
                        </div>
                        <a href="#?Id=<%# Eval("Id")%>" id="btnCart"class="btn btn-warning">Add to Cart</a>
                    </div>
                </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</body>
</html>
