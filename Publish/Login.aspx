<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedMinder.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row justify-content-center">
<div class="col-md-5">

<div class="card shadow-lg border-0 rounded-4">
<div class="card-body p-4">

<h2 class="text-center text-success mb-4">Login</h2>

<div class="mb-3">
<label>Email</label>
<asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>Password</label>
<asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="d-grid">
<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success btn-lg" OnClick="btnLogin_Click" />
</div>

</div>
</div>
</div>
</div>

</asp:Content>