<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MedMinder.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row justify-content-center">

<div class="col-md-5">

<div class="card shadow-lg border-0 rounded-4">

<div class="card-body p-4">

<h2 class="text-center text-primary mb-4">Create Account</h2>

<div class="mb-3">
<label>Full Name</label>
<asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
</div>

<div class="mb-3">
<label>Email</label>
<asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>Password</label>
<asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="d-grid">
<asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-lg" OnClick="btnRegister_Click" />
</div>

</div>
</div>
</div>
</div>

</asp:Content>