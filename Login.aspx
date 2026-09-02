<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FCLSystem.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row min-vh-50 align-items-center mt-5">
        <div class="col-md-5">
            <h2 class="text-warning mb-1">ACCOUNT ACCESS</h2>
            <h1 class="display-4 fw-bold">Sign In</h1>
            <p class="mb-4">Welcome back. Enter your credentials to continue.</p>

            <div class="mb-3">
                <label>EMAIL ADDRESS</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control bg-dark text-light border-secondary" placeholder="you@ufh.co.za"></asp:TextBox>
            </div>
            
            <div class="mb-3">
                <div class="d-flex justify-content-between">
                    <label>PASSWORD</label>
                    <a href="Forgot.aspx" class="text-warning text-decoration-none small">Forgot password?</a>
                </div>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control bg-dark text-light border-secondary" TextMode="Password"></asp:TextBox>
            </div>

            <div class="mb-4 form-check">
                <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                <label class="form-check-label">Keep me signed in for 30 days</label>
            </div>

            <div class="d-flex align-items-center">
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In &rarr;" CssClass="btn btn-warning fw-bold me-4 px-4 py-2" OnClick="btnSignIn_Click" />
                <span>New to FCL? <a href="Register.aspx" class="text-warning text-decoration-none">Create an account</a></span>
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-3 d-block"></asp:Label>
        </div>
    </div>
</asp:Content>