<%@ Page Title="Member Workspace | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Titan_Fitness.UserProfile" %>

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

        /* Profile Readiness Card */
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
            width: 85%;
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

        .check-icon-pending {
            color: #94a3b8;
            font-size: 14px;
        }

        /* 4 Stat Boxes (Middle Row) */
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

        .icon-box-indigo {
            background-color: #eef2ff;
            color: #4f46e5;
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

        /* Alerts List */
        .alert-item {
            padding: 14px 16px;
            border-radius: 8px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            margin-bottom: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .alert-text h5 {
            font-size: 13.5px;
            font-weight: 700;
            color: #1e293b;
            margin: 0 0 4px 0;
        }

        .alert-text p {
            font-size: 12px;
            color: #64748b;
            margin: 0;
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

        .badge-status-approved {
            background-color: #dcfce7;
            color: #16a34a;
            padding: 3px 8px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 11px;
        }

        .badge-status-pending {
            background-color: #fef3c7;
            color: #d97706;
            padding: 3px 8px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 11px;
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

        /* Tab Content Switching */
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
            // Hide all tab panes
            var panes = document.querySelectorAll('.tab-pane');
            for (var i = 0; i < panes.length; i++) {
                panes[i].classList.remove('active-pane');
                panes[i].style.display = 'none';
            }

            // Show selected pane
            var selected = document.getElementById(tabId);
            if (selected) {
                selected.classList.add('active-pane');
                selected.style.display = 'block';
            }

            // Update active link on sidebar menu
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

            // Store active tab in HiddenField
            var hf = document.getElementById('<%= hfActiveTab.ClientID %>');
            if (hf) {
                hf.value = tabId;
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            var hf = document.getElementById('<%= hfActiveTab.ClientID %>');
            var tabToOpen = (hf && hf.value) ? hf.value : 'tab-overview';
            switchTab(tabToOpen);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hidden Field to Remember Active Tab Across PostBacks -->
    <asp:HiddenField ID="hfActiveTab" runat="server" Value="tab-overview" />

    <div class="portal-wrapper">

        <!-- ================= BLUE LEFT SIDEBAR (TITAN FITNESS THEME) ================= -->
        <aside class="portal-sidebar">
            <div class="portal-brand">
                <div class="portal-brand-icon">
                    <i class="fa-solid fa-dumbbell"></i>
                </div>
                <div class="portal-brand-text">
                    <h4>TITAN FITNESS</h4>
                    <span>MEMBER PORTAL</span>
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
                        <i class="fa-regular fa-id-badge"></i> My Profile
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-plans" onclick="switchTab('tab-plans', this);">
                        <i class="fa-solid fa-layer-group"></i> Membership Plans
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-payments" onclick="switchTab('tab-payments', this);">
                        <i class="fa-solid fa-credit-card"></i> My Payments
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-workouts" onclick="switchTab('tab-workouts', this);">
                        <i class="fa-solid fa-heart-pulse"></i> Workout Tracker
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-notifications" onclick="switchTab('tab-notifications', this);">
                        <i class="fa-solid fa-bell"></i> Notifications
                    </a>
                </li>
                <li class="portal-menu-item">
                    <a href="javascript:void(0);" class="portal-menu-link" data-tab="tab-fitnesshub" onclick="switchTab('tab-fitnesshub', this);">
                        <i class="fa-solid fa-dumbbell"></i> Fitness Hub
                    </a>
                </li>
            </ul>
        </aside>

        <!-- ================= MAIN WORKSPACE AREA ================= -->
        <main class="workspace-main">

            <!-- Top Header Bar -->
            <div class="workspace-topbar">
                <h1 class="workspace-title">Member Workspace</h1>
                <div class="workspace-userbar">
                    <div class="workspace-bell" title="Notifications" onclick="switchTab('tab-notifications');">
                        <i class="fa-regular fa-bell"></i>
                    </div>
                    <div class="workspace-user-info">
                        <span class="workspace-role-label">
                            <asp:Label ID="lblTopUserName" runat="server" Text="Member"></asp:Label>
                        </span>
                        <div class="workspace-avatar" style="overflow: hidden; padding: 0; display: flex; align-items: center; justify-content: center;">
                            <asp:Image ID="imgTopAvatar" runat="server" Width="100%" Height="100%" Style="object-fit: cover; display: none;" />
                            <asp:Label ID="lblAvatarInitial" runat="server" Text="M"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Global Message Notification -->
            <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3 fw-bold"></asp:Label>

            <!-- ================= TAB 1: OVERVIEW (SINGLE VIEW) ================= -->
            <div id="tab-overview" class="tab-pane active-pane">

                <!-- Membership Status Alert Banner (dynamic from code-behind) -->
                <asp:Label ID="lblStatusBanner" runat="server"></asp:Label>

                <!-- ROW 1: Welcome Greeting Card & Profile Readiness Card -->
                <div class="row g-4 mb-4">
                    
                    <!-- Left Card: Greeting & Central Dashboard -->
                    <div class="col-lg-7">
                        <div class="portal-card h-100">
                            <div class="d-flex gap-2 flex-wrap mb-2">
                                <span class="badge-workspace">
                                    <i class="fa-solid fa-dumbbell"></i> MEMBER WORKSPACE
                                </span>
                                <span class="badge-roll">
                                    <i class="fa-solid fa-id-card"></i>
                                    <asp:Label ID="lblBadgeUserId" runat="server" Text="Roll / ID: #TITAN-001"></asp:Label>
                                </span>
                            </div>

                            <h2 class="welcome-heading">
                                <asp:Label ID="lblHelloName" runat="server" Text="Hello, MEMBER!"></asp:Label>
                            </h2>

                            <p class="welcome-desc">
                                Your central dashboard for fitness memberships. Explore live workout plans, track membership status, and manage your verified profile.
                            </p>

                            <div class="welcome-footer">
                                <div class="welcome-tags">
                                    <span class="tag-pill">
                                        <i class="fa-solid fa-tag text-primary"></i>
                                        <asp:Label ID="lblBadgePlan" runat="server" Text="No Active Plan"></asp:Label>
                                    </span>
                                    <span class="tag-pill">
                                        <i class="fa-solid fa-bullseye text-info"></i>
                                        <asp:Label ID="lblBadgeGoal" runat="server" Text="General Fitness"></asp:Label>
                                    </span>
                                </div>

                                <a href="javascript:void(0);" onclick="switchTab('tab-plans');" class="btn-portal-blue">
                                    Browse Plans <i class="fa-solid fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Right Card: Profile Readiness -->
                    <div class="col-lg-5">
                        <div class="portal-card h-100">
                            <div class="readiness-header">
                                <div>
                                    <h3 class="readiness-title">
                                        <i class="fa-solid fa-user-check"></i> Profile Readiness
                                    </h3>
                                    <p class="readiness-subtitle">Membership Eligibility Index</p>
                                </div>
                                <span class="badge-readiness">
                                    <asp:Label ID="lblReadinessPercent" runat="server" Text="85% Complete"></asp:Label>
                                </span>
                            </div>

                            <!-- Progress Bar -->
                            <div class="progress-track">
                                <div class="progress-fill-blue"></div>
                            </div>

                            <!-- Checklist Items -->
                            <div class="checklist-list">
                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-regular fa-address-card text-primary"></i> Basic Registration & Contact
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-award text-primary"></i> Membership Plan Active
                                    </div>
                                    <asp:Label ID="lblPlanStatusIcon" runat="server" Text="<i class='fa-solid fa-circle-check check-icon-done'></i>"></asp:Label>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-solid fa-bullseye text-primary"></i> Fitness Goal & Body Metrics
                                    </div>
                                    <i class="fa-solid fa-circle-check check-icon-done"></i>
                                </div>

                                <div class="checklist-item">
                                    <div class="checklist-item-title">
                                        <i class="fa-regular fa-file-lines text-muted"></i> Profile Details & Address
                                    </div>
                                    <i class="fa-regular fa-circle check-icon-pending"></i>
                                </div>
                            </div>

                            <!-- Action Button: Opens Profile Tab -->
                            <a href="javascript:void(0);" onclick="switchTab('tab-profile');" class="btn-portal-outline-blue">
                                <i class="fa-regular fa-pen-to-square"></i> Update Profile & Details
                            </a>
                        </div>
                    </div>

                </div>

                <!-- ROW 2: 4 KPI Stat Boxes -->
                <div class="row g-3 mb-4">
                    
                    <!-- Stat 1: Active Plans -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblStatActivePlans" runat="server" Text="1"></asp:Label>
                                </div>
                                <p class="stat-label">Active Plans</p>
                            </div>
                            <div class="stat-icon-box icon-box-blue">
                                <i class="fa-solid fa-file-lines"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 2: Attendance Days -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblStatAttendance" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Attendance Days</p>
                            </div>
                            <div class="stat-icon-box icon-box-indigo">
                                <i class="fa-solid fa-user-group"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 3: Workouts Logged -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblStatWorkouts" runat="server" Text="0"></asp:Label>
                                </div>
                                <p class="stat-label">Workouts Logged</p>
                            </div>
                            <div class="stat-icon-box icon-box-cyan">
                                <i class="fa-solid fa-dumbbell"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Stat 4: Total Payments -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">
                                    <asp:Label ID="lblStatPayments" runat="server" Text="1"></asp:Label>
                                </div>
                                <p class="stat-label">Total Payments</p>
                            </div>
                            <div class="stat-icon-box icon-box-emerald">
                                <i class="fa-solid fa-credit-card"></i>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Quick Section Overview -->
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-bolt text-primary"></i> Quick Workspace Navigation</h4>
                            <p>Direct shortcuts to your fitness management modules.</p>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="javascript:void(0);" onclick="switchTab('tab-profile');" class="btn-portal-blue">
                            <i class="fa-regular fa-id-badge"></i> View My Profile
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-plans');" class="btn-portal-blue">
                            <i class="fa-solid fa-layer-group"></i> View Plans
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-payments');" class="btn-portal-blue">
                            <i class="fa-solid fa-receipt"></i> Payment History
                        </a>
                        <a href="javascript:void(0);" onclick="switchTab('tab-fitnesshub');" class="btn-portal-blue">
                            <i class="fa-solid fa-dumbbell"></i> Fitness Hub
                        </a>
                    </div>
                </div>

            </div>

            <!-- ================= TAB 2: MY PROFILE (SINGLE VIEW) ================= -->
            <div id="tab-profile" class="tab-pane">
                
                <!-- GridView Card for Member Profile -->
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-id-card text-primary"></i> Member Profile Record (GridView)</h4>
                            <p>Live database profile details fetched via GridView.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" />
                                <asp:TemplateField HeaderText="Profile Photo">
                                    <ItemTemplate>
                                        <asp:Image ID="imgGridPhoto" runat="server" 
                                            ImageUrl='<%# Eval("Photo") != DBNull.Value && !string.IsNullOrEmpty(Eval("Photo").ToString()) ? Eval("Photo") : "https://cdn-icons-png.flaticon.com/512/3135/3135715.png" %>' 
                                            Width="42px" Height="42px" 
                                            Style="border-radius: 50%; object-fit: cover; border: 2px solid #1E66F5; display: inline-block; vertical-align: middle;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email Address" />
                                <asp:BoundField DataField="Phone" HeaderText="Mobile Phone" />
                                <asp:BoundField DataField="PlanName" HeaderText="Current Plan" />
                                <asp:BoundField DataField="PaymentStatus" HeaderText="Status" />
                                <asp:BoundField DataField="FitnessGoal" HeaderText="Goal" />
                                <asp:BoundField DataField="Weight" HeaderText="Weight (kg)" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Edit" ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-outline-primary" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No member record found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>

                <!-- Profile Update Form -->
                <div class="edit-profile-card">
                    <div class="edit-profile-header">
                        <h3><i class="fa-regular fa-pen-to-square"></i> Edit Profile Information</h3>
                    </div>

                    <!-- Profile Photo Preview and Upload Field -->
                    <div class="d-flex align-items-center gap-4 mb-4 p-3" style="background: #f8fafc; border-radius: 12px; border: 1px solid #e2e8f0;">
                        <div>
                            <asp:Image ID="imgProfilePreview" runat="server" 
                                ImageUrl="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" 
                                Width="80px" Height="80px" 
                                Style="border-radius: 50%; object-fit: cover; border: 3px solid #1E66F5; box-shadow: 0 4px 10px rgba(30,102,245,0.2);" />
                        </div>
                        <div class="flex-grow-1">
                            <label class="fw-bold mb-1" style="color: #334155; font-size: 14px;">Profile Photo</label>
                            <asp:FileUpload ID="fuProfilePhoto" runat="server" CssClass="form-control" />
                            <small class="text-muted d-block mt-1">Supported formats: JPG, PNG, WEBP</small>
                            <asp:HiddenField ID="hfCurrentPhoto" runat="server" />
                        </div>
                    </div>

                    <div class="form-grid">
                        <div class="form-field">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" placeholder="Your Full Name"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Email Address (Account ID)</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Mobile Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" placeholder="Phone Number"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Fitness Goal</label>
                            <asp:DropDownList ID="ddlFitnessGoal" runat="server" CssClass="form-input">
                                <asp:ListItem Value="" Text="Select Fitness Goal"></asp:ListItem>
                                <asp:ListItem Value="Weight Loss" Text="Weight Loss"></asp:ListItem>
                                <asp:ListItem Value="Muscle Building" Text="Muscle Building"></asp:ListItem>
                                <asp:ListItem Value="Endurance & Cardio" Text="Endurance & Cardio"></asp:ListItem>
                                <asp:ListItem Value="General Fitness" Text="General Fitness"></asp:ListItem>
                                <asp:ListItem Value="Flexibility & Yoga" Text="Flexibility & Yoga"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-field">
                            <label>Weight (kg)</label>
                            <asp:TextBox ID="txtWeight" runat="server" CssClass="form-input" placeholder="e.g. 70"></asp:TextBox>
                        </div>

                        <div class="form-field">
                            <label>Height (cm)</label>
                            <asp:TextBox ID="txtHeight" runat="server" CssClass="form-input" placeholder="e.g. 175"></asp:TextBox>
                        </div>

                        <div class="form-field" style="grid-column: 1 / -1;">
                            <label>Residential Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input" placeholder="Address"></asp:TextBox>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn-portal-blue" OnClick="btnSaveProfile_Click" />
                    </div>
                </div>

            </div>

            <!-- ================= TAB 3: MEMBERSHIP PLANS (SINGLE VIEW) ================= -->
            <div id="tab-plans" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-layer-group text-primary"></i> Membership Plans & Status</h4>
                            <p>Review your active subscription or upgrade to a new package.</p>
                        </div>
                        <a href="Plans.aspx" class="btn-portal-blue">
                            All Plans <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="row g-4 mt-1">
                        <div class="col-md-6 col-lg-3">
                            <div class="stat-card">
                                <div>
                                    <h5 class="fw-bold mb-1">Basic Plan</h5>
                                    <p class="text-muted small mb-2">$29 / Month</p>
                                    <span class="badge-status-approved">Gym Access</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="stat-card">
                                <div>
                                    <h5 class="fw-bold mb-1">Standard Plan</h5>
                                    <p class="text-muted small mb-2">$59 / Month</p>
                                    <span class="badge-status-approved">Gym + Cardio</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="stat-card" style="border-top-color: #00D2FF;">
                                <div>
                                    <h5 class="fw-bold mb-1 text-primary">Premium Plan</h5>
                                    <p class="text-muted small mb-2">$89 / Month</p>
                                    <span class="badge-status-approved">Trainer + Diet</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="stat-card" style="border-top-color: #f59e0b;">
                                <div>
                                    <h5 class="fw-bold mb-1">VIP Unlimited</h5>
                                    <p class="text-muted small mb-2">$129 / Month</p>
                                    <span class="badge-status-approved">All Inclusive</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 4: MY PAYMENTS (SINGLE VIEW) ================= -->
            <div id="tab-payments" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-credit-card text-primary"></i> Payment Records (GridView)</h4>
                            <p>History of your gym membership subscription fee payments.</p>
                        </div>
                        <a href="Payment.aspx" class="btn-portal-blue">
                            Make New Payment <i class="fa-solid fa-plus"></i>
                        </a>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvUserPayments" runat="server" AutoGenerateColumns="False" CssClass="portal-gridview" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Payment ID" ItemStyle-Width="90px" />
                                <asp:BoundField DataField="PlanName" HeaderText="Plan Name" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount ($)" />
                                <asp:BoundField DataField="Date" HeaderText="Transaction Date" />
                                <asp:BoundField DataField="Status" HeaderText="Payment Status" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center p-3 text-muted">No payment records found.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 5: WORKOUT TRACKER (SINGLE VIEW) ================= -->
            <div id="tab-workouts" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-heart-pulse text-primary"></i> Workout Tracker & Activity Log</h4>
                            <p>Monitor your daily gym routines, calories burned, and training consistency.</p>
                        </div>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>Chest & Triceps Hypertrophy</h5>
                            <p>Bench Press 4x10, Incline Dumbbell Press 3x12, Cable Pushdowns 4x15.</p>
                        </div>
                        <span class="badge-status-approved">Completed</span>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>Back & Biceps Power</h5>
                            <p>Deadlifts 4x8, Lat Pulldowns 3x12, Barbell Curls 4x10.</p>
                        </div>
                        <span class="badge-status-approved">Completed</span>
                    </div>

                    <div class="alert-item mb-0">
                        <div class="alert-text">
                            <h5>Legs & Core Conditioning</h5>
                            <p>Squats 4x10, Leg Press 3x15, Hanging Leg Raises 3x20.</p>
                        </div>
                        <span class="badge-status-pending">Scheduled</span>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 6: NOTIFICATIONS (SINGLE VIEW) ================= -->
            <div id="tab-notifications" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-bell text-primary"></i> Recent Notifications & Drive Alerts</h4>
                            <p>Latest updates and fitness drive announcements at Titan Fitness.</p>
                        </div>
                        <a href="Plans.aspx" class="btn-portal-blue">
                            All Plans <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>HIIT & Strength Bootcamp 2026</h5>
                            <p>Special intensive training program for premium members starting next Monday.</p>
                        </div>
                        <span class="badge-status-approved">Open</span>
                    </div>

                    <div class="alert-item">
                        <div class="alert-text">
                            <h5>Weekend Nutrition & Wellness Workshop</h5>
                            <p>Complimentary personal trainer diet assessment for all registered members.</p>
                        </div>
                        <span class="badge-status-approved">Active</span>
                    </div>

                    <div class="alert-item mb-0">
                        <div class="alert-text">
                            <h5>Gym Floor Maintenance Notice</h5>
                            <p>Cardio zone routine inspection every Sunday 1:00 PM to 3:00 PM.</p>
                        </div>
                        <span class="badge-status-pending">Notice</span>
                    </div>
                </div>
            </div>

            <!-- ================= TAB 7: FITNESS HUB (RENAMED FROM TRAINING HUB) ================= -->
            <div id="tab-fitnesshub" class="tab-pane">
                <div class="portal-card">
                    <div class="card-header-flex">
                        <div class="card-header-info">
                            <h4><i class="fa-solid fa-dumbbell text-primary"></i> Fitness Hub & Certified Trainers</h4>
                            <p>Access master workout libraries, training guides, and expert coaching.</p>
                        </div>
                        <a href="Trainers.aspx" class="btn-portal-blue">
                            Explore Trainers <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>

                    <div class="row g-4 mt-1">
                        <div class="col-md-4">
                            <div class="portal-card border-primary text-center">
                                <i class="fa-solid fa-dumbbell text-primary fs-2 mb-2"></i>
                                <h5 class="fw-bold">Weight Training Hub</h5>
                                <p class="text-muted small">Progressive overload techniques, compound lifting form guides.</p>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="portal-card border-info text-center">
                                <i class="fa-solid fa-apple-whole text-info fs-2 mb-2"></i>
                                <h5 class="fw-bold">Nutrition Coaching</h5>
                                <p class="text-muted small">Personalized macro calculations, pre & post workout diet plans.</p>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="portal-card border-success text-center">
                                <i class="fa-solid fa-person-running text-success fs-2 mb-2"></i>
                                <h5 class="fw-bold">Cardio & HIIT Zone</h5>
                                <p class="text-muted small">Fat-burn interval workouts, stamina conditioning routines.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</asp:Content>
