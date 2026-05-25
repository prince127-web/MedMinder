<%@ Page Title="Add Medicine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMedicine.aspx.cs" Inherits="MedMinder.AddMedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row justify-content-center">
<div class="col-md-6">

<div class="card shadow-lg border-0 rounded-4">
<div class="card-body p-4">

<h2 class="text-center text-primary mb-4">Add Medicine</h2>

<div class="mb-3">
<label>Medicine Name</label>
<asp:TextBox ID="txtMedicine" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>Dosage</label>
<asp:TextBox ID="txtDosage" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>Reminder Time</label>
<asp:TextBox ID="txtTime" TextMode="Time" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>Start Date</label>
<asp:TextBox ID="txtStart" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="mb-3">
<label>End Date</label>
<asp:TextBox ID="txtEnd" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
</div>

<div class="d-grid">
<asp:Button ID="btnSave" runat="server" Text="Save Medicine" CssClass="btn btn-primary btn-lg" OnClick="btnSave_Click" />
</div>

</div>
</div>
</div>
</div>

</asp:Content>