<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="internship-details.aspx.cs" Inherits="SkillBridge.internship_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-container">

        <!-- Page Header -->
        <section class="page-header-bg text-center mb-5">
            <div class="container">
                <h1 class="mb-3">Internship Details</h1>
                <p class="mb-0 text-accent fs-6">
                    Explore the opportunity and learn more about the role.
               
                </p>
            </div>
        </section>

        <!-- Original static details layout replaced with database controls -->
        <%--
        <div class="card-premium p-4">
            <h2>Internship Title</h2>
            <p>Company Name</p>
            <p>Internship Description</p>
        </div>
        --%>

        <section class="pb-5">
            <div class="container">

                <asp:Panel ID="pnlInternshipDetails" runat="server" Visible="false">

                    <div class="card-premium p-4 p-md-5">

                        <!-- Internship Title and Company -->
                        <div class="d-flex gap-3 align-items-start mb-4">

                            <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center flex-shrink-0"
                                style="width: 65px; height: 65px;">
                                <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
                            </div>

                            <div class="flex-grow-1">
                                <h2 class="fw-bold text-secondary mb-2">
                                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                </h2>

                                <div class="text-primary fw-semibold fs-6">
                                    <i class="fa-solid fa-building me-1"></i>
                                    <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                                </div>

                                <div class="text-muted mt-2">
                                    <i class="fa-solid fa-location-dot me-1"></i>
                                    <asp:Label ID="lblLocation" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>

                        <hr />

                        <!-- Internship Information -->
                        <h5 class="fw-bold text-secondary mb-3">Internship Overview</h5>

                        <div class="row g-3 mb-4">

                            <div class="col-md-4">
                                <div class="bg-light rounded-3 p-3 h-100">
                                    <div class="text-muted small mb-2">Monthly Stipend</div>
                                    <h5 class="text-primary mb-0">₹<asp:Label ID="lblStipend" runat="server"></asp:Label>
                                    </h5>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="bg-light rounded-3 p-3 h-100">
                                    <div class="text-muted small mb-2">Duration</div>
                                    <h5 class="text-secondary mb-0">
                                        <asp:Label ID="lblDuration" runat="server"></asp:Label>
                                    </h5>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="bg-light rounded-3 p-3 h-100">
                                    <div class="text-muted small mb-2">Application Deadline</div>
                                    <h5 class="text-secondary mb-0">
                                        <asp:Label ID="lblDeadline" runat="server"></asp:Label>
                                    </h5>
                                </div>
                            </div>

                        </div>

                        <!-- Description -->
                        <h5 class="fw-bold text-secondary mb-3">About This Internship</h5>

                        <p class="text-muted leading-relaxed mb-4">
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </p>

                        <!-- Required Skills -->
                        <h5 class="fw-bold text-secondary mb-3">Required Skills</h5>

                        <div class="mb-4">
                            <asp:Label ID="lblSkills" runat="server"
                                CssClass="badge-skill"></asp:Label>
                        </div>

                        <hr />

                        <!-- Action Buttons -->
                        <div class="d-flex flex-wrap gap-3 mt-4">

                            <asp:HyperLink ID="lnkApply" runat="server"
                                NavigateUrl="~/student/apply-internship.aspx"
                                CssClass="btn btn-primary px-4 py-2">
                                Apply Now
                            </asp:HyperLink>

                            <asp:HyperLink ID="lnkBack" runat="server"
                                NavigateUrl="~/internship-list.aspx"
                                CssClass="btn btn-outline-secondary px-4 py-2">
                                Back to Internships
                            </asp:HyperLink>

                        </div>

                    </div>

                </asp:Panel>

                <!-- Missing internship message -->
                <asp:Panel ID="pnlNoInternship" runat="server"
                    Visible="false" CssClass="alert alert-warning">
                    Internship details could not be found.
                   
                    <a href="internship-list.aspx">Return to internship list</a>.
               
                </asp:Panel>

            </div>
        </section>

    </main>
</asp:Content>

