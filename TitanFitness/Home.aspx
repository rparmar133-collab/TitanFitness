<%@ Page Title="Home | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="Titan_Fitness.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Scoped Home Page Styling */
        .home-hero {
            position: relative;
            min-height: 90vh;
            display: flex;
            align-items: center;
            background: linear-gradient(180deg, rgba(11, 15, 25, 0.82) 0%, rgba(11, 15, 25, 0.95) 100%), 
                        url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat;
            padding: 140px 0 80px 0;
            overflow: hidden;
        }
        .hero-glow-orb {
            position: absolute;
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, rgba(0, 210, 255, 0.18) 0%, rgba(30, 102, 245, 0.05) 50%, transparent 70%);
            top: 15%;
            right: 5%;
            filter: blur(50px);
            pointer-events: none;
            z-index: 1;
        }
        .hero-inner {
            position: relative;
            z-index: 2;
            max-width: 820px;
        }
        .hero-pill-badge {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.35);
            color: var(--accent);
            padding: 8px 20px;
            border-radius: var(--radius-full);
            font-size: 0.88rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 24px;
            box-shadow: 0 0 20px rgba(0, 210, 255, 0.15);
        }
        .hero-main-title {
            font-size: clamp(2.6rem, 5.5vw, 4.4rem);
            font-weight: 900;
            line-height: 1.1;
            color: #FFFFFF;
            margin-bottom: 22px;
            text-transform: uppercase;
            letter-spacing: -0.5px;
        }
        .hero-main-subtitle {
            font-size: clamp(1.1rem, 2vw, 1.35rem);
            color: var(--text-muted);
            margin-bottom: 36px;
            max-width: 650px;
            line-height: 1.6;
        }
        .hero-cta-buttons {
            display: flex;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        /* Section Wrappers */
        .home-section {
            padding: 90px 0;
            position: relative;
        }
        .section-header-center {
            text-align: center;
            max-width: 720px;
            margin: 0 auto 55px auto;
        }
        .section-header-center .sub-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(30, 102, 245, 0.12);
            color: var(--accent);
            border: 1px solid rgba(0, 210, 255, 0.25);
            padding: 6px 18px;
            border-radius: var(--radius-full);
            font-size: 0.82rem;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            margin-bottom: 14px;
        }
        .section-header-center h2 {
            font-size: clamp(2rem, 3.5vw, 2.7rem);
            font-weight: 800;
            color: #FFFFFF;
            margin-bottom: 15px;
            text-transform: uppercase;
        }
        .section-header-center p {
            color: var(--text-muted);
            font-size: 1.05rem;
            line-height: 1.6;
        }

        /* Section 2: Quick Stats */
        .stats-grid-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 25px;
        }
        .stat-card-custom {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.75) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 35px 25px;
            text-align: center;
            transition: all 0.35s ease;
            position: relative;
            overflow: hidden;
        }
        .stat-card-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            opacity: 0;
            transition: opacity 0.35s ease;
        }
        .stat-card-custom:hover {
            transform: translateY(-8px);
            border-color: rgba(0, 210, 255, 0.4);
            box-shadow: 0 15px 35px rgba(30, 102, 245, 0.25);
        }
        .stat-card-custom:hover::before {
            opacity: 1;
        }
        .stat-card-icon {
            width: 65px;
            height: 65px;
            border-radius: 16px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.25);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin: 0 auto 20px auto;
            transition: transform 0.3s ease;
        }
        .stat-card-custom:hover .stat-card-icon {
            transform: scale(1.1);
        }
        .stat-card-number {
            font-size: 2.7rem;
            font-weight: 900;
            color: #FFFFFF;
            font-family: var(--font-heading);
            margin-bottom: 8px;
            line-height: 1;
        }
        .stat-card-label {
            color: var(--text-muted);
            font-size: 1rem;
            font-weight: 500;
            margin: 0;
        }

        /* Section 3: Workout of the Day */
        .wod-card-container {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.85) 0%, rgba(19, 27, 46, 0.98) 100%);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-md);
            display: grid;
            grid-template-columns: 1fr 1.25fr;
        }
        @media (max-width: 991px) {
            .wod-card-container {
                grid-template-columns: 1fr;
            }
        }
        .wod-media {
            position: relative;
            min-height: 380px;
            background: url('https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=1000&q=80') center/cover no-repeat;
        }
        .wod-media-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(11, 15, 25, 0.2) 0%, rgba(11, 15, 25, 0.9) 100%);
            display: flex;
            align-items: flex-end;
            padding: 30px;
        }
        .wod-content {
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .wod-meta-tags {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 16px;
        }
        .wod-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(30, 102, 245, 0.3);
            color: var(--accent);
            padding: 6px 14px;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        .wod-tag.diff {
            background: rgba(0, 230, 118, 0.15);
            border-color: rgba(0, 230, 118, 0.3);
            color: var(--success);
        }
        .wod-title {
            color: #FFFFFF;
            font-size: 1.8rem;
            font-weight: 800;
            margin-bottom: 20px;
        }
        .wod-exercise-list {
            list-style: none;
            padding: 0;
            margin: 0 0 25px 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }
        @media (max-width: 576px) {
            .wod-exercise-list {
                grid-template-columns: 1fr;
            }
        }
        .wod-exercise-item {
            background: rgba(11, 15, 25, 0.6);
            border: 1px solid var(--border-subtle);
            border-radius: 10px;
            padding: 12px 16px;
            display: flex;
            flex-direction: column;
        }
        .wod-exercise-name {
            color: #FFFFFF;
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 4px;
        }
        .wod-exercise-scheme {
            color: var(--accent);
            font-size: 0.82rem;
            font-weight: 500;
        }

        /* Section 4: Fitness Tips */
        .tips-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }
        .tip-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.7) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 30px 24px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.3s ease;
        }
        .tip-card:hover {
            transform: translateY(-6px);
            border-color: var(--primary);
            box-shadow: 0 12px 30px rgba(30, 102, 245, 0.25);
        }
        .tip-icon-wrap {
            width: 56px;
            height: 56px;
            border-radius: 14px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.25);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .tip-title {
            color: #FFFFFF;
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 12px;
        }
        .tip-desc {
            color: var(--text-muted);
            font-size: 0.93rem;
            line-height: 1.6;
            margin-bottom: 22px;
            flex-grow: 1;
        }
        .btn-tip-read {
            background: transparent;
            border: 1px solid rgba(0, 210, 255, 0.4);
            color: var(--accent);
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            width: 100%;
        }
        .btn-tip-read:hover {
            background: var(--primary);
            border-color: var(--primary);
            color: #FFFFFF;
            box-shadow: 0 4px 15px rgba(30, 102, 245, 0.4);
        }

        /* Section 5: Book a Free Trial */
        .trial-cta-wrapper {
            background: radial-gradient(circle at top right, rgba(0, 210, 255, 0.12) 0%, rgba(19, 27, 46, 0.98) 100%);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 50px 40px;
            box-shadow: var(--shadow-md);
            max-width: 860px;
            margin: 0 auto;
        }
        .trial-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }
        @media (max-width: 768px) {
            .trial-form-grid {
                grid-template-columns: 1fr;
            }
            .trial-cta-wrapper {
                padding: 35px 22px;
            }
        }
        .trial-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .trial-field label {
            color: var(--text-main);
            font-size: 0.92rem;
            font-weight: 600;
        }
        .trial-input {
            width: 100%;
            background: var(--bg-input);
            border: 1px solid var(--border-subtle);
            border-radius: 8px;
            padding: 13px 16px;
            color: #FFFFFF;
            font-size: 0.95rem;
            outline: none;
            transition: border-color 0.25s ease;
        }
        .trial-input:focus {
            border-color: var(--accent);
            box-shadow: 0 0 10px rgba(0, 210, 255, 0.25);
        }

        /* Interactive Modals */
        .titan-modal-backdrop {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(6, 9, 17, 0.85);
            backdrop-filter: blur(8px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .titan-modal-backdrop.show {
            display: flex;
        }
        .titan-modal-box {
            background: #131B2E;
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 35px;
            max-width: 600px;
            width: 100%;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.7);
            position: relative;
            animation: modalFadeIn 0.3s ease;
        }
        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .modal-close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.08);
            border: none;
            color: var(--text-muted);
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.2s ease;
        }
        .modal-close-btn:hover {
            background: rgba(255, 77, 77, 0.2);
            color: #FF4D4D;
        }
        .modal-icon-badge {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.3);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 18px;
        }
        .modal-title {
            color: #FFFFFF;
            font-size: 1.5rem;
            font-weight: 800;
            margin-bottom: 15px;
        }
        .modal-content-body {
            color: var(--text-muted);
            font-size: 0.98rem;
            line-height: 1.7;
        }
        .modal-content-body ul {
            margin-top: 15px;
            padding-left: 20px;
            list-style: disc;
        }
        .modal-content-body li {
            margin-bottom: 8px;
            color: var(--text-main);
        }


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ================= SECTION 1: HERO BANNER ================= -->
    <section class="home-hero">
        <div class="hero-glow-orb"></div>
        <div class="container">
            <div class="hero-inner">
                <div class="hero-pill-badge">
                    <i class="fa-solid fa-bolt"></i> Elite Fitness Architecture
                </div>
                <h1 class="hero-main-title">
                    BUILD YOUR <span class="gradient-text">STRONGER SELF</span>
                </h1>
                <p class="hero-main-subtitle">
                    Train Harder. Get Stronger. Become Unstoppable. Experience world-class equipment, personalized guidance, and an empowering atmosphere built for champions.
                </p>
                <div class="hero-cta-buttons">
                    <% if (Session["UserEmail"] == null) { %>
                        <a href="Register.aspx" class="btn btn-primary btn-lg">
                            Join Now <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    <% } else { %>
                        <a href="UserProfile.aspx" class="btn btn-primary btn-lg">
                            My Profile <i class="fa-solid fa-user-circle"></i>
                        </a>
                    <% } %>
                    <a href="Services.aspx" class="btn btn-outline btn-lg">
                        Explore Services <i class="fa-solid fa-dumbbell"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 2: QUICK STATS ================= -->
    <section class="home-section" style="background: var(--bg-dark); padding-top: 60px;">
        <div class="container">
            <div class="stats-grid-row">
                <!-- Stat 1: Active Members -->
                <div class="stat-card-custom">
                    <div class="stat-card-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div class="stat-card-number">1,500+</div>
                    <p class="stat-card-label">Active Members</p>
                </div>

                <!-- Stat 2: Expert Coaches -->
                <div class="stat-card-custom">
                    <div class="stat-card-icon">
                        <i class="fa-solid fa-user-ninja"></i>
                    </div>
                    <div class="stat-card-number">25+</div>
                    <p class="stat-card-label">Expert Coaches</p>
                </div>

                <!-- Stat 3: Workout Programs -->
                <div class="stat-card-custom">
                    <div class="stat-card-icon">
                        <i class="fa-solid fa-dumbbell"></i>
                    </div>
                    <div class="stat-card-number">50+</div>
                    <p class="stat-card-label">Workout Programs</p>
                </div>

                <!-- Stat 4: Years of Experience -->
                <div class="stat-card-custom">
                    <div class="stat-card-icon">
                        <i class="fa-solid fa-award"></i>
                    </div>
                    <div class="stat-card-number">10+</div>
                    <p class="stat-card-label">Years of Experience</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 3: WORKOUT OF THE DAY ================= -->
    <section class="home-section" style="background: radial-gradient(circle at top right, rgba(30, 102, 245, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="section-header-center">
                <span class="sub-tag"><i class="fa-solid fa-fire"></i> Daily Training Protocol</span>
                <h2>WORKOUT OF <span class="gradient-text">THE DAY</span></h2>
                <p>Curated by certified head coaches to maximize progressive overload and neuromuscular conditioning.</p>
            </div>

            <div class="wod-card-container">
                <div class="wod-media">
                    <div class="wod-media-overlay">
                        <div>
                            <span class="wod-tag diff mb-2 d-inline-block"><i class="fa-solid fa-bolt"></i> Daily Challenge</span>
                            <h4 class="text-white mb-0" style="font-size: 1.35rem; font-weight: 800;">Target: Full-Body Hypertrophy</h4>
                        </div>
                    </div>
                </div>

                <div class="wod-content">
                    <div>
                        <div class="wod-meta-tags">
                            <span class="wod-tag"><i class="fa-regular fa-clock"></i> 50 Mins</span>
                            <span class="wod-tag diff"><i class="fa-solid fa-signal"></i> Intermediate - Advanced</span>
                            <span class="wod-tag"><i class="fa-solid fa-cubes"></i> 6 Core Movements</span>
                        </div>
                        <h3 class="wod-title">Titan Full-Body Strength Routine</h3>

                        <ul class="wod-exercise-list">
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">1. Barbell Back Squats</span>
                                <span class="wod-exercise-scheme">4 Sets &bull; 8 - 10 Reps</span>
                            </li>
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">2. Incline Dumbbell Press</span>
                                <span class="wod-exercise-scheme">4 Sets &bull; 10 - 12 Reps</span>
                            </li>
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">3. Conventional Deadlift</span>
                                <span class="wod-exercise-scheme">3 Sets &bull; 6 - 8 Reps</span>
                            </li>
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">4. Wide-Grip Lat Pull-Down</span>
                                <span class="wod-exercise-scheme">4 Sets &bull; 10 - 12 Reps</span>
                            </li>
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">5. Overhead Barbell Press</span>
                                <span class="wod-exercise-scheme">3 Sets &bull; 8 - 10 Reps</span>
                            </li>
                            <li class="wod-exercise-item">
                                <span class="wod-exercise-name">6. Hanging Knee Raise / Plank</span>
                                <span class="wod-exercise-scheme">3 Sets &bull; 15 Reps / 60s</span>
                            </li>
                        </ul>
                    </div>

                    <div>
                        <button type="button" class="btn btn-primary" onclick="openWodModal();">
                            <i class="fa-solid fa-list-check"></i> View Full Workout Breakdown
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 4: FITNESS TIPS ================= -->
    <section class="home-section" style="background: var(--bg-dark);">
        <div class="container">
            <div class="section-header-center">
                <span class="sub-tag"><i class="fa-solid fa-lightbulb"></i> Expert Coaching Advice</span>
                <h2>PROVEN <span class="gradient-text">FITNESS TIPS</span></h2>
                <p>Actionable, science-backed guidance to optimize every training session and recover faster.</p>
            </div>

            <div class="tips-grid">
                <!-- Tip 1: Water Intake -->
                <div class="tip-card">
                    <div>
                        <div class="tip-icon-wrap">
                            <i class="fa-solid fa-bottle-water"></i>
                        </div>
                        <h3 class="tip-title">Water Intake</h3>
                        <p class="tip-desc">
                            Maintain peak cell volumization and prevent early fatigue by properly timing your fluid and electrolyte intake.
                        </p>
                    </div>
                    <button type="button" class="btn-tip-read" onclick="openTipModal('water');">
                        Read Tip <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>

                <!-- Tip 2: Recovery & Sleep -->
                <div class="tip-card">
                    <div>
                        <div class="tip-icon-wrap">
                            <i class="fa-solid fa-bed"></i>
                        </div>
                        <h3 class="tip-title">Recovery & Sleep</h3>
                        <p class="tip-desc">
                            Muscles grow outside the gym. Discover how 7-9 hours of restorative sleep stimulates natural growth hormones.
                        </p>
                    </div>
                    <button type="button" class="btn-tip-read" onclick="openTipModal('sleep');">
                        Read Tip <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>

                <!-- Tip 3: Track Your Progress -->
                <div class="tip-card">
                    <div>
                        <div class="tip-icon-wrap">
                            <i class="fa-solid fa-chart-line"></i>
                        </div>
                        <h3 class="tip-title">Track Your Progress</h3>
                        <p class="tip-desc">
                            Apply progressive overload consistently by recording sets, weights, and repetitions in a verified workout log.
                        </p>
                    </div>
                    <button type="button" class="btn-tip-read" onclick="openTipModal('progress');">
                        Read Tip <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>

                <!-- Tip 4: Warm-Up Routine -->
                <div class="tip-card">
                    <div>
                        <div class="tip-icon-wrap">
                            <i class="fa-solid fa-person-running"></i>
                        </div>
                        <h3 class="tip-title">Warm-Up Routine</h3>
                        <p class="tip-desc">
                            Prime your nervous system, lubricate joint capsules, and activate dormant muscle groups before heavy sets.
                        </p>
                    </div>
                    <button type="button" class="btn-tip-read" onclick="openTipModal('warmup');">
                        Read Tip <i class="fa-solid fa-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 5: BOOK A FREE TRIAL ================= -->
    <section id="trialSection" class="home-section" style="background: radial-gradient(circle at top left, rgba(0, 210, 255, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="section-header-center">
                <span class="sub-tag"><i class="fa-solid fa-ticket"></i> Try TitanFitness</span>
                <h2>BOOK A <span class="gradient-text">FREE TRIAL PASS</span></h2>
                <p>Step onto our training floor, test our elite equipment, and experience the Titan energy with zero obligation.</p>
            </div>

            <div class="trial-cta-wrapper">
                <asp:Label ID="lblTrialMessage" runat="server" CssClass="d-block text-center fw-bold mb-4 fs-5"></asp:Label>

                <div class="trial-form-grid">
                    <div class="trial-field">
                        <label>Full Name *</label>
                        <asp:TextBox ID="txtTrialName" runat="server" CssClass="trial-input" placeholder="e.g. John Doe"></asp:TextBox>
                    </div>

                    <div class="trial-field">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtTrialEmail" runat="server" CssClass="trial-input" TextMode="Email" placeholder="e.g. john@example.com"></asp:TextBox>
                    </div>

                    <div class="trial-field">
                        <label>Mobile Number *</label>
                        <asp:TextBox ID="txtTrialPhone" runat="server" CssClass="trial-input" placeholder="e.g. +1 555-0199"></asp:TextBox>
                    </div>

                    <div class="trial-field">
                        <label>Preferred Date *</label>
                        <asp:TextBox ID="txtTrialDate" runat="server" TextMode="Date" CssClass="trial-input"></asp:TextBox>
                    </div>

                    <div class="trial-field" style="grid-column: 1 / -1;">
                        <label>Preferred Time Slot</label>
                        <asp:DropDownList ID="ddlTrialTime" runat="server" CssClass="trial-input">
                            <asp:ListItem Value="Morning (06:00 AM - 10:00 AM)" Text="Morning (06:00 AM - 10:00 AM)"></asp:ListItem>
                            <asp:ListItem Value="Midday (11:00 AM - 03:00 PM)" Text="Midday (11:00 AM - 03:00 PM)"></asp:ListItem>
                            <asp:ListItem Value="Evening (04:00 PM - 09:00 PM)" Text="Evening (04:00 PM - 09:00 PM)"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnBookTrial" runat="server" Text="Claim Free Trial Pass" CssClass="btn btn-primary btn-lg" OnClick="btnBookTrial_Click" />
                    <p class="text-muted small mt-3 mb-0"><i class="fa-solid fa-lock"></i> No credit card required. Confirmation provided instantly.</p>
                </div>
            </div>



        </div>
    </section>

    <!-- ================= INTERACTIVE MODALS ================= -->
    <!-- Modal 1: Workout Breakdown Modal -->
    <div id="wodModal" class="titan-modal-backdrop" onclick="closeModalOnBackdrop(event, 'wodModal')">
        <div class="titan-modal-box">
            <button type="button" class="modal-close-btn" onclick="closeModal('wodModal')"><i class="fa-solid fa-xmark"></i></button>
            <div class="modal-icon-badge">
                <i class="fa-solid fa-dumbbell"></i>
            </div>
            <h3 class="modal-title">Titan Full-Body Hypertrophy Protocol</h3>
            <div class="modal-content-body">
                <p>This protocol focuses on multi-joint compound lifts to stimulate maximal motor unit recruitment and metabolic demand.</p>
                <ul>
                    <li><strong>Warm-Up:</strong> 5 mins dynamic joint mobility + 2 ramp-up sets per compound exercise.</li>
                    <li><strong>Rest Periods:</strong> 90 - 120 seconds for heavy compound lifts (Squat, Deadlift); 60 seconds on accessory movements.</li>
                    <li><strong>Tempo:</strong> 3-second controlled eccentric (lowering) phase, explosive concentric contraction.</li>
                    <li><strong>Progression:</strong> Strive to add 1 rep or 2.5 kg once all target repetitions are completed with clean form.</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Modal 2: Fitness Tips Modal -->
    <div id="tipModal" class="titan-modal-backdrop" onclick="closeModalOnBackdrop(event, 'tipModal')">
        <div class="titan-modal-box">
            <button type="button" class="modal-close-btn" onclick="closeModal('tipModal')"><i class="fa-solid fa-xmark"></i></button>
            <div id="tipModalIcon" class="modal-icon-badge">
                <i class="fa-solid fa-lightbulb"></i>
            </div>
            <h3 id="tipModalTitle" class="modal-title">Fitness Tip</h3>
            <div id="tipModalBody" class="modal-content-body">
                <!-- Injected dynamically via JS -->
            </div>
        </div>
    </div>

    <!-- Client-Side Modal Scripts -->
    <script type="text/javascript">
        var tipsData = {
            water: {
                icon: 'fa-solid fa-bottle-water',
                title: 'Water Intake & Intracellular Hydration',
                body: '<p>A 2% drop in hydration can reduce muscular power output by up to 15%.</p>' +
                      '<ul>' +
                      '<li><strong>Pre-Workout:</strong> Consume 400-500ml of water 60-90 minutes before your workout.</li>' +
                      '<li><strong>During Training:</strong> Sip 150-200ml every 15-20 minutes, especially during heavy lifts or HIIT.</li>' +
                      '<li><strong>Electrolytes:</strong> Add a pinch of sea salt or an electrolyte blend on intense training days to maintain sodium-potassium balance.</li>' +
                      '</ul>'
            },
            sleep: {
                icon: 'fa-solid fa-bed',
                title: 'Recovery & Circadian Deep Sleep',
                body: '<p>Muscle protein synthesis and central nervous system replenishment peak during stage 3 and REM sleep.</p>' +
                      '<ul>' +
                      '<li><strong>Duration:</strong> Prioritize 7 to 9 hours of uninterrupted sleep every single night.</li>' +
                      '<li><strong>Environment:</strong> Keep the bedroom dark, quiet, and at a cool temperature (~18-20°C).</li>' +
                      '<li><strong>Blue Light:</strong> Disconnect from digital screens at least 45 minutes before sleep to stimulate natural melatonin production.</li>' +
                      '</ul>'
            },
            progress: {
                icon: 'fa-solid fa-chart-line',
                title: 'Tracking Your Progressive Overload',
                body: '<p>Without systematic measurement, strength adaptations plateau quickly.</p>' +
                      '<ul>' +
                      '<li><strong>Log Every Set:</strong> Record your weight, reps, and perceived exertion (RPE) in a training log.</li>' +
                      '<li><strong>Overload Variables:</strong> Increase weight, increase total repetitions, or decrease rest intervals incrementally.</li>' +
                      '<li><strong>Body Measurements:</strong> Combine gym logs with monthly circumference measurements and progress photos.</li>' +
                      '</ul>'
            },
            warmup: {
                icon: 'fa-solid fa-person-running',
                title: 'Dynamic Warm-Up & Joint Priming',
                body: '<p>Static stretching before lifting can impair power output. Use dynamic mobility instead.</p>' +
                      '<ul>' +
                      '<li><strong>General Warm-Up:</strong> 3-5 minutes of light rowing or incline walking to elevate core temperature.</li>' +
                      '<li><strong>Joint Mobilization:</strong> Arm circles, hip openers, band pull-aparts, and world\'s greatest stretch.</li>' +
                      '<li><strong>Ramp-Up Sets:</strong> Perform 2-3 progressive warmup sets before touching your working load.</li>' +
                      '</ul>'
            }
        };

        function openWodModal() {
            document.getElementById('wodModal').classList.add('show');
        }

        function openTipModal(tipKey) {
            var data = tipsData[tipKey];
            if (!data) return;

            document.getElementById('tipModalIcon').innerHTML = '<i class="' + data.icon + '"></i>';
            document.getElementById('tipModalTitle').innerText = data.title;
            document.getElementById('tipModalBody').innerHTML = data.body;
            document.getElementById('tipModal').classList.add('show');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
        }

        function closeModalOnBackdrop(e, modalId) {
            if (e.target.id === modalId) {
                closeModal(modalId);
            }
        }
    </script>

</asp:Content>
