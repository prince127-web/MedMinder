<%@ Page Title="Edit Medicine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditMedicine.aspx.cs" Inherits="MedMinder.EditMedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow-lg border-0 rounded-4">

<div class="card-body p-4">

<h2 class="text-center text-warning mb-4">
    Edit Medicine
</h2>

<div class="mb-3">

<label>Medicine Name</label>

<asp:TextBox ID="txtMedicine"
    CssClass="form-control"
    runat="server">
</asp:TextBox>

</div>

<div class="mb-3">

<label>Dosage</label>

<asp:TextBox ID="txtDosage"
    CssClass="form-control"
    runat="server">
</asp:TextBox>

</div>

<div class="mb-3">

<label>Reminder Time</label>

<asp:TextBox ID="txtTime"
    TextMode="Time"
    CssClass="form-control"
    runat="server">
</asp:TextBox>

</div>

<div class="mb-3">

<label>Start Date</label>

<asp:TextBox ID="txtStart"
    TextMode="Date"
    CssClass="form-control"
    runat="server">
</asp:TextBox>

</div>

<div class="mb-3">

<label>End Date</label>

<asp:TextBox ID="txtEnd"
    TextMode="Date"
    CssClass="form-control"
    runat="server">
</asp:TextBox>

</div>

<div class="d-grid">

<asp:Button ID="btnUpdate"
    runat="server"
    Text="Update Medicine"
    CssClass="btn btn-warning btn-lg"
    OnClick="btnUpdate_Click" />

</div>

</div>
</div>
</div>
</div>

</asp:Content>