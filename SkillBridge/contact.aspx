<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="SkillBridge.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Main Container Partition -->
    <main class="main-container">
        <!-- Page Header -->
        <section class="page-header-bg text-center">
            <div class="container">
                <h1 class="mb-0">Get in Touch</h1>
            </div>
        </section>

        <!-- Contact Form & Info Section -->
        <section class="py-5 bg-light flex-grow-1 reveal">
            <div class="container">
                <div class="row g-4 mb-5">
                    <!-- Contact Form -->
                    <div class="col-lg-7">
                        <div class="form-card">
                            <h4 class="fw-bold text-secondary mb-1">Send a Message</h4>
                            <p class="text-muted fs-7 mb-4">Have inquiries? Submit the contact form below and our staff will respond within 24 hours.</p>

                            <%--                            <form class="needs-validation-custom" data-success-msg="Message successfully sent! We will contact you soon." data-redirect="contact.aspx" novalidate>--%>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="contact-name" class="form-label form-label-custom">Your Name</label>
                                    <asp:TextBox ID="contactname" runat="server" CssClass="form-control form-control-custom" placeholder="e.g. Jane Smith" MaxLength="100"> </asp:TextBox>
                                    <%--                                        <input type="text" id="contact-name" class="form-control form-control-custom" placeholder="e.g. Jane Smith" required>--%>
                                    <div class="invalid-feedback-custom">Name is required.</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="contact-email" class="form-label form-label-custom">Email Address</label>
                                    <asp:TextBox ID="contactemail" runat="server" TextMode="Email" CssClass="form-control form-control-custom" placeholder="e.g. jane@example.com" MaxLength="150">  </asp:TextBox>
                                    <%--                                    <input type="email" id="contact-email" class="form-control form-control-custom" placeholder="e.g. jane@example.com" required>--%>
                                    <div class="invalid-feedback-custom">Please enter a valid email.</div>
                                </div>
                                <div class="col-12">
                                    <label for="contact-subject" class="form-label form-label-custom">Subject</label>
                                    <asp:TextBox ID="contactsubject" runat="server" CssClass="form-control form-control-custom" placeholder="e.g. Partnership Request, Portal Bug Report" MaxLength="200"></asp:TextBox>
                                    <%--                                    <input type="text" id="contact-subject" class="form-control form-control-custom" placeholder="e.g. Partnership Request, Portal Bug Report" required>--%>
                                    <div class="invalid-feedback-custom">Subject is required.</div>
                                </div>
                                <div class="col-12">
                                    <label for="contact-message" class="form-label form-label-custom">Message</label>
                                    <asp:TextBox ID="contactmessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control form-control-custom" placeholder="Write your comments in detail.">  </asp:TextBox>
                                    <%--                                    <textarea id="contact-message" class="form-control form-control-custom" rows="5" placeholder="Write your comments in detail..." required></textarea>--%>
                                    <div class="invalid-feedback-custom">Message body cannot be empty.</div>
                                </div>
                                <div class="col-12">
                                    <asp:Button ID="btnSendMessage" runat="server"  Text="Send Message"  CssClass="btn btn-primary w-100 py-2"  OnClick="btnSendMessage_Click" />

                                    <asp:Label ID="lblContactResult" runat="server"  CssClass="d-block mt-3">  </asp:Label>
                                    <%--                                    <button type="submit" class="btn btn-primary w-100 py-2"><i class="fa-solid fa-paper-plane me-2"></i>Send Message</button>--%>
                                </div>
                            </div>
                            <%--</form>--%>
                        </div>
                    </div>

                    <!-- Contact Information Sidebar -->
                    <div class="col-lg-5">
                        <div class="card-premium h-100 p-4 d-flex flex-column justify-content-between">
                            <div>
                                <h4 class="fw-bold text-secondary mb-4">Contact Details</h4>

                                <!-- Address -->
                                <div class="d-flex gap-3 mb-4">
                                    <div class="bg-light-primary text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 44px; height: 44px; flex-shrink: 0;">
                                        <i class="fa-solid fa-location-dot"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Corporate HQ</h6>
                                        <p class="text-muted fs-7 mb-0">
                                            120 University Avenue, Suite 300,<br>
                                            Palo Alto, CA 94301
                                        </p>
                                    </div>
                                </div>

                                <!-- Phone -->
                                <div class="d-flex gap-3 mb-4">
                                    <div class="bg-light-success text-success rounded-circle d-flex align-items-center justify-content-center" style="width: 44px; height: 44px; flex-shrink: 0;">
                                        <i class="fa-solid fa-phone"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Office Phone</h6>
                                        <p class="text-muted fs-7 mb-0">
                                            +1 (650) 555-0199<br>
                                            Monday to Friday, 9am - 5pm PST
                                        </p>
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="d-flex gap-3">
                                    <div class="bg-light-info text-info rounded-circle d-flex align-items-center justify-content-center" style="width: 44px; height: 44px; flex-shrink: 0;">
                                        <i class="fa-solid fa-envelope"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">Support Email</h6>
                                        <p class="text-muted fs-7 mb-0">
                                            support@skillbridge.com<br>
                                            info@skillbridge.com
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Social handles grid -->
                            <div class="border-top pt-4 mt-4">
                                <h6 class="fw-bold text-secondary mb-3">Connect on Social Networks</h6>
                                <div class="d-flex gap-2">
                                    <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 36px; height: 36px; padding: 6px;"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 36px; height: 36px; padding: 6px;"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 36px; height: 36px; padding: 6px;"><i class="fa-brands fa-facebook-f"></i></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Google Maps Placeholder Container -->
                <div class="card-premium overflow-hidden p-0 border shadow-sm">
                    <div class="bg-white border-bottom p-3">
                        <h5 class="fw-bold mb-0 text-secondary"><i class="fa-solid fa-map-location-dot text-primary me-2"></i>Location Map</h5>
                    </div>
                    <!-- Simulated map rendering -->
                    <div class="bg-light d-flex flex-column align-items-center justify-content-center p-5 text-center" style="height: 350px; background: radial-gradient(circle, #E2E8F0 10%, #F1F5F9 100%);">
                        <i class="fa-solid fa-map-location text-muted fa-4x mb-3"></i>
                        <h5 class="fw-bold text-dark mb-1">Google Maps Interactive Area</h5>
                        <p class="text-muted fs-7 max-width-350">Simulated placeholder showing Office Coordinates (Palo Alto, CA)</p>
                        <a href="https://maps.google.com" target="_blank" class="btn btn-outline-secondary btn-sm mt-2"><i class="fa-solid fa-location-arrow me-2"></i>Open in Google Maps</a>
                    </div>
                </div>

            </div>
        </section>
    </main>

</asp:Content>

