<%@ Page Title="Services | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Titan_Fitness.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Scoped Services Page Styling */
        .services-hero-section {
            position: relative;
            min-height: 55vh;
            display: flex;
            align-items: center;
            background: linear-gradient(180deg, rgba(11, 15, 25, 0.85) 0%, rgba(11, 15, 25, 0.98) 100%), 
                        url('https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat;
            padding: 150px 0 70px 0;
            text-align: center;
        }
        .services-hero-inner {
            max-width: 820px;
            margin: 0 auto;
        }
        .services-badge {
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
        .services-hero-title {
            font-size: clamp(2.4rem, 4.5vw, 3.8rem);
            font-weight: 900;
            color: #FFFFFF;
            text-transform: uppercase;
            margin-bottom: 16px;
            letter-spacing: -0.5px;
        }
        .services-hero-subtitle {
            font-size: clamp(1.1rem, 2vw, 1.3rem);
            color: var(--text-muted);
            margin: 0 auto 30px auto;
            line-height: 1.6;
            max-width: 650px;
        }

        /* Generic Section Wrappers */
        .services-page-section {
            padding: 85px 0;
            position: relative;
        }
        .services-header-block {
            text-align: center;
            max-width: 720px;
            margin: 0 auto 55px auto;
        }
        .services-tag-pill {
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
        .services-header-block h2 {
            font-size: clamp(2rem, 3.2vw, 2.6rem);
            font-weight: 800;
            color: #FFFFFF;
            margin-bottom: 14px;
            text-transform: uppercase;
        }
        .services-header-block p {
            color: var(--text-muted);
            font-size: 1.05rem;
            line-height: 1.6;
        }

        /* Services Grid Layout */
        .svc-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }
        @media (max-width: 768px) {
            .svc-grid {
                grid-template-columns: 1fr;
            }
        }
        .svc-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.75) 0%, rgba(19, 27, 46, 0.98) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.35s ease;
            box-shadow: var(--shadow-sm);
        }
        .svc-card:hover {
            transform: translateY(-8px);
            border-color: rgba(0, 210, 255, 0.45);
            box-shadow: 0 15px 35px rgba(30, 102, 245, 0.25);
        }
        .svc-img-holder {
            height: 220px;
            position: relative;
            overflow: hidden;
        }
        .svc-img-holder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        .svc-card:hover .svc-img-holder img {
            transform: scale(1.06);
        }
        .svc-badge-icon {
            position: absolute;
            top: 16px;
            right: 16px;
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: rgba(11, 15, 25, 0.85);
            border: 1px solid rgba(0, 210, 255, 0.4);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            backdrop-filter: blur(4px);
        }
        .svc-body {
            padding: 30px 26px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .svc-title {
            color: #FFFFFF;
            font-size: 1.4rem;
            font-weight: 800;
            margin-bottom: 12px;
        }
        .svc-text {
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.65;
            margin-bottom: 22px;
        }
        .svc-btn-row {
            margin-top: auto;
        }

        /* How It Works (3-Step Process) */
        .steps-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            position: relative;
            margin-top: 20px;
        }
        @media (max-width: 991px) {
            .steps-container {
                grid-template-columns: 1fr;
            }
        }
        .step-card {
            background: linear-gradient(135deg, rgba(26, 35, 58, 0.7) 0%, rgba(19, 27, 46, 0.95) 100%);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 38px 28px;
            position: relative;
            text-align: center;
            transition: all 0.3s ease;
        }
        .step-card:hover {
            transform: translateY(-6px);
            border-color: var(--accent);
            box-shadow: 0 12px 30px rgba(0, 210, 255, 0.2);
        }
        .step-number-bubble {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: rgba(30, 102, 245, 0.15);
            border: 2px solid var(--accent);
            color: #FFFFFF;
            font-family: var(--font-heading);
            font-size: 1.6rem;
            font-weight: 900;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
            box-shadow: 0 0 20px rgba(0, 210, 255, 0.2);
        }
        .step-title {
            color: #FFFFFF;
            font-size: 1.3rem;
            font-weight: 800;
            margin-bottom: 12px;
        }
        .step-desc {
            color: var(--text-muted);
            font-size: 0.94rem;
            line-height: 1.65;
            margin: 0;
        }

        /* Section 8: Services Call to Action */
        .services-cta-banner {
            background: radial-gradient(circle at center, rgba(30, 102, 245, 0.2) 0%, rgba(19, 27, 46, 0.98) 100%);
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 60px 40px;
            text-align: center;
            box-shadow: var(--shadow-md);
            max-width: 900px;
            margin: 0 auto;
        }
        .services-cta-banner h2 {
            font-size: clamp(2.2rem, 3.8vw, 3rem);
            font-weight: 900;
            color: #FFFFFF;
            text-transform: uppercase;
            margin-bottom: 16px;
        }
        .services-cta-banner p {
            color: var(--text-muted);
            font-size: 1.15rem;
            line-height: 1.7;
            max-width: 650px;
            margin: 0 auto 35px auto;
        }

        /* Interactive Service Modal */
        .svc-modal-backdrop {
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
        .svc-modal-backdrop.show {
            display: flex;
        }
        .svc-modal-box {
            background: #131B2E;
            border: 1px solid var(--border-glow);
            border-radius: var(--radius-lg);
            padding: 35px;
            max-width: 620px;
            width: 100%;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.7);
            position: relative;
            animation: modalFadeIn 0.3s ease;
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
        .svc-modal-icon-badge {
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
        .svc-modal-title {
            color: #FFFFFF;
            font-size: 1.5rem;
            font-weight: 800;
            margin-bottom: 15px;
        }
        .svc-modal-body {
            color: var(--text-muted);
            font-size: 0.98rem;
            line-height: 1.7;
        }
        .svc-modal-body ul {
            margin-top: 15px;
            padding-left: 20px;
            list-style: disc;
        }
        .svc-modal-body li {
            margin-bottom: 8px;
            color: var(--text-main);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ================= SECTION 1: SERVICES HERO ================= -->
    <section class="services-hero-section">
        <div class="container">
            <div class="services-hero-inner">
                <span class="services-badge">
                    <i class="fa-solid fa-dumbbell"></i> Training Programs
                </span>
                <h1 class="services-hero-title">
                    OUR FITNESS <span class="gradient-text">SERVICES</span>
                </h1>
                <p class="services-hero-subtitle">
                    Training Designed Around Your Goals. From heavy strength development to athletic conditioning and mobility, our specialized training offerings deliver maximum physical progress.
                </p>
                <div>
                    <a href="Plans.aspx" class="btn btn-primary btn-lg">
                        Get Started <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= TRAINING DISCIPLINES GRID (SECTIONS 2 - 6) ================= -->
    <section class="services-page-section" style="background: var(--bg-dark);">
        <div class="container">
            <div class="services-header-block">
                <span class="services-tag-pill"><i class="fa-solid fa-layer-group"></i> Specialized Coaching</span>
                <h2>DISCOVER OUR <span class="gradient-text">TRAINING PILLARS</span></h2>
                <p>Engineered for all fitness backgrounds with top-tier equipment and certified coach oversight.</p>
            </div>

            <div class="svc-grid">
                <!-- Section 2: Strength Training -->
                <div class="svc-card">
                    <div class="svc-img-holder">
                        <img src="https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=700&q=80" alt="Strength Training" />
                        <div class="svc-badge-icon">
                            <i class="fa-solid fa-weight-hanging"></i>
                        </div>
                    </div>
                    <div class="svc-body">
                        <div>
                            <h3 class="svc-title">Strength Training</h3>
                            <p class="svc-text">
                                Build bone density, sculpt lean muscle mass, and develop functional power with structured resistance exercises, barbell compounds, and heavy selectorized machines.
                            </p>
                        </div>
                        <div class="svc-btn-row">
                            <button type="button" class="btn btn-outline btn-full" onclick="openSvcModal('strength');">
                                Learn More <i class="fa-solid fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Section 3: Cardio Training -->
                <div class="svc-card">
                    <div class="svc-img-holder">
                        <img src="https://images.unsplash.com/photo-1538805060514-97d9cc17730c?auto=format&fit=crop&w=700&q=80" alt="Cardio Training" />
                        <div class="svc-badge-icon">
                            <i class="fa-solid fa-heart-pulse"></i>
                        </div>
                    </div>
                    <div class="svc-body">
                        <div>
                            <h3 class="svc-title">Cardio Training</h3>
                            <p class="svc-text">
                                Boost cardiovascular endurance, burn body fat, and accelerate stamina utilizing smart incline treadmills, interactive cycling ergometers, and rowing machines.
                            </p>
                        </div>
                        <div class="svc-btn-row">
                            <button type="button" class="btn btn-outline btn-full" onclick="openSvcModal('cardio');">
                                Learn More <i class="fa-solid fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Section 4: Personal Training -->
                <div class="svc-card">
                    <div class="svc-img-holder">
                        <img src="https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?auto=format&fit=crop&w=700&q=80" alt="Personal Training" />
                        <div class="svc-badge-icon">
                            <i class="fa-solid fa-user-ninja"></i>
                        </div>
                    </div>
                    <div class="svc-body">
                        <div>
                            <h3 class="svc-title">Personal Training</h3>
                            <p class="svc-text">
                                Work directly with a certified personal trainer dedicated exclusively to your biomechanics, goal progression, strict form execution, and ongoing accountability.
                            </p>
                        </div>
                        <div class="svc-btn-row">
                            <a href="Contact.aspx" class="btn btn-primary btn-full">
                                Book a Session <i class="fa-solid fa-calendar-check"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Section 5: Group Workouts -->
                <div class="svc-card">
                    <div class="svc-img-holder">
                        <img src="https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=700&q=80" alt="Group Workouts" />
                        <div class="svc-badge-icon">
                            <i class="fa-solid fa-users"></i>
                        </div>
                    </div>
                    <div class="svc-body">
                        <div>
                            <h3 class="svc-title">Group Workouts</h3>
                            <p class="svc-text">
                                Experience high-energy, instructor-led group sessions that blend teamwork, loud motivation, and structured interval training to push through physical plateaus together.
                            </p>
                        </div>
                        <div class="svc-btn-row">
                            <button type="button" class="btn btn-outline btn-full" onclick="openSvcModal('group');">
                                Learn More <i class="fa-solid fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Section 6: Flexibility & Mobility -->
                <div class="svc-card">
                    <div class="svc-img-holder">
                        <img src="https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=700&q=80" alt="Flexibility & Mobility" />
                        <div class="svc-badge-icon">
                            <i class="fa-solid fa-person-stretching"></i>
                        </div>
                    </div>
                    <div class="svc-body">
                        <div>
                            <h3 class="svc-title">Flexibility & Mobility</h3>
                            <p class="svc-text">
                                Restore functional range of motion, relieve joint tension, and accelerate recovery with targeted dynamic mobility drills, yoga flows, and myofascial foam rolling.
                            </p>
                        </div>
                        <div class="svc-btn-row">
                            <button type="button" class="btn btn-outline btn-full" onclick="openSvcModal('mobility');">
                                Learn More <i class="fa-solid fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 7: HOW IT WORKS ================= -->
    <section class="services-page-section" style="background: radial-gradient(circle at top center, rgba(30, 102, 245, 0.08) 0%, var(--bg-dark) 70%);">
        <div class="container">
            <div class="services-header-block">
                <span class="services-tag-pill"><i class="fa-solid fa-route"></i> Roadmap to Success</span>
                <h2>HOW IT <span class="gradient-text">WORKS</span></h2>
                <p>A simple, structured three-step process to get started and achieve measurable fitness milestones.</p>
            </div>

            <div class="steps-container">
                <!-- Step 1 -->
                <div class="step-card">
                    <div class="step-number-bubble">1</div>
                    <h3 class="step-title">Choose Your Fitness Goal</h3>
                    <p class="step-desc">
                        Identify your key objectives—whether shedding body fat, building muscular strength, improving cardio stamina, or enhancing daily flexibility.
                    </p>
                </div>

                <!-- Step 2 -->
                <div class="step-card">
                    <div class="step-number-bubble">2</div>
                    <h3 class="step-title">Select a Suitable Service</h3>
                    <p class="step-desc">
                        Pick the training modality that best matches your schedule and ambition, from dedicated 1-on-1 personal training to group sessions or open floor lifting.
                    </p>
                </div>

                <!-- Step 3 -->
                <div class="step-card">
                    <div class="step-number-bubble">3</div>
                    <h3 class="step-title">Start Training & Track Progress</h3>
                    <p class="step-desc">
                        Step onto our gym floor, follow your coaching regimen, log your sets, and witness visible adaptations week after week with our support.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SECTION 8: SERVICES CALL TO ACTION ================= -->
    <section class="services-page-section" style="background: var(--bg-dark); padding-bottom: 110px;">
        <div class="container">
            <div class="services-cta-banner">
                <span class="services-tag-pill mb-3"><i class="fa-solid fa-fire"></i> Take Action</span>
                <h2>READY TO START <span class="gradient-text">TRAINING?</span></h2>
                <p>
                    Your journey to a stronger, healthier version of yourself begins with a single session. Explore our flexible membership plans and join the TitanFitness family today.
                </p>
                <a href="Plans.aspx" class="btn btn-primary btn-lg">
                    Explore Membership Plans <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- ================= INTERACTIVE SERVICE MODAL ================= -->
    <div id="svcModal" class="svc-modal-backdrop" onclick="closeSvcModalOnBackdrop(event)">
        <div class="svc-modal-box">
            <button type="button" class="modal-close-btn" onclick="closeSvcModal()"><i class="fa-solid fa-xmark"></i></button>
            <div id="svcModalIcon" class="svc-modal-icon-badge">
                <i class="fa-solid fa-dumbbell"></i>
            </div>
            <h3 id="svcModalTitle" class="svc-modal-title">Service Details</h3>
            <div id="svcModalBody" class="svc-modal-body">
                <!-- Dynamically injected via JS -->
            </div>
        </div>
    </div>

    <!-- Client-Side Scripts for Interactive Details -->
    <script type="text/javascript">
        var serviceDetails = {
            strength: {
                icon: 'fa-solid fa-weight-hanging',
                title: 'Strength & Resistance Training',
                body: '<p>Our strength training zone is engineered around biomechanically superior lifting standards.</p>' +
                      '<ul>' +
                      '<li><strong>Equipment:</strong> Competition power cages, Olympic deadlift platforms with Eleiko bumper plates, and selectorized isolation machines.</li>' +
                      '<li><strong>Progression:</strong> Systematic progressive overload guidance to build lean muscle mass and bone mineral density safely.</li>' +
                      '<li><strong>Best For:</strong> Individuals looking to gain functional power, sculpt muscle definition, and enhance metabolism.</li>' +
                      '</ul>'
            },
            cardio: {
                icon: 'fa-solid fa-heart-pulse',
                title: 'Cardiovascular Conditioning',
                body: '<p>A modern cardio deck designed for aerobic stamina and metabolic conditioning.</p>' +
                      '<ul>' +
                      '<li><strong>Equipment:</strong> Curved non-motorized treadmills, Concept2 rowing ergometers, air assault bikes, and stairmasters.</li>' +
                      '<li><strong>Tracking:</strong> Real-time wireless heart rate telemetry and target heart-rate zone training protocols.</li>' +
                      '<li><strong>Best For:</strong> Fat loss, cardiovascular longevity, and high-stamina athletic performance.</li>' +
                      '</ul>'
            },
            group: {
                icon: 'fa-solid fa-users',
                title: 'High-Energy Group Workouts',
                body: '<p>Combine the energy of a motivating community with the structure of professional coaching.</p>' +
                      '<ul>' +
                      '<li><strong>Formats:</strong> HIIT circuits, kettlebell bootcamps, functional agility drills, and strength endurance classes.</li>' +
                      '<li><strong>Camaraderie:</strong> Team-based challenges that keep you accountable and eliminate workout boredom.</li>' +
                      '<li><strong>Best For:</strong> Anyone who thrives on group motivation, energetic music, and calorie-torching sweat sessions.</li>' +
                      '</ul>'
            },
            mobility: {
                icon: 'fa-solid fa-person-stretching',
                title: 'Flexibility, Mobility & Joint Health',
                body: '<p>Injury prevention and functional movement restoration for long-term athletic health.</p>' +
                      '<ul>' +
                      '<li><strong>Modalities:</strong> Guided active stretching, joint decompression, band distraction techniques, and myofascial rolling.</li>' +
                      '<li><strong>Recovery:</strong> Alleviate postural tightness caused by desk work and accelerate post-lift muscular recovery.</li>' +
                      '<li><strong>Best For:</strong> Improving lifting depth, preventing sports injuries, and enhancing overall movement ease.</li>' +
                      '</ul>'
            }
        };

        function openSvcModal(key) {
            var data = serviceDetails[key];
            if (!data) return;

            document.getElementById('svcModalIcon').innerHTML = '<i class="' + data.icon + '"></i>';
            document.getElementById('svcModalTitle').innerText = data.title;
            document.getElementById('svcModalBody').innerHTML = data.body;
            document.getElementById('svcModal').classList.add('show');
        }

        function closeSvcModal() {
            document.getElementById('svcModal').classList.remove('show');
        }

        function closeSvcModalOnBackdrop(e) {
            if (e.target.id === 'svcModal') {
                closeSvcModal();
            }
        }
    </script>

</asp:Content>
