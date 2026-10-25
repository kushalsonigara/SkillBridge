<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="track-application.aspx.cs" Inherits="SkillBridge.student.student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="student-dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="my-applications.aspx">Applications</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Track Application
                </li>
            </ol>
        </nav>

        <!-- Internship Details Card -->
        <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">

            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">

                <div class="d-flex align-items-center gap-3">

                    <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center"
                        style="width: 60px; height: 60px;">
                        <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
                    </div>

                    <div>
                        <h4 class="fw-bold text-secondary mb-1">
                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        </h4>

                        <p class="text-muted fs-8 mb-1">
                            <i class="fa-solid fa-building me-1"></i>
                            <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                        </p>

                        <p class="text-muted fs-8 mb-0">
                            <i class="fa-solid fa-location-dot me-1"></i>
                            <asp:Label ID="lblLocation" runat="server"></asp:Label>
                            &bull;
                           
                            <asp:Label ID="lblDuration" runat="server"></asp:Label>
                        </p>
                    </div>

                </div>

                <span class="badge bg-light-primary text-primary px-3 py-2 fs-8 rounded-pill">Application #
                   
                    <asp:Label ID="lblApplicationID" runat="server"></asp:Label>
                </span>

            </div>

            <hr class="my-3" />

            <div class="row g-3">

                <div class="col-sm-6">
                    <span class="text-muted fs-8 d-block mb-1">Applied Date</span>
                    <strong class="text-secondary">
                        <asp:Label ID="lblAppliedDate" runat="server"></asp:Label>
                    </strong>
                </div>

                <div class="col-sm-6">
                    <span class="text-muted fs-8 d-block mb-1">Current Status</span>
                    <asp:Label ID="lblStatus" runat="server"
                        CssClass="status-badge status-badge-pending">
                    </asp:Label>
                </div>

            </div>

        </div>

        <!-- Application Progress Timeline -->
        <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">

            <h5 class="fw-bold text-secondary mb-5 text-center text-sm-start">Application Progress
            </h5>

            <div class="tracking-timeline">

                <!-- Timeline Progress Bar -->
                <asp:Panel ID="pnlProgress" runat="server"
                    CssClass="timeline-progress" Style="width: 0%;">
                </asp:Panel>

                <!-- Step 1: Applied -->
                <asp:Panel ID="pnlApplied" runat="server"
                    CssClass="timeline-step">

                    <div class="step-node">
                        <i class="fa-solid fa-check"></i>
                    </div>

                    <div class="step-title">Applied</div>

                    <div class="step-date">
                        <asp:Label ID="lblTimelineAppliedDate" runat="server"></asp:Label>
                    </div>

                </asp:Panel>

                <!-- Step 2: Application Review -->
                <asp:Panel ID="pnlReview" runat="server"
                    CssClass="timeline-step">

                    <div class="step-node">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>

                    <div class="step-title">Application Review</div>

                    <div class="step-date">
                        <asp:Label ID="lblReviewDate" runat="server"></asp:Label>
                    </div>

                </asp:Panel>

                <!-- Step 3: Final Decision -->
                <asp:Panel ID="pnlDecision" runat="server"
                    CssClass="timeline-step">

                    <div class="step-node">
                        <i class="fa-solid fa-award"></i>
                    </div>

                    <div class="step-title">Final Decision</div>

                    <div class="step-date">
                        <asp:Label ID="lblDecisionDate" runat="server"></asp:Label>
                    </div>

                </asp:Panel>

            </div>

        </div>

        <!-- Current Application Status Message -->
        <div class="bg-light-primary text-primary p-4 border rounded-3 shadow-sm mb-4">

            <h5 class="fw-bold mb-3">
                <i class="fa-solid fa-circle-info me-2"></i>
                Application Update
            </h5>

            <p class="fs-7 text-dark opacity-90 mb-0">
                <asp:Label ID="lblStatusMessage" runat="server"></asp:Label>
            </p>

        </div>

        <!-- Navigation Buttons -->
        <div class="d-flex gap-2 flex-wrap">

            <a href="my-applications.aspx"
                class="btn btn-outline-secondary btn-sm px-4 rounded-3">
                <i class="fa-solid fa-arrow-left me-2"></i>
                Back to Applications
            </a>

            <a href="../internship-list.aspx"
                class="btn btn-primary btn-sm px-4 rounded-3">
                <i class="fa-solid fa-magnifying-glass me-2"></i>
                Find More Internships
            </a>

        </div>

        <!-- No Application Found Message -->
        <asp:Panel ID="pnlNoApplication" runat="server"
            CssClass="alert alert-info mt-4" Visible="false">

            <i class="fa-solid fa-circle-info me-2"></i>

            <asp:Label ID="lblNoApplication" runat="server"
                Text="Application not found or you do not have permission to view it.">
            </asp:Label>

        </asp:Panel>

        <!-- Original Static Internship Details Commented Out

        <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">
            <h4>Frontend Developer Intern</h4>
            <p>TechSphere Solutions • Remote • Posted 3 days ago</p>
            <span>Active Tracking</span>
        </div>

        -->

        <!-- Original Static Timeline Commented Out

        <div class="tracking-timeline">
            <div class="timeline-progress" style="width: 66%;"></div>

            <div class="timeline-step completed">
                <div class="step-node">
                    <i class="fa-solid fa-check"></i>
                </div>
                <div class="step-title">Applied</div>
                <div class="step-date">Aug 1, 2026</div>
            </div>

            <div class="timeline-step completed">
                <div class="step-node">
                    <i class="fa-solid fa-check"></i>
                </div>
                <div class="step-title">Under Review</div>
                <div class="step-date">Aug 3, 2026</div>
            </div>

            <div class="timeline-step active">
                <div class="step-node">
                    <i class="fa-solid fa-video"></i>
                </div>
                <div class="step-title">Interview Round</div>
                <div class="step-date">Aug 10, 2026</div>
            </div>

            <div class="timeline-step">
                <div class="step-node">
                    <i class="fa-solid fa-award"></i>
                </div>
                <div class="step-title">Decision</div>
                <div class="step-date">TBA</div>
            </div>
        </div>

        -->

        <!-- Original Shortlist Notice, Interview Details, and Checklist
             have been removed from display because these details are
             not currently stored in the database. -->

    </div>

</asp:Content>

