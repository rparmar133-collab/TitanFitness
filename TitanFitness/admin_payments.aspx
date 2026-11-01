<%@ Page Title="Manage Payments | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_payments.aspx.cs" Inherits="Titan_Fitness.admin_payments" %>

    <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
        <style>
            .admin-section {
                padding: 120px 0 60px 0;
                background-color: #f8f9fa;
                min-height: 80vh;
            }

            .table-custom {
                background: #ffffff !important;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            }

                .table-custom thead {
                    background: #f39c12 !important;
                    color: #ffffff !important;
                }

                .table-custom th {
                    color: #ffffff !important;
                    font-weight: bold;
                }

                .table-custom td {
                    vertical-align: middle;
                    padding: 15px;
                    border-bottom: 1px solid #eeeeee;
                    color: #111111 !important;
                    font-size: 15px;
                }

                .table-custom tbody tr {
                    background-color: #ffffff !important;
                }

                    .table-custom tbody tr:hover {
                        background-color: #f9f9f9 !important;
                    }
        </style>
    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="admin-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                <h2 style="color: #333; font-weight: bold;">
                    <i class="fa-solid fa-credit-card text-warning"></i>Manage Payments
                </h2>
                <a href="admin_dashboard.aspx" class="btn btn-outline-dark px-4">Back to Dashboard</a>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3 fs-5"></asp:Label>

            <div class="table-responsive table-custom">
                <table class="table mb-0 text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th class="text-start">User Email</th>
                            <th>Plan Name</th>
                            <th>Amount (₹)</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptPayments" runat="server">
                            <itemtemplate>
                                <tr>
                                    <td class="fw-bold"><%# Eval("Id") %></td>
                                    <td class="text-start fw-bold"><%# Eval("UserEmail") %></td>
                                    <td><%# Eval("PlanName") %></td>
                                    <td class="fw-bold text-success">₹<%# Eval("Amount") %></td>
                                    <td><%# Eval("Date") %></td>
                                    <td>
                                        <span class='badge <%# Eval("Status").ToString() == "Approved" ? "bg-success" : Eval("Status").ToString() == "Rejected" ? "bg-danger" : "bg-warning text-dark" %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnApprove" runat="server" Text="Approve"
                                            CssClass="btn btn-sm btn-success px-3 shadow-sm me-2"
                                            CommandArgument='<%# Eval("Id") %>'
                                            OnClick="btnApprove_Click"
                                            Visible='<%# Eval("Status").ToString() == "Pending" %>'
                                            CausesValidation="false" />

                                        <asp:Button ID="btnDelete" runat="server" Text="Remove"
                                            CssClass="btn btn-sm btn-outline-danger px-2"
                                            CommandArgument='<%# Eval("Id") %>'
                                            OnClick="btnDelete_Click"
                                            OnClientClick="return confirm('Delete this payment record?');"
                                            CausesValidation="false" />
                                    </td>
                                </tr>
                            </itemtemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

                <asp:Label ID="lblNoRecord" runat="server" CssClass="d-block text-center p-4 text-muted fs-5" Visible="false">No payment records found.
                </asp:Label>
            </div>
        </div>
    </section>
</asp:Content>
