<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MedMinder.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<h2 class="mb-4">
    Welcome,
    <asp:Label ID="lblName" runat="server"></asp:Label>
</h2>

<div class="row g-4">

    <div class="col-md-4">
        <div class="card shadow border-0 bg-primary text-white rounded-4">
            <div class="card-body text-center">

                <h3>Add Medicine</h3>

                <a href="AddMedicine.aspx" class="btn btn-light mt-3">
                    Open
                </a>

            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow border-0 bg-success text-white rounded-4">
            <div class="card-body text-center">

                <h3>View Medicines</h3>

                <a href="ViewMedicine.aspx" class="btn btn-light mt-3">
                    Open
                </a>

            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow border-0 bg-danger text-white rounded-4">
            <div class="card-body text-center">

                <h3>Logout</h3>

                <a href="Logout.aspx" class="btn btn-light mt-3">
                    Logout
                </a>

            </div>
        </div>
    </div>

</div>

<asp:Label ID="lblStatus"
    runat="server"
    Text="Medicine reminders auto-refresh every 5 seconds."
    CssClass="text-success">
</asp:Label>
    <div class="mt-5">

    <asp:Label ID="lblReminder"
        runat="server"
        CssClass="alert alert-warning fs-5 fw-bold">
    </asp:Label>

</div>

<asp:Timer ID="Timer1"
    runat="server"
    Interval="5000"
    OnTick="Timer1_Tick">
</asp:Timer>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>