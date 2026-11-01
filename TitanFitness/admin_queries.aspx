<%@ Page Title="User Queries | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_queries.aspx.cs" Inherits="Titan_Fitness.admin_queries" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    background: #3498db !important;
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

                    .table-custom td a {
                        color: #0d6efd !important;
                        font-weight: 600;
                    }

                .table-custom tbody tr {
                    background-color: #ffffff !important;
                }

                    .table-custom tbody tr:hover {
                        background-color: #f9f9f9 !important;
                    }

            .msg-box {
                max-width: 300px;
                white-space: normal;
                word-wrap: break-word;
                text-align: left;
            }
        </style>
    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="admin-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                <h2 style="color: #333; font-weight: bold;">
                    <i class="fa-solid fa-envelope-open-text text-primary"></i>User Queries & Feedback
                </h2>
                <a href="admin_dashboard.aspx" class="btn btn-outline-dark px-4">Back to Dashboard</a>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3 fs-5"></asp:Label>

            <div class="table-responsive table-custom">
                <table class="table mb-0 text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th class="text-start">Name</th>
                            <th>Email</th>
                            <th class="text-start">Message / Inquiry</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptQueries" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="fw-bold"><%# Eval("Id") %></td>
                                    <td class="text-start fw-bold"><%# Eval("FullName") %></td>
                                    <td><a href='mailto:<%# Eval("Email") %>' class="text-decoration-none"><%# Eval("Email") %></a></td>
                                    <td class="msg-box"><%# Eval("Message") %></td>
                                    <td>
                                        <asp:Button ID="btnDelete" runat="server" Text="Mark as Done & Delete"
                                            CssClass="btn btn-sm btn-outline-danger px-3 shadow-sm"
                                            CommandArgument='<%# Eval("Id") %>'
                                            OnClick="btnDelete_Click"
                                            OnClientClick="return confirm('Are you sure you want to delete this message?');"
                                            CausesValidation="false" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

                <asp:Label ID="lblNoRecord" runat="server" CssClass="d-block text-center p-4 text-muted fs-5" Visible="false">
                    No new queries or messages found.
                </asp:Label>
            </div>
        </div>
    </section>
</asp:Content>
