<%@ Page Title="My Profile | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs" Inherits="Titan_Fitness.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section" style="padding-top: 130px; min-height: 80vh;">
        <div class="container" style="max-width: 600px;">
            <div class="auth-card"
                style="background: var(--bg-card); padding: 40px; border-radius: var(--radius-lg); border: 1px solid var(--border-subtle); box-shadow: var(--shadow-md);">

                <div class="section-header text-center" style="margin-bottom: 30px;">
                    <div class="feature-icon"
                        style="margin: 0 auto 15px; width: 70px; height: 70px; font-size: 2rem;">
                        <i
                            class="fa-solid fa-user-shield"></i>
                    </div>
                    <h2 class="section-title" style="font-size: 2rem;">MEMBER <span
                        class="gradient-text">PROFILE</span></h2>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3"></asp:Label>

                <div
                    style="background: rgba(0,0,0,0.2); padding: 20px; border-radius: 10px; margin-bottom: 25px; border: 1px solid var(--border-subtle);">
                    <p style="margin-bottom: 10px; font-size: 1.1rem;">
                        <strong>Name:</strong>
                        <asp:Label ID="lblName" runat="server" CssClass="accent-text"></asp:Label>
                    </p>
                    <p style="margin-bottom: 10px; font-size: 1.1rem;">
                        <strong>Email:</strong>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </p>
                    <p style="margin-bottom: 0; font-size: 1.2rem;">
                        <strong>Current Plan:</strong>
                        <asp:Label ID="lblCurrentPlan" runat="server" CssClass="gradient-text fw-bold"></asp:Label>
                    </p>
                </div>

                <div class="form-group">
                    <label>Upgrade to New Plan</label>
                    <div class="input-with-icon">
                        <i class="fa-solid fa-id-card input-icon"></i>
                        <asp:DropDownList ID="ddlNewPlan" runat="server" required="true">
                            <asp:ListItem Value="" Text="Select a New Plan" Disabled="true" Selected="true">
                            </asp:ListItem>
                            <asp:ListItem Value="Basic" Text="Basic Plan ($29/mo)"></asp:ListItem>
                            <asp:ListItem Value="Standard" Text="Standard Plan ($59/mo)"></asp:ListItem>
                            <asp:ListItem Value="Premium" Text="Premium Plan ($89/mo)"></asp:ListItem>
                            <asp:ListItem Value="VIP" Text="VIP Unlimited ($129/mo)"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:Button ID="btnUpgrade" runat="server" Text="Upgrade Plan"
                    CssClass="btn btn-primary btn-full mt-3" OnClick="btnUpgrade_Click" />

            </div>
        </div>
    </section>
</asp:Content>
