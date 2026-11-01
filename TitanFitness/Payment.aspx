<%@ Page Title="Make Payment | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Titan_Fitness.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .payment-section { padding: 120px 0 60px 0; background-color: #f8f9fa; min-height: 80vh; }
        .payment-card { background: #fff; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); padding: 40px; border-top: 5px solid #FF4D4D; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="payment-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="payment-card">
                        <h2 class="text-center mb-4" style="color: #333; font-weight: bold;">
                            <i class="fa-solid fa-credit-card text-danger"></i> Offline Payment
                        </h2>
                        
                        <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3"></asp:Label>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Your Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Select Gym Plan</label>
                            <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlPlan_SelectedIndexChanged">
                                <asp:ListItem Text="-- Select Plan --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Basic Plan (1 Month)" Value="1000"></asp:ListItem>
                                <asp:ListItem Text="Pro Plan (3 Months)" Value="2500"></asp:ListItem>
                                <asp:ListItem Text="Elite Plan (1 Year)" Value="8000"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Amount to Pay (₹)</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control fw-bold text-success" ReadOnly="true" placeholder="0"></asp:TextBox>
                        </div>

                        <div class="alert alert-warning text-center">
                            <i class="fa-solid fa-circle-info"></i> Please pay via Cash or UPI at the Gym Reception. Admin will approve your plan once payment is received.
                        </div>

                        <asp:Button ID="btnSubmitPayment" runat="server" Text="Submit Request" CssClass="btn btn-danger w-100 py-2 fs-5 fw-bold" OnClick="btnSubmitPayment_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>