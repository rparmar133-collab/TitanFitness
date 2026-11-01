<%@ Page Title="Gallery | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Titan_Fitness.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="gallery" class="page-section gallery-section" style="padding-top: 130px; padding-bottom: 80px;">
        <div class="container">
            <div class="section-header text-center">
                <span class="section-tag">ATMOSPHERE & FACILITIES</span>
                <h2 class="section-title">EXPLORE OUR <span class="gradient-text">GALLERY</span></h2>
                <p class="section-desc">Take a look inside our world-class gym facilities, specialized training zones, and high-performance fitness community.</p>
            </div>

            <div class="gallery-grid" id="galleryGrid">
                <!-- Photo 1 -->
                <div class="gallery-item" data-category="equipment">
                    <img src="images/hero.jpg" alt="Gym Equipment Area">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Main Workout Floor</h4>
                            <p>Heavy dumbbells & free weights</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 2 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=800&q=80" alt="Personal Training Session">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Personal Coaching</h4>
                            <p>1-on-1 Form & Technique Focus</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 3 -->
                <div class="gallery-item" data-category="classes">
                    <img src="https://images.unsplash.com/photo-1538805060514-97d9cc17730c?auto=format&fit=crop&w=800&q=80" alt="Cardio & Sprint Training">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Spin & Sprint Deck</h4>
                            <p>High-tempo cardio & endurance sessions</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 4 -->
                <div class="gallery-item" data-category="equipment">
                    <img src="https://images.unsplash.com/photo-1540497077202-7c8a3999166f?auto=format&fit=crop&w=800&q=80" alt="Cardio Deck">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Cardio Deck</h4>
                            <p>Interactive treadmills and stairmasters</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 5 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80" alt="Powerlifting Platform">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Power Racks & Platforms</h4>
                            <p>Calibrated Eleiko competition plates</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 6 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1507398941214-572c25f4b1dc?auto=format&fit=crop&w=800&q=80" alt="Mobility & Recovery">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Mobility & Recovery Zone</h4>
                            <p>Deep tissue stretching & joint care</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 7 -->
                <div class="gallery-item" data-category="equipment">
                    <img src="https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=800&q=80" alt="Olympic Free Weights Zone">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Olympic Free Weights Zone</h4>
                            <p>Full range cast iron dumbbells up to 60kg</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 8 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1517963879433-6ad2b056d712?auto=format&fit=crop&w=800&q=80" alt="Functional Turf & Sled Track">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Functional Turf & Sled Track</h4>
                            <p>Battle ropes, sled pushes & plyometrics</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 9 -->
                <div class="gallery-item" data-category="classes">
                    <img src="https://images.unsplash.com/photo-1549060279-7e168fcee0c2?auto=format&fit=crop&w=800&q=80" alt="Boxing & Combat Ring">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Boxing & Combat Ring</h4>
                            <p>Heavy bags and sparring conditioning</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 10 -->
                <div class="gallery-item" data-category="facilities">
                    <img src="https://images.unsplash.com/photo-1574680096145-d05b474e2155?auto=format&fit=crop&w=800&q=80" alt="Infrared Sauna & Recovery Spa">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Infrared Sauna & Recovery Spa</h4>
                            <p>Post-workout thermal contrast therapy</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 11 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=800&q=80" alt="Kettlebell Conditioning Hub">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Kettlebell Conditioning Hub</h4>
                            <p>Dynamic circuit training & explosive power</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 12 -->
                <div class="gallery-item" data-category="equipment">
                    <img src="https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?auto=format&fit=crop&w=800&q=80" alt="Barbell & Competition Drop Pods">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Barbell & Drop Pods</h4>
                            <p>Calibrated steel plates and deadlift jacks</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 13 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1574680178050-55c6a6a96e0a?auto=format&fit=crop&w=800&q=80" alt="Heavy Barbell Squats">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Squat & Core Strength Zone</h4>
                            <p>Heavy barbell power and leg hypertrophy</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 14 -->
                <div class="gallery-item" data-category="training">
                    <img src="https://images.unsplash.com/photo-1521804906057-1df8fdb718b7?auto=format&fit=crop&w=800&q=80" alt="Calisthenics & Suspension Rig">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Calisthenics & Rig Area</h4>
                            <p>Gymnastic rings, pull-up matrix & parallel bars</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 15 -->
                <div class="gallery-item" data-category="facilities">
                    <img src="https://images.unsplash.com/photo-1584865288642-42078afe6942?auto=format&fit=crop&w=800&q=80" alt="Executive Locker Suite">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Executive Locker Suite</h4>
                            <p>Electronic RFID lockers & rain showers</p>
                        </div>
                    </div>
                </div>

                <!-- Photo 16 -->
                <div class="gallery-item" data-category="equipment">
                    <img src="https://images.unsplash.com/photo-1571902943202-507ec2618e8f?auto=format&fit=crop&w=800&q=80" alt="Sprint & Conditioning Turf">
                    <div class="gallery-overlay">
                        <div class="gallery-info">
                            <h4>Sprint & Conditioning Turf</h4>
                            <p>50-meter indoor sprint lanes & interval timers</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
