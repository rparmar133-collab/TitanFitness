<%@ Page Title="About Us | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Titan_Fitness.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Scoped About Page Styling */
        .about-hero-section {
            position: relative;
            min-height: 55vh;
            display: flex;
            align-items: center;
            background: linear-gradient(180deg, rgba(11, 15, 25, 0.85) 0%, rgba(11, 15, 25, 0.98) 100%), 
                        url('https://images.unsplash.com/photo-1540497077202-7c8a3999166f?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat;
            padding: 150px 0 70px 0;
            text-align: center;
        }
        .about-hero-inner {
            max-width: 800px;
            margin: 0 auto;
        }
        .about-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.35);
            color: var(--accent);
            padding: 8px 22px;
            border-radius: var(--radius-full);
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        .about-hero-title {
            font-size: clamp(2.4rem, 4.5vw, 3.8rem);
            font-weight: 900;
            color: #FFFFFF;
            text-transform: uppercase;
            margin-bottom: 16px;
            letter-spacing: -0.5px;
        }
        .about-hero-subtitle {
            font-size: clamp(1.1rem, 2vw, 1.3rem);
            color: var(--text-muted);
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Generic Section Wrappers */
        .about-page-section {
            padding: 85px 0;
            position: relative;
        }
        .about-header-block {
            text-align: center;
            max-width: 720px;
            margin: 0 auto 50px auto;
        }
        .about-tag-pill {
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
        .about-header-block h2 {
            font-size: clamp(2rem, 3.2vw, 2.6rem);
            font-weight: 800;
            color: #FFFFFF;
            margin-bottom: 14px;
            text-transform: uppercase;
        }
        .about-header-block p {
            color: var(--text-muted);
            font-size: 1.05rem;
            line-height: 1.6;
        }

        /* Section 2: Our Story */
        .story-grid {
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            gap: 50px;
            align-items: center;
        }
        @media (max-width: 991px) {
            .story-grid {
                grid-template-columns: 1fr;
            }
        }
        .story-text-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.7) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 40px;
            box-shadow: var(--shadow-md);
        }
        .story-text-card h3 {
            color: #FFFFFF;
            font-size: 1.8rem;
            font-weight: 800;
            margin-bottom: 20px;
        }
        .story-text-card p {
            color: var(--text-muted);
            font-size: 1.02rem;
            line-height: 1.8;
            margin-bottom: 18px;
        }
        .story-highlight-box {
            background: rgba(30, 102, 245, 0.1);
            border-left: 4px solid var(--accent);
            padding: 16px 20px;
            border-radius: 0 8px 8px 0;
            color: #FFFFFF;
            font-weight: 500;
            margin-top: 25px;
        }
        .story-img-frame {
            position: relative;
            border-radius: var(--radius-lg);
            overflow: hidden;
            border: 1px solid var(--border-glow);
            box-shadow: var(--shadow-md);
            height: 100%;
            min-height: 380px;
        }
        .story-img-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s ease;
        }
        .story-img-frame:hover img {
            transform: scale(1.03);
        }

        /* Section 3: Mission & Vision */
        .mv-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        @media (max-width: 768px) {
            .mv-grid {
                grid-template-columns: 1fr;
            }
        }
        .mv-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.8) 0%, rgba(19, 27, 46, 0.98) 100%);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 40px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .mv-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 35px rgba(30, 102, 245, 0.25);
            border-color: var(--accent);
        }
        .mv-icon {
            width: 65px;
            height: 65px;
            border-radius: 16px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.3);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 22px;
        }
        .mv-title {
            color: #FFFFFF;
            font-size: 1.6rem;
            font-weight: 800;
            margin-bottom: 16px;
        }
        .mv-desc {
            color: var(--text-muted);
            font-size: 1.05rem;
            line-height: 1.7;
            margin: 0;
        }

        /* Section 4: Why Choose TitanFitness */
        .why-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }
        .why-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.7) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 35px 26px;
            transition: all 0.35s ease;
            position: relative;
        }
        .why-card:hover {
            transform: translateY(-8px);
            border-color: var(--primary);
            box-shadow: 0 15px 35px rgba(30, 102, 245, 0.25);
        }
        .why-icon {
            width: 58px;
            height: 58px;
            border-radius: 14px;
            background: rgba(30, 102, 245, 0.15);
            border: 1px solid rgba(0, 210, 255, 0.25);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            margin-bottom: 20px;
        }
        .why-title {
            color: #FFFFFF;
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 12px;
        }
        .why-desc {
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.65;
            margin: 0;
        }

        /* Section 5: Our Facilities */
        .facilities-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }
        .facility-card {
            background: var(--bg-card);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            overflow: hidden;
            transition: all 0.35s ease;
        }
        .facility-card:hover {
            transform: translateY(-6px);
            border-color: rgba(0, 210, 255, 0.4);
            box-shadow: var(--shadow-md);
        }
        .facility-img-wrap {
            height: 220px;
            position: relative;
            overflow: hidden;
        }
        .facility-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        .facility-card:hover .facility-img-wrap img {
            transform: scale(1.06);
        }
        .facility-body {
            padding: 24px;
        }
        .facility-name {
            color: #FFFFFF;
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .facility-name i {
            color: var(--accent);
            font-size: 1.1rem;
        }
        .facility-desc {
            color: var(--text-muted);
            font-size: 0.92rem;
            line-height: 1.6;
            margin: 0;
        }

        /* Section 6: Our Achievements */
        .achieve-strip {
            background: linear-gradient(135deg, rgba(30, 102, 245, 0.15) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 50px 30px;
            box-shadow: var(--shadow-md);
        }
        .achieve-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            text-align: center;
        }
        .achieve-num {
            font-size: 2.8rem;
            font-weight: 900;
            color: #FFFFFF;
            font-family: var(--font-heading);
            margin-bottom: 6px;
            background: linear-gradient(135deg, #FFFFFF 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .achieve-lbl {
            color: var(--text-muted);
            font-size: 0.98rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin: 0;
        }

        /* Section 7: Our Values */
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }
        .value-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.7) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 32px 24px;
            text-align: center;
            transition: all 0.3s ease;
        }
        .value-card:hover {
            transform: translateY(-6px);
            border-color: var(--accent);
            box-shadow: 0 12px 30px rgba(0, 210, 255, 0.2);
        }
        .value-badge {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: rgba(30, 102, 245, 0.15);
            border: 2px solid rgba(0, 210, 255, 0.3);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            margin: 0 auto 20px auto;
        }
        .value-title {
            color: #FFFFFF;
            font-size: 1.35rem;
            font-weight: 800;
            margin-bottom: 12px;
            letter-spacing: 0.5px;
        }
        .value-desc {
            color: var(--text-muted);
            font-size: 0.93rem;
            line-height: 1.6;
            margin: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ================= SECTION 1: ABOUT HERO ================= -->
    <section class="about-hero-section">
        <div class="container">
            <div class="about-hero-inner">
                <span class="about-badge">
                    <i class="fa-solid fa-dumbbell"></i> Who We Are
                </span>
                <h1 class="about-hero-title">
                    ABOUT <span class="gradient-text">TITANFITNESS</span>
                </h1>
                <p class="about-hero-subtitle">
                    Your Fitness Journey Starts Here. We are committed to fostering sustainable physical transformation, mental resilience, and peak athleticism.
                </p>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 2: OUR STORY ================= -->
    <section class="about-page-section" style="background: var(--bg-dark);">
        <div class="container">
            <div class="story-grid">
                <div class="story-text-card">
                    <span class="about-tag-pill"><i class="fa-solid fa-book-open"></i> The Titan Philosophy</span>
                    <h3>Empowering Every Athlete & Everyday Achiever</h3>
                    <p>
                        At TitanFitness, our mission began with a straightforward conviction: true fitness is not a temporary routine, but a lifelong habit built upon consistency, science-based guidance, and an encouraging community.
                    </p>
                    <p>
                        We built TitanFitness to bridge the gap between casual fitness centers and elite athletic training facilities. Whether you are stepping onto a workout floor for the very first time or training for a personal deadlift record, our environment is engineered to keep you accountable, focused, and motivated every step of the way.
                    </p>
                    <div class="story-highlight-box">
                        <i class="fa-solid fa-quote-left me-2 text-primary"></i> Consistent training combined with professional guidance creates extraordinary, lasting results.
                    </div>
                </div>

                <div class="story-img-frame">
                    <img src="https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=1000&q=80" alt="Titan Fitness Atmosphere" />
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 3: OUR MISSION & VISION ================= -->
    <section class="about-page-section" style="background: radial-gradient(circle at top left, rgba(30, 102, 245, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="about-header-block">
                <span class="about-tag-pill"><i class="fa-solid fa-compass"></i> Guiding Principles</span>
                <h2>OUR MISSION & <span class="gradient-text">VISION</span></h2>
                <p>The core values that direct our coaching philosophy, equipment curation, and facility standards.</p>
            </div>

            <div class="mv-grid">
                <!-- Our Mission -->
                <div class="mv-card">
                    <div class="mv-icon">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>
                    <h3 class="mv-title">Our Mission</h3>
                    <p class="mv-desc">
                        To provide a supportive fitness environment where members can work toward their fitness goals with proper guidance, safe technique, and structured progression.
                    </p>
                </div>

                <!-- Our Vision -->
                <div class="mv-card">
                    <div class="mv-icon">
                        <i class="fa-solid fa-eye"></i>
                    </div>
                    <h3 class="mv-title">Our Vision</h3>
                    <p class="mv-desc">
                        To encourage a healthier and more active community through consistency, discipline, and sustainable fitness habits that elevate daily quality of life.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 4: WHY CHOOSE TITANFITNESS? ================= -->
    <section class="about-page-section" style="background: var(--bg-dark);">
        <div class="container">
            <div class="about-header-block">
                <span class="about-tag-pill"><i class="fa-solid fa-shield-halved"></i> The Titan Advantage</span>
                <h2>WHY CHOOSE <span class="gradient-text">TITANFITNESS?</span></h2>
                <p>Designed from the ground up to give every member the ultimate training experience.</p>
            </div>

            <div class="why-grid">
                <!-- Feature 1 -->
                <div class="why-card">
                    <div class="why-icon">
                        <i class="fa-solid fa-dumbbell"></i>
                    </div>
                    <h4 class="why-title">Modern Equipment</h4>
                    <p class="why-desc">
                        Biomechanically precise selectorized machines, Olympic lifting racks, and premium calibrated free weights for safe, effective training.
                    </p>
                </div>

                <!-- Feature 2 -->
                <div class="why-card">
                    <div class="why-icon">
                        <i class="fa-solid fa-user-tie"></i>
                    </div>
                    <h4 class="why-title">Professional Guidance</h4>
                    <p class="why-desc">
                        Accredited fitness coaches providing real-time form correction, workout programming, and structured progression routines.
                    </p>
                </div>

                <!-- Feature 3 -->
                <div class="why-card">
                    <div class="why-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>
                    <h4 class="why-title">Personalized Training</h4>
                    <p class="why-desc">
                        Workout structures designed specifically around your fitness level, body composition, schedule, and targeted athletic goals.
                    </p>
                </div>

                <!-- Feature 4 -->
                <div class="why-card">
                    <div class="why-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <h4 class="why-title">Supportive Environment</h4>
                    <p class="why-desc">
                        A welcoming, zero-intimidation community of like-minded athletes and fitness enthusiasts inspiring each other daily.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 5: OUR FACILITIES ================= -->
    <section class="about-page-section" style="background: radial-gradient(circle at top right, rgba(0, 210, 255, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="about-header-block">
                <span class="about-tag-pill"><i class="fa-solid fa-building-circle-check"></i> Gym Infrastructure</span>
                <h2>OUR WORLD-CLASS <span class="gradient-text">FACILITIES</span></h2>
                <p>Explore the dedicated training zones crafted for strength, cardio, agility, and recovery.</p>
            </div>

            <div class="facilities-grid">
                <!-- Facility 1: Strength Area -->
                <div class="facility-card">
                    <div class="facility-img-wrap">
                        <img src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=700&q=80" alt="Strength Training Area" />
                    </div>
                    <div class="facility-body">
                        <h4 class="facility-name"><i class="fa-solid fa-weight-hanging"></i> Strength Training Area</h4>
                        <p class="facility-desc">Olympic lifting platforms, competition power cages, heavy dumbbells up to 50kg, and cable systems for progressive resistance.</p>
                    </div>
                </div>

                <!-- Facility 2: Cardio Equipment -->
                <div class="facility-card">
                    <div class="facility-img-wrap">
                        <img src="https://images.unsplash.com/photo-1574680096145-d05b474e2155?auto=format&fit=crop&w=700&q=80" alt="Cardio Equipment" />
                    </div>
                    <div class="facility-body">
                        <h4 class="facility-name"><i class="fa-solid fa-heart-pulse"></i> Cardio Equipment</h4>
                        <p class="facility-desc">Interactive treadmills, rowing machines, air assault bikes, and stair climbers with live heart rate monitoring integration.</p>
                    </div>
                </div>

                <!-- Facility 3: Personal Training Area -->
                <div class="facility-card">
                    <div class="facility-img-wrap">
                        <img src="https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=700&q=80" alt="Personal Training Area" />
                    </div>
                    <div class="facility-body">
                        <h4 class="facility-name"><i class="fa-solid fa-user-ninja"></i> Personal Training Area</h4>
                        <p class="facility-desc">Private turf area equipped with functional rigs, kettlebells, plyometric boxes, and sled push tracks for 1-on-1 sessions.</p>
                    </div>
                </div>

                <!-- Facility 4: Stretching and Mobility Area -->
                <div class="facility-card">
                    <div class="facility-img-wrap">
                        <img src="https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=700&q=80" alt="Stretching and Mobility Area" />
                    </div>
                    <div class="facility-body">
                        <h4 class="facility-name"><i class="fa-solid fa-person-stretching"></i> Stretching & Mobility Area</h4>
                        <p class="facility-desc">Cushioned floor mats, foam rollers, resistance loops, and mobility tools for thorough pre-workout warm-ups and post-lift cooldowns.</p>
                    </div>
                </div>

                <!-- Facility 5: Locker Facilities -->
                <div class="facility-card">
                    <div class="facility-img-wrap">
                        <img src="https://images.unsplash.com/photo-1558611848-73f7eb4001a1?auto=format&fit=crop&w=700&q=80" alt="Locker Facilities" />
                    </div>
                    <div class="facility-body">
                        <h4 class="facility-name"><i class="fa-solid fa-lock"></i> Locker Facilities</h4>
                        <p class="facility-desc">Clean, secure electronic lockers, spacious private showers, vanity grooming mirrors, and dressing suites for hassle-free training.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 6: OUR ACHIEVEMENTS ================= -->
    <section class="about-page-section" style="background: var(--bg-dark);">
        <div class="container">
            <div class="achieve-strip">
                <div class="achieve-grid">
                    <div>
                        <div class="achieve-num">1,500+</div>
                        <p class="achieve-lbl">Active Members</p>
                    </div>
                    <div>
                        <div class="achieve-num">25+</div>
                        <p class="achieve-lbl">Certified Trainers</p>
                    </div>
                    <div>
                        <div class="achieve-num">98%</div>
                        <p class="achieve-lbl">Member Satisfaction</p>
                    </div>
                    <div>
                        <div class="achieve-num">100+</div>
                        <p class="achieve-lbl">Training Stations</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 7: OUR VALUES ================= -->
    <section class="about-page-section" style="background: radial-gradient(circle at bottom center, rgba(30, 102, 245, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="about-header-block">
                <span class="about-tag-pill"><i class="fa-solid fa-gem"></i> Core Pillars</span>
                <h2>OUR CORE <span class="gradient-text">VALUES</span></h2>
                <p>The shared principles that shape our gym culture, member relationships, and daily work ethic.</p>
            </div>

            <div class="values-grid">
                <!-- Value 1: Discipline -->
                <div class="value-card">
                    <div class="value-badge">
                        <i class="fa-solid fa-trophy"></i>
                    </div>
                    <h4 class="value-title">Discipline</h4>
                    <p class="value-desc">
                        Showing up and honoring your commitment to physical and mental growth, even on days when motivation is low.
                    </p>
                </div>

                <!-- Value 2: Consistency -->
                <div class="value-card">
                    <div class="value-badge">
                        <i class="fa-solid fa-repeat"></i>
                    </div>
                    <h4 class="value-title">Consistency</h4>
                    <p class="value-desc">
                        Small, deliberate daily efforts compounded over weeks and months produce extraordinary, sustainable transformations.
                    </p>
                </div>

                <!-- Value 3: Dedication -->
                <div class="value-card">
                    <div class="value-badge">
                        <i class="fa-solid fa-fire"></i>
                    </div>
                    <h4 class="value-title">Dedication</h4>
                    <p class="value-desc">
                        Approaching every lift, recovery window, and health choice with purposeful intention and an unyielding drive.
                    </p>
                </div>

                <!-- Value 4: Community -->
                <div class="value-card">
                    <div class="value-badge">
                        <i class="fa-solid fa-handshake"></i>
                    </div>
                    <h4 class="value-title">Community</h4>
                    <p class="value-desc">
                        Cultivating an inclusive, respectful space where members uplift, celebrate, and encourage one another every day.
                    </p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
