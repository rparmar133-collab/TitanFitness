<%@ Page Title="Register | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="Titan_Fitness.Register" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section id="register" class="page-section auth-section">
            <div class="container auth-container">
                <div class="auth-card">
                    <div class="auth-header">
                        <div class="auth-icon"><i class="fa-solid fa-user-plus"></i></div>
                        <h2>Create Your Account</h2>
                        <p>Join TITAN FITNESS and kickstart your transformation</p>
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3"></asp:Label>

                    <div>
                        <div class="form-group">
                            <label>Full Name *</label>
                            <div class="input-with-icon">
                                <i class="fa-solid fa-user input-icon"></i>
                                <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter your full name"
                                    required="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Email Address *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-envelope input-icon"></i>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                                        placeholder="name@example.com" required="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Phone Number *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-phone input-icon"></i>
                                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"
                                        placeholder="(555) 123-4567" required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Gender *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-venus-mars input-icon"></i>
                                    <asp:DropDownList ID="ddlGender" runat="server" required="true">
                                        <asp:ListItem Value="" Text="Select Gender" Disabled="true" Selected="true">
                                        </asp:ListItem>
                                        <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                        <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Age *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-calendar input-icon"></i>
                                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="e.g. 25"
                                        required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Membership Plan *</label>
                            <div class="input-with-icon">
                                <i class="fa-solid fa-id-card input-icon"></i>
                                <asp:DropDownList ID="ddlPlan" runat="server" required="true">
                                    <asp:ListItem Value="" Text="Select a Membership Plan" Disabled="true"
                                        Selected="true"></asp:ListItem>
                                    <asp:ListItem Value="Basic" Text="Basic Plan ($29/mo)"></asp:ListItem>
                                    <asp:ListItem Value="Standard" Text="Standard Plan ($59/mo)"></asp:ListItem>
                                    <asp:ListItem Value="Premium" Text="Premium Plan ($89/mo)"></asp:ListItem>
                                    <asp:ListItem Value="VIP" Text="VIP Unlimited ($129/mo)"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Password *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-lock input-icon"></i>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                        placeholder="Min. 8 characters" required="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Confirm Password *</label>
                                <div class="input-with-icon">
                                    <i class="fa-solid fa-shield-halved input-icon"></i>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                                        placeholder="Re-enter password" required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btnRegister" runat="server" Text="Complete Registration"
                            CssClass="btn btn-primary btn-full btn-lg" OnClick="btnRegister_Click" />

                        <div class="auth-footer">
                            <p>Already have an account? <a href="Login.aspx">Sign In here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </asp:Content>