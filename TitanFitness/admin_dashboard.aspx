<%@ Page Title="Admin Dashboard | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="Titan_Fitness.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-section { padding: 120px 0 60px 0; background-color: #f8f9fa; min-height: 80vh; }
        .admin-card { 
            border-left: 5px solid #FF4D4D; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.08); 
            padding: 30px 20px; 
            border-radius: 8px; 
            background: #ffffff !important; 
            margin-bottom: 20px; 
            transition: transform 0.3s;
        }
        .admin-card:hover { transform: translateY(-5px); }
        .admin-card h3 { 
            color: #111111 !important; 
            font-size: 34px; 
            font-weight: bold; 
            margin-bottom: 8px; 
        }
        .admin-card p { 
            color: #555555 !important; 
            margin: 0; 
            font-size: 14px; 
            text-transform: uppercase; 
            font-weight: bold; 
            letter-spacing: 0.5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="dashboard-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-5 border-bottom pb-3">
                <h2 style="color: #FF4D4D; font-weight: bold;">
                    <i class="fa-solid fa-shield-halved"></i> Admin Dashboard
                </h2>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-dark px-4" OnClick="btnLogout_Click" CausesValidation="false" />
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="admin-card text-center">
                        <h3 id="lblTotalMembers" runat="server">0</h3>
                        <p>Total Registered Members</p>
                        <a href="admin_members.aspx" class="btn btn-outline-danger btn-sm mt-4 px-4">Manage Members</a>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="admin-card text-center" style="border-left-color: #f39c12;">
                        <h3 id="lblPendingPayments" runat="server">0</h3>
                        <p>Pending Offline Payments</p>
                        <a href="admin_payments.aspx" class="btn btn-outline-warning btn-sm mt-4 px-4 text-dark fw-bold">Approve Payments</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="admin-card text-center" style="border-left-color: #3498db;">
                        <h3 id="lblTotalQueries" runat="server">0</h3>
                        <p>User Feedbacks / Queries</p>
                        <a href="admin_queries.aspx" class="btn btn-outline-primary btn-sm mt-4 px-4">View Messages</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>