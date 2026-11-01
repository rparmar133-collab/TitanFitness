<%@ Page Title="Trainers | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Trainers.aspx.cs" Inherits="Titan_Fitness.Trainers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="trainers" class="page-section trainers-section" style="padding-top: 130px; padding-bottom: 80px;">
        <div class="container">
            <div class="section-header text-center">
                <span class="section-tag">EXPERT COACHES</span>
                <h2 class="section-title">MEET OUR <span class="gradient-text">MASTER TRAINERS</span></h2>
                <p class="section-desc">Certified industry professionals dedicated to guiding your physique, athletic performance, and strength transformation.</p>
            </div>

            <div class="trainers-grid">
                <!-- Trainer 1 -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="images/trainer1.jpg" alt="Alex Vance" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                                <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Head Bodybuilding Coach</span>
                        <h3 class="trainer-name">Alex Vance</h3>
                        <p class="trainer-bio">12+ years experience preparing natural bodybuilders & strength athletes for national competition.</p>
                    </div>
                </div>

                <!-- Trainer 2 (MALE) -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=600&q=80" alt="Leo Sterling" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                                <a href="#" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">HIIT & CrossFit Lead</span>
                        <h3 class="trainer-name">Leo Sterling</h3>
                        <p class="trainer-bio">Former collegiate athlete specializing in high-intensity functional conditioning, stamina, and explosive power.</p>
                    </div>
                </div>

                <!-- Trainer 3 -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1567013127542-490d757e51fc?auto=format&fit=crop&w=600&q=80" alt="Marcus Chen" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Powerlifting & Strength</span>
                        <h3 class="trainer-name">Marcus Chen</h3>
                        <p class="trainer-bio">CSCS certified coach focused on deadlift techniques, squat mechanics, and maximal power output.</p>
                    </div>
                </div>

                <!-- Trainer 4 (MALE) -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1507398941214-572c25f4b1dc?auto=format&fit=crop&w=600&q=80" alt="Vikram Malhotra" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Calisthenics & Mobility</span>
                        <h3 class="trainer-name">Vikram Malhotra</h3>
                        <p class="trainer-bio">Mastering bodyweight strength, postural alignment, and deep fascial mobility for optimal joint performance.</p>
                    </div>
                </div>

                <!-- Trainer 5 -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?auto=format&fit=crop&w=600&q=80" alt="David Miller" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                                <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Olympic Weightlifting Coach</span>
                        <h3 class="trainer-name">David Miller</h3>
                        <p class="trainer-bio">Senior lifting coach specializing in snatch and clean & jerk mechanics, bar speed, and kinetic chain execution.</p>
                    </div>
                </div>

                <!-- Trainer 6 (MALE) -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1549476464-37392f717541?auto=format&fit=crop&w=600&q=80" alt="Ethan Cole" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Nutrition & Body Recomposition</span>
                        <h3 class="trainer-name">Ethan Cole</h3>
                        <p class="trainer-bio">Sports nutritionist helping athletes burn stubborn body fat and build dense muscular hypertrophy.</p>
                    </div>
                </div>

                <!-- Trainer 7 -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?auto=format&fit=crop&w=600&q=80" alt="Ryan Reynolds" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Boxing & Combat Conditioning</span>
                        <h3 class="trainer-name">Ryan Reynolds</h3>
                        <p class="trainer-bio">Golden Gloves competitor coaching footwork, punching power, head movement, and elite cardiovascular resilience.</p>
                    </div>
                </div>

                <!-- Trainer 8 (MALE) -->
                <div class="trainer-card">
                    <div class="trainer-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=600&q=80" alt="Brandon Taylor" class="trainer-img">
                        <div class="trainer-overlay">
                            <div class="trainer-socials">
                                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="trainer-info">
                        <span class="trainer-specialty">Athletic Conditioning & Rehab</span>
                        <h3 class="trainer-name">Brandon Taylor</h3>
                        <p class="trainer-bio">Strength and conditioning specialist focused on structural balance, rotator cuff recovery, and athletic durability.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
