<%@ Page Title="Admin Workspace | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Titan_Fitness.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Overall Portal Container */
        .portal-wrapper {
            padding-top: 85px;
            background-color: #f1f5f9;
            min-height: 100vh;
            display: flex;
            width: 100%;
        }

        /* Blue Sidebar (Matching Titan Fitness Brand) */
        .portal-sidebar {
            width: 250px;
            background: linear-gradient(180deg, #1e3a8a 0%, #0f172a 100%);
            min-height: calc(100vh - 85px);
            padding: 24px 0;
            flex-shrink: 0;
            box-shadow: 2px 0 12px rgba(30, 102, 245, 0.15);
            border-right: 1px solid rgba(30, 102, 245, 0.2);
        }

        .portal-brand {
            padding: 0 22px 24px 22px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.12);
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .portal-brand-icon {
            font-size: 26px;
            color: #00D2FF;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .portal-brand-text h4 {
            color: #ffffff;
            font-size: 15px;
            font-weight: 800;
            margin: 0;
            letter-spacing: 0.5px;
            line-height: 1.2;
        }

        .portal-brand-text span {
            color: #00D2FF;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .portal-menu {
            list-style: none;
            padding: 16px 12px;
            margin: 0;
        }

        .portal-menu-item {
            margin-bottom: 5px;
        }

        .portal-menu-link {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 11px 16px;
            color: #cbd5e1;
            font-size: 13.5px;
            font-weight: 500;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .portal-menu-link i {
            font-size: 15px;
            width: 20px;
            text-align: center;
            color: inherit;
        }

        .portal-menu-link:hover {
            background: rgba(30, 102, 245, 0.25);
            color: #ffffff;
        }

        .portal-menu-link.active {
            background: #1E66F5;
            color: #ffffff;
            font-weight: 700;
            box-shadow: 0 4px 12px rgba(30, 102, 245, 0.4);
        }

        /* Workspace Main Content Area */
        .workspace-main {
            flex: 1;
            padding: 24px 32px 60px 32px;
            overflow-x: hidden;
            background: #f8fafc;
        }

        /* Top Bar */
        .workspace-topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 14px;
            border-bottom: 1px solid #e2e8f0;
        }

        .workspace-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .workspace-userbar {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .workspace-bell {
            font-size: 18px;
            color: #475569;
            cursor: pointer;
            position: relative;
            transition: color 0.2s;
        }

        .workspace-bell:hover {
            color: #1E66F5;
        }

        .workspace-user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .workspace-role-label {
            font-size: 13.5px;
            font-weight: 600;
            color: #1e293b;
        }

        .workspace-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #1E66F5;
            color: #ffffff;
            font-weight: 700;
            font-size: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(30, 102, 245, 0.4);
        }

        /* Cards Layout */
        .portal-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
            position: relative;
            margin-bottom: 24px;
        }

        /* Welcome Card */
        .badge-workspace {
            background-color: #eff6ff;
            color: #1E66F5;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            letter-spacing: 0.3px;
            border: 1px solid #bfdbfe;
        }

        .badge-roll {
            background-color: #e0f2fe;
            color: #0284c7;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            letter-spacing: 0.3px;
            border: 1px solid #bae6fd;
        }

        .welcome-heading {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            margin: 14px 0 8px 0;
        }

        .welcome-desc {
            color: #64748b;
            font-size: 13.5px;
            line-height: 1.5;
            margin-bottom: 22px;
            max-width: 600px;
        }

        .welcome-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        .welcome-tags {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .tag-pill {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #334155;
            font-size: 12px;
            font-weight: 600;
            padding: 6px 14px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-portal-blue {
            background-color: #1E66F5;
            color: #ffffff !important;
            font-size: 12.5px;
            font-weight: 600;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: 0 2px 6px rgba(30, 102, 245, 0.3);
        }

        .btn-portal-blue:hover {
            background-color: #1251CC;
            color: #ffffff !important;
            transform: translateY(-1px);
        }

        .btn-portal-outline-blue {
            background-color: transparent;
            color: #1E66F5 !important;
            border: 1.5px solid #1E66F5;
            font-size: 12.5px;
            font-weight: 600;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            cursor: pointer;
            width: 100%;
            transition: all 0.2s;
        }

        .btn-portal-outline-blue:hover {
            background-color: #eff6ff;
            color: #1251CC !important;
        }

        /* Readiness Card */
        .readiness-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 12px;
        }

        .readiness-title {
            font-size: 15px;
            font-weight: 700;
            color: #1E66F5;
            display: flex;
            align-items: center;
            gap: 6px;
            margin: 0;
        }

        .readiness-subtitle {
            font-size: 11.5px;
            color: #64748b;
            margin: 2px 0 0 0;
        }

        .badge-readiness {
            background-color: #eff6ff;
            color: #1E66F5;
            border: 1px solid #bfdbfe;
            font-size: 11.5px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 20px;
        }

        .progress-track {
            background-color: #e2e8f0;
            height: 6px;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 16px;
        }

        .progress-fill-blue {
            background: linear-gradient(90deg, #1E66F5 0%, #00D2FF 100%);
            height: 100%;
            border-radius: 10px;
            width: 100%;
        }

        .checklist-list {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 16px;
        }

        .checklist-item {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 8px 12px;
            font-size: 12px;
            font-weight: 500;
            color: #334155;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .checklist-item-title {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .check-icon-done {
            color: #1E66F5;
            font-size: 14px;
        }

        /* 4 Stat Boxes (From Admin Dashboard) */
        .stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-top: 3px solid #1E66F5;
            border-radius: 10px;
            padding: 18px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
            height: 100%;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1;
            margin-bottom: 6px;
        }

        .stat-label {
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 0;
        }

        .stat-icon-box {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .icon-box-blue {
            background-color: #eff6ff;
            color: #1E66F5;
        }

        .icon-box-amber {
            background-color: #fffbeb;
            color: #d97706;
        }

        .icon-box-cyan {
            background-color: #ecfeff;
            color: #0891b2;
        }

        .icon-box-emerald {
            background-color: #f0fdf4;
            color: #16a34a;
        }

        /* Card Headers */
        .card-header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
            padding-bottom: 12px;
            border-bottom: 1px solid #f1f5f9;
        }

        .card-header-info h4 {
            font-size: 16px;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-header-info p {
            font-size: 12px;
            color: #64748b;
            margin: 2px 0 0 0;
        }

        /* GridView Styling */
        .portal-gridview {
            width: 100%;
            border-collapse: collapse;
            font-size: 12.5px;
            margin-top: 8px;
        }

        .portal-gridview th {
            background-color: #1E66F5;
            color: #ffffff;
            font-weight: 700;
            padding: 11px 14px;
            border: none;
            text-align: left;
        }

        .portal-gridview td {
            padding: 11px 14px;
            border-bottom: 1px solid #f1f5f9;
            color: #1e293b;
        }

        .portal-gridview tr:hover td {
            background-color: #eff6ff;
        }

        /* Edit Profile Form Panel */
        .edit-profile-card {
            background: #ffffff;
            border: 1.5px solid #1E66F5;
            border-radius: 12px;
            padding: 24px;
            margin-top: 24px;
            box-shadow: 0 4px 15px rgba(30, 102, 245, 0.08);
        }

        .edit-profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #bfdbfe;
        }

        .edit-profile-header h3 {
            font-size: 17px;
            font-weight: 800;
            color: #1E66F5;
            margin: 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 16px;
            margin-bottom: 20px;
        }

        .form-field label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 13px;
            color: #0f172a;
            outline: none;
            transition: border-color 0.2s;
            box-sizing: border-box;
        }

        .form-input:focus {
            border-color: #1E66F5;
            box-shadow: 0 0 0 2px rgba(30, 102, 245, 0.2);
        }

        .form-input:disabled, .form-input[readonly] {
            background-color: #f1f5f9;
            color: #64748b;
        }

        /* Single View Tab Switching */
        .tab-pane {
            display: none;
            animation: fadeIn 0.25s ease-in-out;
        }

        .tab-pane.active-pane {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(4px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 991px) {
            .portal-wrapper {
                flex-direction: column;
            }
            .portal-sidebar {
                width: 100%;
                min-height: auto;
            }
            .workspace-main {
                padding: 20px 16px;
            }
        }
    </style>

    <script type="text/javascript">
        function switchTab(tabId, el) {
            var panes = document.querySelectorAll('.tab-pane');
            for (var i = 0; i < panes.length; i++) {
                panes[i].classList.remove('active-pane');
                panes[i].style.display = 'none';
            }

            var selected = document.getElementById(tabId);
            if (selected) {
                selected.classList.add('active-pane');
                selected.style.display = 'block';
            }

            var links = document.querySelectorAll('.portal-menu-link');
            for (var j = 0; j < links.length; j++) {
                links[j].classList.remove('active');
            }
            if (el) {
                el.classList.add('active');
            } else {
                var currentLink = document.querySelector('[data-tab="' + tabId + '"]');
                if (currentLink) {
                    currentLink.classList.add('active');
                }
            }

            var hf = document.getElementById('<%= hfActiveTab.ClientID %>');
            if (hf) {
                hf.value = tabId;
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            var urlParams = new URLSearchParams(window.location.search);
            var tabParam = urlParams.get('tab');
            var hf = document.getElementById('<%= hfActiveTab.ClientID %>');
            var tabToOpen = tabParam || ((hf && hf.value) ? hf.value : 'tab-overview');
            switchTab(tabToOpen);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hidden Field to Remember Active Tab Across PostBacks -->
    <asp:HiddenField ID="hfActiveTab" runat="server" Value="tab-overview" />

    <div class="portal-wrapper">

        <!-- ================= BLUE LEFT SIDEBAR (ADMIN PORTAL) ================= -->
        <aside class="portal-sidebar">
            <div class="portal-brand">
                <div class="portal-brand-icon">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <div class="portal-brand-text">
                    <h4>TITAN FITNESS</h4>
                    <span>ADMIN PORTAL</span>
                </div>
            </div>

            <ul class="portal-menu">
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link active" data-tab="tab-overview" onclick="switchTab('tab-overview', this);">
                        <i class="fa-solid fa-gauge-high"></i> Overview
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-profile" onclick="switchTab('tab-profile', this);">
                        <i class="fa-solid fa-user-shield"></i> Admin Profile
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-members" onclick="switchTab('tab-members', this);">
                        <i class="fa-solid fa-users"></i> Manage Members
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-trainers" onclick="switchTab('tab-trainers', this);">
                        <i class="fa-solid fa-user-ninja"></i> Master Trainers
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-payments" onclick="switchTab('tab-payments', this);">
                        <i class="fa-solid fa-credit-card"></i> Manage Payments
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-queries" onclick="switchTab('tab-queries', this);">
                        <i class="fa-solid fa-comments"></i> Member Queries
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-activities" onclick="switchTab('tab-activities', this);">
                        <i class="fa-solid fa-bell"></i> Activity & Alerts
                    </a>
                </li>
            </ul>
        </aside>

        <!-- ================= MAIN WORKSPACE AREA ================= -->
        <main class="workspace-main">

            <!-- Top Header Bar -->
            <div class="workspace-topbar">
                <h1 class="workspace-title">Admin Workspace</h1>
                <div class="workspace-userbar">
                    <div class="workspace-bell" title="System Alerts" onclick="switchTab('tab-activities');">
                        <i class="fa-regular fa-bell"></i>
                    </div>
                    <div class="workspace-user-info">
                        <span class="workspace-role-label">
                            <asp:Label ID="lblTopUserName" runat="server" Text="Administrator"></asp:Label>
                        </span>
                        <div class="workspace-avatar">
                            <asp:Label ID="lblAvatarInitial" runat="server" Text="A"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Global Message Notification -->
            <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3 fw-bold"></asp:Label>

            <!-- ================= TAB 1: OVERVIEW (ALL ADMIN DASHBOARD DATA) ================= -->
            <div id="tab-overview" class="tab-pane active-pane">
                
                <!-- ROW 1: Welcome Greeting Card & System Readiness Card -->
                <div class="row g-4 mb-4">
                    
                    <!-- Left Card: Greeting & Central Dashboard -->
                    <div class="col-lg-7">
                        <div class="portal-card h-100">
                            <div class="d-flex gap-2 flex-wrap mb-2">
                                <span class="badge-workspace">
                                    <i class="fa-solid fa-shield-halved"></i> ADMIN WORKSPACE
                                </span>
                                <span class="badge-roll">
                                    <i class="fa-solid fa-id-badge"></i>
                                    <asp:Label ID="lblBadgeAdminId" runat="server" Text="Admin ID: #ADM-001"></asp:Label>
                                </span>
                            </div>

                            <h2 class="welcome-heading">
                                <asp:Label ID="lblHelloName" runat="server" Text="Hello, ADMINISTRATOR!"></asp:Label>
                            </h2>

                            <p class="welcome-desc">
                                Your central control center for Titan Fitness. Monitor registered gym members, approve pending offline payments, respond to inquiries, and manage system operations.
                            </p>

                            <div class="welcome-footer">
                                <div class="welcome-tags">
                                    <span class="tag-pill">
                                        <i class="fa-solid fa-circle-check text-primary"></i>
                                        Status: <asp:Label ID="lblBadgeStatus" runat="server" Text="Active"></asp:Label>
                                    </span>
                                    <span class="tag-pill">
                                        <i class="fa-solid fa-key text-info"></i>
                                        Role: Super Admin
                                    </span>
                                </div>

                                <a href="javascript:void(0);" onclick="switchTab('tab-members');" class="btn-portal-blue">
                                    Manage Members <i class="fa-solid fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Right Card: System Health & Readiness -->
                    <div class="col-lg-5">
                        <div class="portal-card h-100">
                            <div class="readiness-header">
                                <div>
                                    <h3 class="readiness-title">
                                        <i class="fa-solid fa-server"></i> System Health & Security
                                    </h3>
                                    <p class="readiness-subtitle">Gym Management Status Index</p>
                                </div>
                                <span class="badge-readiness">100% Operational</span>
                            </div>

                            <!-- Progress Bar -->
                            <div class="progress-track">
                                <div class="progress-fill-blue"></div>
                            </div>

                            <!-- Checklist Items -->
                            <div class="checklist-list">
                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-database text-primary"></i> Database & Member Server Online
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-credit-card text-primary"></i> Offline Payment Sync Active
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-lock text-primary"></i> Admin Authentication Verified
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-comments text-primary"></i> Member Inquiry Inbox Connected
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>
                            </div>

                            <!-- Action Button: Opens Admin Profile Tab -->
                            <a href="javascript:void(0);" onclick="switchTab('tab-profile');" class="btn-portal-outline-blue">
                                <i class="fa-regular fa-pen-to-square"></i> Update Admin Profile
                            </a>
                        </div>
                    </div>

                </div>

                <!-- ROW 2: 4 KPI Stat Boxes (All Admin Dashboard Cards) -->
                <div class="row g-3 mb-4">
                    
                    <!-- Stat 1: Total Registered Members -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalMembers" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Total Registered Members</p>
                            </div>
                            <div class="stat-icon-box icon-box-blue">
                                <i class="fa-solid fa-users"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 2: Pending Offline Payments -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card" style="border-top-color: #d97706;">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblPendingPayments" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Pending Payments</p>
                            </div>
                            <div class="stat-icon-box icon-box-amber">
                                <i class="fa-solid fa-clock"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 3: User Feedbacks / Queries -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card" style="border-top-color: #0891b2;">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalQueries" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Feedbacks / Queries</p>
                            </div>
                            <div class="stat-icon-box icon-box-cyan">
                                <i class="fa-solid fa-comments"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 4: Active Approved Subscriptions -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card" style="border-top-color: #16a34a;">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblActiveMembers" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Active Subscriptions</p>
                            </div>
                            <div class="stat-icon-box icon-box-emerald">
                                <i class="fa-solid fa-shield-halved"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 5: Master Trainers Roster -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card" style="border-top-color: #8b5cf6;">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalTrainers" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Master Trainers</p>
                            </div>
                            <div class="stat-icon-box" style="background: rgba(139, 92, 246, 0.12); color: #8b5cf6;">
                                <i class="fa-solid fa-user-ninja"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Quick Navigation Shortcuts -->
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-bolt text-primary"></i> Quick Administration Shortcuts</h4>
                            <p>Direct shortcuts to manage members, process offline payments, and answer messages.</p>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="javascript:void(0);" onclick="switchTab('tab-members');" class="btn-portal-blue">
                            <i class="fa-solid fa-users"></i> Directory of Members
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-trainers');" class="btn-portal-blue">
                            <i class="fa-solid fa-user-ninja"></i> Master Trainers Roster
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-payments');" class="btn-portal-blue">
                            <i class="fa-solid fa-credit-card"></i> Approve Payments
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-queries');" class="btn-portal-blue">
                            <i class="fa-solid fa-comments"></i> Member Messages
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-profile');" class="btn-portal-blue">
                            <i class="fa-solid fa-user-shield"></i> Admin Details
                        </a>
                    </div>
                </div>

            </div>

            <!-- ================= TAB 2: ADMIN PROFILE (SINGLE VIEW) ================= -->
            <div id="tab-profile" class="tab-pane">
                
                <!-- GridView Card for Admin Profile Record -->
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-user-shield text-primary"></i> Admin Profile Record (GridView)</h4>
                            <p>Live database administrator details fetched via GridView.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                                <asp:BoundField DataField="FullName" HeaderText="Admin Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                                <asp:BoundField DataField="Phone" HeaderText="Mobile Phone" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" />
                                <asp:BoundField DataField="Status" HeaderText="Account Status" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Edit" ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-outline-primary" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No admin record found in database.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>

                <!-- Admin Edit Profile Form -->
                <div class="edit-profile-card">
                    <div class="edit-profile-header">
                        <h3><i class="fa-regular fa-pen-to-square"></i> Edit Administrator Profile</h3>
                    </div>

                    <div class="form-grid">
                        <div class="form-field">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="Full Name"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Admin Email (Login ID)</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Mobile Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="Phone Number"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Date of Birth</label>
                            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-input" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-input">
                                <asp:ListItem Value="" Text="Select Gender"></asp:ListItem>
                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-field" style="grid-column: 1 / -1;">
                            <label>Office Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input" placeholder="Office / Residential Address"></asp:TextBox>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn-portal-blue" OnClick="btnSaveProfile_Click" />
                    </div>
                </div>

            </div>

            <!-- ================= TAB 3: MANAGE MEMBERS (SINGLE VIEW) ================= -->
            <div id="tab-members" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-users text-primary"></i> Registered Gym Members (GridView)</h4>
                            <p>Directory of all registered gym members in Titan Fitness.</p>
                        </div>
                        <a href="admin_members.aspx" class="btn-portal-blue">
                            Full Member Manager <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvAdminMembers" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <asp:Image ID="imgAdminMemPhoto" runat="server" 
                                            ImageUrl='<%# Eval("Photo") != DBNull.Value && !string.IsNullOrEmpty(Eval("Photo").ToString()) ? Eval("Photo") : "https://cdn-icons-png.flaticon.com/512/3135/3135715.png" %>' 
                                            Width="38px" Height="38px" 
                                            Style="border-radius: 50%; object-fit: cover; border: 2px solid #1E66F5; display: inline-block; vertical-align: middle;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                <asp:BoundField DataField="PlanName" HeaderText="Selected Plan" />
                                <asp:BoundField DataField="PaymentStatus" HeaderText="Payment Status" />
                                <asp:BoundField DataField="FitnessGoal" HeaderText="Goal" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No registered members found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ================= TAB: MANAGE TRAINERS (SINGLE VIEW) ================= -->
            <div id="tab-trainers" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-user-ninja text-primary"></i> Titan Master Trainers Roster (GridView)</h4>
                            <p>Live database records of certified Titan Fitness trainers and coaches.</p>
                        </div>
                        <span class="badge-role-user" style="background: rgba(30, 102, 245, 0.1); border: 1px solid rgba(30, 102, 245, 0.3); color: #1E66F5; padding: 6px 14px; border-radius: 20px; font-weight: 600; font-size: 13px;">
                            <i class="fa-solid fa-database me-1"></i> Live Database Record
                        </span>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvAdminTrainers" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Trainer Name">
                                    <ItemTemplate>
                                        <span class="fw-bold text-dark"><i class="fa-solid fa-user-check text-primary me-2"></i><%# Eval("Name") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Specialty" HeaderText="Specialty" />
                                <asp:BoundField DataField="Experience" HeaderText="Experience" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">Trainer roster is currently syncing or empty.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 4: MANAGE PAYMENTS (SINGLE VIEW) ================= -->
            <div id="tab-payments" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-credit-card text-primary"></i> Offline & Online Payments (GridView)</h4>
                            <p>Review transactions and approve offline cash payments.</p>
                        </div>
                        <a href="admin_payments.aspx" class="btn-portal-blue">
                            Payment Manager <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvAdminPayments" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None" OnRowCommand="gvAdminPayments_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                                <asp:BoundField DataField="UserEmail" HeaderText="Member Email" />
                                <asp:BoundField DataField="PlanName" HeaderText="Plan Name" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount ($)" />
                                <asp:BoundField DataField="Date" HeaderText="Payment Date" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnApproveRow" runat="server" CommandName="ApprovePayment" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-success" Visible='<%# Eval("Status") + "" == "Pending" %>'>
                                            <i class="fa-solid fa-check"></i> Approve
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No payment records found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 5: MEMBER QUERIES (SINGLE VIEW) ================= -->
            <div id="tab-queries" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-comments text-primary"></i> Member Messages & Feedbacks (GridView)</h4>
                            <p>Inquiries received from the Contact Us form.</p>
                        </div>
                        <a href="admin_queries.aspx" class="btn-portal-blue">
                            Query Manager <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvAdminQueries" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                                <asp:BoundField DataField="FullName" HeaderText="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="Message" HeaderText="Message" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No messages or queries found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 6: ACTIVITY & ALERTS (SINGLE VIEW) ================= -->
            <div id="tab-activities" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-bell text-primary"></i> System Activity Log & Alerts</h4>
                            <p>Live security events and operational logs.</p>
                        </div>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>Database Sync Verification Completed</h5>
                            <p>Local SQL LocalDB connection verified and responding normally.</p>
                        </div>
                        <span class="badge-status-approved">Verified</span>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>Daily Member Registration Audit</h5>
                            <p>All newly joined members cataloged in the Titan Fitness database.</p>
                        </div>
                        <span class="badge-status-approved">Normal</span>
                    </div>

                    <div class="alert-item mb-0">
                        <div class="alert-text">
                            <h5>Automated Payment Ledger Audit</h5>
                            <p>Pending offline cash payment records flagged for administrator approval.</p>
                        </div>
                        <span class="badge-status-pending">Logged</span>
                    </div>
                </div>
            </div>

        </main>
    </div>
</asp:Content>
