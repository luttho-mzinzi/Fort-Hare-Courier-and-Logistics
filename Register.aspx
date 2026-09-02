<%@ Page Title="Create Your Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FCLSystem.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Create your account</h2>
            <div class="row g-3">
                <div class="col-md-6">
                    <label>First Name *</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="e.g. Thabo"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Last Name *</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="e.g. Mokoena"></asp:TextBox>
                </div>
                <div class="col-12">
                    <label>University Email *</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@ufh.co.za"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Student Number *</label>
                    <asp:TextBox ID="txtStudentNumber" runat="server" CssClass="form-control" placeholder="e.g. 202012345"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Home Campus *</label>
                    <asp:DropDownList ID="ddlCampus" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select Campus --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Alice" Value="Alice"></asp:ListItem>
                        <asp:ListItem Text="East London" Value="East London"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label>Password *</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Min. 8 characters"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Confirm Password *</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Repeat password"></asp:TextBox>
                </div>
                <div class="col-12 mt-3">
                    <asp:CheckBox ID="chkTerms" runat="server" Text=" I agree to the FCL Terms of Service and Privacy Policy" />
                </div>
                <div class="col-12 mt-4">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-warning w-100 fw-bold" OnClick="btnRegister_Click" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-2 d-block"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>