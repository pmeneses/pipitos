<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pipitos._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<style type="text/css">
    .pintar {
        padding-top: 5em;
        background-color :white;
        text-align:center;
    }   
</style>


    <div class="pintar">
          <asp:Image ID="Image1" runat="server" Width="180" Height="180" ImageAlign="Middle"  ImageUrl="~/images/pipitos.png" />
        <h3>Sistema de Información Centro De Acopio Los Pipitos </h3>
        <h4>SICAP</h4>
    </div>

    <%--<div class="jumbotron">--%>

        <%--<asp:Image ID="Image1" runat="server" Width="120" Height="120" ImageUrl="~/images/pipitos.png" />
        <h1>Sistema de Información SICAP</h1>
        <p class="lead">Centro de Acopio Los Pipitos</p>--%>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    <%--</div>--%>

    <div class="row">
        <div class="col-md-4">
            <%--<h2>Getting started</h2>
           
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4">
           <%-- <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4">
            <%--<h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>--%>
        </div>
    </div>

</asp:Content>
