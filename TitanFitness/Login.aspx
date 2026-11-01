<%@ Page Title="Sign In | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Titan_Fitness.Login" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .role-select-wrapper {
                margin-bottom: 22px;
                text-align: left;
            }
            .role-label {
                display: block;
                font-size: 0.9rem;
                font-weight: 600;
                margin-bottom: 10px;
                color: var(--text-muted);
            }
            .role-options {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 12px;
            }
            .role-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                padding: 11px 18px;
                border-radius: 10px;
                border: 1.5px solid var(--border-subtle);
                background: rgba(26, 35, 58, 0.6);
                color: var(--text-muted);
                font-size: 0.95rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
                user-select: none;
            }
            .role-btn:hover {
                border-color: var(--primary);
                color: var(--text-main);
                background: rgba(30, 102, 245, 0.12);
            }
            .role-btn.active.role-user {
                background: var(--primary);
                border-color: var(--primary);
                color: #ffffff;
                box-shadow: 0 4px 15px var(--primary-glow);
            }
            .role-btn.active.role-admin {
                background: linear-gradient(135deg, #FF4D4D 0%, #D32F2F 100%);
                border-color: #FF4D4D;
                color: #ffffff;
                box-shadow: 0 4px 15px rgba(255, 77, 77, 0.4);
            }
            .password-wrapper {
                position: relative;
            }
            .password-toggle-btn {
                position: absolute;
                right: 14px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--text-muted);
                cursor: pointer;
                transition: color 0.2s ease;
                z-index: 3;
                background: none;
                border: none;
                padding: 4px 6px;
                font-size: 1rem;
            }
            .password-toggle-btn:hover {
                color: var(--text-main);
            }
            .auth-options {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 22px;
                font-size: 0.88rem;
            }
            .remember-me {
                display: flex;
                align-items: center;
                gap: 8px;
                color: var(--text-muted);
                cursor: pointer;
                user-select: none;
            }
            .remember-me input[type="checkbox"] {
                width: 16px;
                height: 16px;
                accent-color: var(--primary);
                cursor: pointer;
            }
            .forgot-link {
                color: var(--accent);
                text-decoration: none;
                font-weight: 500;
                transition: color 0.2s ease;
            }
            .forgot-link:hover {
                text-decoration: underline;
                color: #ffffff;
            }
            .role-indicator {
                margin-top: 12px;
                font-size: 0.9rem;
                color: var(--text-muted);
            }
            .btn-admin-theme {
                background: linear-gradient(135deg, #FF4D4D 0%, #D32F2F 100%) !important;
                border-color: #FF4D4D !important;
                box-shadow: 0 4px 15px rgba(255, 77, 77, 0.4) !important;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section id="login" class="page-section auth-section">
            <div class="container auth-container">
                <div class="auth-card" id="authCard">
                    <div class="auth-header">
                        <div class="auth-icon" id="authIcon"><i class="fa-solid fa-right-to-bracket"></i></div>
                        <h2 id="loginTitle">Sign In</h2>
                        <p id="loginSubtitle">Enter your credentials to access your account.</p>
                    </div>

                    <div>
                        <asp:HiddenField ID="hfRole" runat="server" Value="User" />

                        <!-- Role Selection Tabs -->
                        <div class="role-select-wrapper">
                            <label class="role-label">Select Role</label>
                            <div class="role-options">
                                <button type="button" class="role-btn role-user active" id="btnRoleUser" onclick="selectRole('User')">
                                    <i class="fa-solid fa-user"></i> User
                                </button>
                                <button type="button" class="role-btn role-admin" id="btnRoleAdmin" onclick="selectRole('Admin')">
                                    <i class="fa-solid fa-user-shield"></i> Admin
                                </button>
                            </div>
                        </div>

                        <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center fw-bold mb-3"></asp:Label>

                        <div class="form-group">
                            <label id="lblEmail">Email Address *</label>
                            <div class="input-with-icon">
                                <i class="fa-solid fa-envelope input-icon"></i>
                                <asp:TextBox ID="txtLoginEmail" runat="server" TextMode="Email"
                                    placeholder="Enter your email" required="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Password *</label>
                            <div class="input-with-icon password-wrapper">
                                <i class="fa-solid fa-lock input-icon"></i>
                                <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password"
                                    placeholder="Enter your password" required="true"></asp:TextBox>
                                <span class="password-toggle-btn" onclick="togglePasswordVisibility()" title="Show/Hide password">
                                    <i class="fa-solid fa-eye" id="passwordToggleIcon"></i>
                                </span>
                            </div>
                        </div>

                        <div class="auth-options">
                            <label class="remember-me">
                                <input type="checkbox" id="chkRememberMe" />
                                <span>Remember me</span>
                            </label>
                            <a href="Contact.aspx" class="forgot-link">Forgot Password?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Sign In"
                            CssClass="btn btn-primary btn-full btn-lg" OnClick="btnLogin_Click" />

                        <asp:GridView ID="GridView1" runat="server" style="display:none;"></asp:GridView>

                        <div class="auth-footer">
                            <p id="registerPrompt">Don't have an account? <a href="Register.aspx">Register Now</a></p>
                            <p class="role-indicator">Login as: <span id="currentRoleText" style="font-weight: 700; color: var(--primary);">User</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            function selectRole(role) {
                var hfRole = document.getElementById('<%= hfRole.ClientID %>');
                var btnUser = document.getElementById('btnRoleUser');
                var btnAdmin = document.getElementById('btnRoleAdmin');
                var btnLogin = document.getElementById('<%= btnLogin.ClientID %>');
                var roleText = document.getElementById('currentRoleText');
                var regPrompt = document.getElementById('registerPrompt');
                var authIcon = document.getElementById('authIcon');
                var authCard = document.getElementById('authCard');
                var subtitle = document.getElementById('loginSubtitle');
                var emailInput = document.getElementById('<%= txtLoginEmail.ClientID %>');

                hfRole.value = role;

                if (role === 'Admin') {
                    btnUser.classList.remove('active');
                    btnAdmin.classList.add('active');

                    btnLogin.classList.add('btn-admin-theme');
                    btnLogin.value = 'Sign In as Admin';

                    roleText.innerText = 'Admin';
                    roleText.style.color = '#FF4D4D';

                    regPrompt.style.display = 'none';
                    subtitle.innerText = 'Restricted Access - Titan Fitness Management';
                    authIcon.style.background = 'linear-gradient(135deg, #FF4D4D 0%, #8B0000 100%)';
                    authIcon.innerHTML = '<i class="fa-solid fa-user-shield"></i>';
                    authCard.style.borderColor = 'rgba(255, 77, 77, 0.4)';
                    emailInput.placeholder = 'admin@titan.com';
                } else {
                    btnAdmin.classList.remove('active');
                    btnUser.classList.add('active');

                    btnLogin.classList.remove('btn-admin-theme');
                    btnLogin.value = 'Sign In';

                    roleText.innerText = 'User';
                    roleText.style.color = 'var(--primary)';

                    regPrompt.style.display = 'block';
                    subtitle.innerText = 'Enter your credentials to access your account.';
                    authIcon.style.background = 'linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%)';
                    authIcon.innerHTML = '<i class="fa-solid fa-right-to-bracket"></i>';
                    authCard.style.borderColor = 'var(--border-glow)';
                    emailInput.placeholder = 'Enter your email';
                }
            }

            function togglePasswordVisibility() {
                var pwdInput = document.getElementById('<%= txtLoginPassword.ClientID %>');
                var icon = document.getElementById('passwordToggleIcon');
                if (pwdInput.type === 'password') {
                    pwdInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    pwdInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                var currentRole = document.getElementById('<%= hfRole.ClientID %>').value;
                if (currentRole === 'Admin') {
                    selectRole('Admin');
                } else {
                    selectRole('User');
                }
            });
        </script>
    </asp:Content>