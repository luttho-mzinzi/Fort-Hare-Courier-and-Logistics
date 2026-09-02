<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FCLSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row align-items-center min-vh-75 mt-5">
        <div class="col-md-6">
            <h1 class="display-3 fw-bold">Delivered <span class="text-warning">On Time.</span><br />Every Time.</h1>
            <p class="lead mt-3">
                Fort Hare Courier and Logistics connects the entire University of Fort Hare community, whether you are based at the Alice or East London campus, with fast, reliable, and fully trackable parcel and freight services.
            </p>
            <div class="mt-4">
                <a href="Pricing.aspx" class="btn btn-warning btn-lg fw-bold me-3">View Pricing &rarr;</a>
                <a href="Contact.aspx" class="btn btn-outline-light btn-lg">Support</a>
            </div>
        </div>
        <div class="col-md-5 offset-md-1">
            <div class="card bg-secondary text-light p-4">
                <h4 class="mb-3 border-start border-warning border-4 ps-2">Track</h4>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtTrackingNumber" runat="server" CssClass="form-control" placeholder="Tracking no. e.g. FCL-2024-847"></asp:TextBox>
                    <asp:Button ID="btnTrack" runat="server" Text="Track" CssClass="btn btn-warning fw-bold" OnClick="btnTrack_Click" />
                </div>
                <small class="text-light">Your tracking number is on your FCL receipt or SMS confirmation.</small>
                <asp:Label ID="lblTrackResult" runat="server" CssClass="d-block mt-3 text-warning fw-bold"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>