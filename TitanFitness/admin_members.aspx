<%@ Page Title="Manage Members | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_members.aspx.cs" Inherits="Titan_Fitness.admin_members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-section { padding: 120px 0 60px 0; background-color: #f8f9fa; min-height: 80vh; }
        .table-custom { background: #ffffff !important; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.08); }
        .table-custom thead { background: #FF4D4D !important; color: #ffffff !important; }
        .table-custom th { color: #ffffff !important; font-weight: bold; }
        .table-custom td { 
            vertical-align: middle; 
            padding: 15px; 
            border-bottom: 1px solid #eeeeee; 
            color: #111111 !important; 
            font-size: 15px;
        }
        .table-custom tbody tr { background-color: #ffffff !important; }
        .table-custom tbody tr:hover { background-color: #f9f9f9 !important; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="admin-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                <h2 style="color: #333; font-weight: bold;">
                    <i class="fa-solid fa-users text-danger"></i> Manage Members
                </h2>
                <div class="d-flex gap-2">
                    <a href="AdminProfile.aspx?tab=tab-trainers" class="btn btn-outline-danger px-3"><i class="fa-solid fa-user-ninja"></i> Trainers Roster</a>
                    <a href="AdminProfile.aspx" class="btn btn-outline-dark px-3">Admin Workspace</a>
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3 fs-5"></asp:Label>

            <div class="table-responsive table-custom">
                <table class="table mb-0 text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th class="text-start">Member Name</th>
                            <th>Gender</th>
                            <th>Membership Plan</th>
                            <th>Status</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptMembers" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="fw-bold"><%# Eval("Id") %></td>
                                    <td class="text-start fw-bold"><i class="fa-solid fa-user-circle text-primary me-2"></i><%# Eval("FullName") %></td>
                                    <td><%# Eval("Gender") %></td>
                                    <td><span class="badge bg-light text-dark border"><%# Eval("PlanName") %></span></td>
                                    <td>
                                        <span style='color: <%# Eval("PaymentStatus").ToString() == "Approved" ? "#00E676" : "#f59e0b" %>; font-weight: 600;'>
                                            <i class="fa-solid fa-circle" style="font-size: 8px;"></i> <%# Eval("PaymentStatus") %>
                                        </span>
                                    </td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Phone") %></td>
                                    <td>
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                            CssClass="btn btn-sm btn-danger px-3 shadow-sm" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            OnClick="btnDelete_Click" 
                                            OnClientClick="return confirm('Are you sure you want to permanently delete this member?');" 
                                            CausesValidation="false" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                
                <asp:Label ID="lblNoRecord" runat="server" CssClass="d-block text-center p-4 text-muted fs-5" Visible="false">
                    No registered members found.
                </asp:Label>
            </div>
        </div>
    </section>
</asp:Content>
