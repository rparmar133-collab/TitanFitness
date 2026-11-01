<%@ Page Title="Contact Us | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="Titan_Fitness.Contact" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section id="contact" class="page-section contact-section" style="padding-top: 130px;">
            <div class="container">
                <div class="section-header text-center">
                    <span class="section-tag">GET IN TOUCH</span>
                    <h2 class="section-title">CONTACT <span class="gradient-text">TITAN FITNESS</span></h2>
                    <p class="section-desc">Have questions about memberships, personal training, or scheduling a visit?
                        Send us a message!</p>
                </div>

                <div class="contact-grid">
                    <div class="contact-info">
                        <h3 class="contact-title">Visit Our Facility</h3>
                        <p class="contact-text">Drop by for a free day pass and tour our state-of-the-art training
                            center.</p>

                        <div class="info-items">
                            <div class="info-item">
                                <div class="info-icon"><i class="fa-solid fa-location-dot"></i></div>
                                <div>
                                    <h4>Location</h4>
                                    <p>742 Olympic Boulevard, Metro Fitness District, NY 10001</p>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fa-solid fa-phone"></i></div>
                                <div>
                                    <h4>Phone Support</h4>
                                    <p>+1 (555) 848-2669 / +1 (555) TITAN-FIT</p>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fa-solid fa-envelope"></i></div>
                                <div>
                                    <h4>Email Address</h4>
                                    <p>support@titanfitness.com / info@titanfitness.com</p>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fa-solid fa-clock"></i></div>
                                <div>
                                    <h4>Operating Hours</h4>
                                    <p><strong>Mon - Fri:</strong> 5:00 AM - 11:00 PM</p>
                                    <p><strong>Sat - Sun:</strong> 6:00 AM - 9:00 PM</p>
                                    <p class="accent-text"><i class="fa-solid fa-key"></i> VIP Members: 24/7 Access</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="contact-form-card">
                        <h3>Send Us a Message</h3>

                        <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3 fw-bold"></asp:Label>

                        <div>
                            <div class="form-group">
                                <label>Your Full Name *</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"
                                    required="true"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"
                                    placeholder="john@example.com" required="true"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Subject</label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"
                                    placeholder="Membership Inquiry / Day Pass Request"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Message *</label>
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4"
                                    CssClass="form-control" placeholder="How can we help you achieve your goals?"
                                    required="true"></asp:TextBox>
                            </div>

                            <asp:Button ID="btnSubmit" runat="server" Text="Send Message"
                                CssClass="btn btn-primary btn-full" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </asp:Content>