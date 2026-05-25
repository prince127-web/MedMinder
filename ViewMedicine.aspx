<%@ Page Title="View Medicine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMedicine.aspx.cs" Inherits="MedMinder.ViewMedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2 class="mb-4 text-primary">
    Medicine List
</h2>

<asp:GridView ID="GridView1"
    runat="server"
    CssClass="table table-bordered table-hover"
    AutoGenerateColumns="False"
    DataKeyNames="MedicineId"
    OnRowDeleting="GridView1_RowDeleting"
    OnRowEditing="GridView1_RowEditing">

<Columns>

    <asp:BoundField DataField="MedicineId"
        HeaderText="ID"
        ReadOnly="True" />

    <asp:BoundField DataField="MedicineName"
        HeaderText="Medicine" />

    <asp:BoundField DataField="Dosage"
        HeaderText="Dosage" />

    <asp:BoundField DataField="ReminderTime"
        HeaderText="Reminder Time" />

    <asp:BoundField DataField="StartDate"
        HeaderText="Start Date" />

    <asp:BoundField DataField="EndDate"
        HeaderText="End Date" />

    <asp:CommandField ShowEditButton="True"
        ControlStyle-CssClass="btn btn-primary btn-sm m-1" />

    <asp:CommandField ShowDeleteButton="True"
        ControlStyle-CssClass="btn btn-danger btn-sm m-1" />

</Columns>

</asp:GridView>

</asp:Content>