<%@ Page Title="Membership Plans | TITAN FITNESS" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Plans.aspx.cs" Inherits="Titan_Fitness.Plans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="plans" class="page-section plans-section" style="padding-top: 130px;">
        <div class="container">
            <div class="section-header text-center">
                <span class="section-tag">MEMBERSHIP PLANS</span>
                <h2 class="section-title">FLEXIBLE PRICING FOR <span class="gradient-text">EVERY GOAL</span></h2>
                <p class="section-desc">No hidden fees. Transparent pricing with flexible contract options.</p>
            </div>

            <div class="plans-grid">
                <div class="plan-card">
                    <h3 class="plan-name">BASIC</h3>
                    <p class="plan-subtitle">Essential access for casual fitness enthusiasts</p>
                    <div class="plan-price">
                        <span class="currency">$</span>
                        <span class="price-val" data-monthly="29" data-annual="24">29</span>
                        <span class="period">/ month</span>
                    </div>
                    <ul class="plan-features">
                        <li><i class="fa-solid fa-check"></i>Standard Gym Floor Access</li>
                        <li><i class="fa-solid fa-check"></i>Cardio & Weight Zone</li>
                        <li><i class="fa-solid fa-check"></i>Locker Room & Showers</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>Group Fitness Classes</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>Personal Trainer Sessions</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>24/7 VIP Access</li>
                    </ul>
                    <% if (Session["UserEmail"] == null)
                        { %>
                    <a href="Register.aspx" class="btn btn-outline btn-full">Choose Basic</a>
                    <% }
                        else
                        { %>
                    <a href="Profile.aspx" class="btn btn-outline btn-full">Upgrade to Basic</a>
                    <% } %>
                </div>

                <div class="plan-card">
                    <h3 class="plan-name">STANDARD</h3>
                    <p class="plan-subtitle">Great for consistent gym goers seeking variety</p>
                    <div class="plan-price">
                        <span class="currency">$</span>
                        <span class="price-val" data-monthly="59" data-annual="47">59</span>
                        <span class="period">/ month</span>
                    </div>
                    <ul class="plan-features">
                        <li><i class="fa-solid fa-check"></i>Full Gym Floor Access</li>
                        <li><i class="fa-solid fa-check"></i>Cardio & Weight Zone</li>
                        <li><i class="fa-solid fa-check"></i>Locker Room & Sauna Access</li>
                        <li><i class="fa-solid fa-check"></i>Unlimited Group Fitness Classes</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>Personal Trainer Sessions</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>Guest Passes</li>
                    </ul>
                    <% if (Session["UserEmail"] == null)
                        { %>
                    <a href="Register.aspx" class="btn btn-outline btn-full">Choose Standard</a>
                    <% }
                        else
                        { %>
                    <a href="Profile.aspx" class="btn btn-outline btn-full">Upgrade to Standard</a>
                    <% } %>
                </div>

                <div class="plan-card popular">
                    <div class="plan-badge">MOST POPULAR</div>
                    <h3 class="plan-name">PREMIUM</h3>
                    <p class="plan-subtitle">Comprehensive package for maximum athletic results</p>
                    <div class="plan-price">
                        <span class="currency">$</span>
                        <span class="price-val" data-monthly="89" data-annual="71">89</span>
                        <span class="period">/ month</span>
                    </div>
                    <ul class="plan-features">
                        <li><i class="fa-solid fa-check"></i>Everything in Standard</li>
                        <li><i class="fa-solid fa-check"></i>24/7 Keycard Entry</li>
                        <li><i class="fa-solid fa-check"></i>2 Personal Training Sessions / mo</li>
                        <li><i class="fa-solid fa-check"></i>InBody Body Scan (Monthly)</li>
                        <li><i class="fa-solid fa-check"></i>Free Smoothie per Visit</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i>Dedicated Private Locker</li>
                    </ul>
                    <% if (Session["UserEmail"] == null)
                        { %>
                    <a href="Register.aspx" class="btn btn-outline btn-full">Choose Premium</a>
                    <% }
                        else
                        { %>
                    <a href="Profile.aspx" class="btn btn-outline btn-full">Upgrade to Premium</a>
                    <% } %>
                </div>

                <div class="plan-card">
                    <h3 class="plan-name">VIP UNLIMITED</h3>
                    <p class="plan-subtitle">The ultimate luxury fitness experience</p>
                    <div class="plan-price">
                        <span class="currency">$</span>
                        <span class="price-val" data-monthly="129" data-annual="103">129</span>
                        <span class="period">/ month</span>
                    </div>
                    <ul class="plan-features">
                        <li><i class="fa-solid fa-check"></i>All Premium Benefits Included</li>
                        <li><i class="fa-solid fa-check"></i>Unlimited 1-on-1 Personal Training</li>
                        <li><i class="fa-solid fa-check"></i>Cryotherapy & Recovery Lounge</li>
                        <li><i class="fa-solid fa-check"></i>Custom Diet & Meal Plan</li>
                        <li><i class="fa-solid fa-check"></i>Reserved Private Locker & Towel</li>
                        <li><i class="fa-solid fa-check"></i>2 Free Guest Passes / Month</li>
                    </ul>
                    <% if (Session["UserEmail"] == null)
                        { %>
                    <a href="Register.aspx" class="btn btn-outline btn-full">Choose VIP</a>
                    <% }
                    else
                    { %>
                    <a href="Profile.aspx" class="btn btn-outline btn-full">Upgrade to VIP</a>
                    <% } %>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
