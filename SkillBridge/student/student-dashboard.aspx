<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="student-dashboard.aspx.cs" Inherits="SkillBridge.student.student_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="../index.aspx">Home</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Student Dashboard
                </li>
            </ol>
        </nav>

        <!-- Dynamic Page Welcome Title -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>

                <!-- Original static HTML commented out -->
                <%--
                <h2 class="fw-bold text-secondary mb-1">Hello, John Doe!</h2>
                --%>

                <h2 class="fw-bold text-secondary mb-1">Hello,
                    <asp:Label ID="lblStudentName" runat="server" Text="Student"></asp:Label>!
                </h2>

                <p class="text-muted mb-0">
                    Here is the update of your active applications and recommended positions.
               
                </p>
            </div>

            <a href="../internship-list.aspx" class="btn btn-primary shadow-sm">
                <i class="fa-solid fa-magnifying-glass me-2"></i>Browse Internships
            </a>
        </div>

        <!-- Metric Stat Cards Grid -->
        <div class="row g-4 mb-4">

            <!-- Applied -->
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Applied</h6>

                        <!-- Original static HTML commented out -->
                        <%-- <h2>12</h2> --%>

                        <h2>
                            <asp:Label ID="lblAppliedCount" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-primary">
                        <i class="fa-solid fa-paper-plane"></i>
                    </div>
                </div>
            </div>

            <!-- Accepted -->
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Accepted</h6>

                        <!-- Original static HTML commented out -->
                        <%-- <h2 class="text-success">2</h2> --%>

                        <h2 class="text-success">
                            <asp:Label ID="lblAcceptedCount" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-success">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                </div>
            </div>

            <!-- Pending -->
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Pending</h6>

                        <!-- Original static HTML commented out -->
                        <%-- <h2 class="text-warning">7</h2> --%>

                        <h2 class="text-warning">
                            <asp:Label ID="lblPendingCount" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-warning">
                        <i class="fa-solid fa-clock"></i>
                    </div>
                </div>
            </div>

            <!-- Rejected -->
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Rejected</h6>

                        <!-- Original static HTML commented out -->
                        <%-- <h2 class="text-danger">3</h2> --%>

                        <h2 class="text-danger">
                            <asp:Label ID="lblRejectedCount" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-danger">
                        <i class="fa-solid fa-circle-xmark"></i>
                    </div>
                </div>
            </div>

            <!-- Recommended For You -->
            <div class="col-xl-4 col-md-8">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Recommended For You</h6>

                        <!-- Original static HTML commented out -->
                        <%-- <h2 class="text-info">5 matches</h2> --%>

                        <h2 class="text-info">
                            <asp:Label ID="lblRecommendationCount" runat="server" Text="0 matches"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-info">
                        <i class="fa-solid fa-sparkles"></i>
                    </div>
                </div>
            </div>

        </div>

        <!-- Recent Activities and Quick Actions Split -->
        <div class="row g-4">

            <!-- Recent Activity Feed -->
            <div class="col-lg-8">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">

                    <h5 class="fw-bold text-secondary mb-4">
                        <i class="fa-solid fa-clock-rotate-left me-2 text-primary"></i>Recent Activities
                    </h5>

                    <!-- Original static Recent Activities HTML commented out -->
                    <%--
                    <ul class="activity-feed">
                        <li class="activity-item success">
                            <span class="activity-icon-wrapper">
                                <i class="fa-solid fa-circle-check"></i>
                            </span>
                            <div class="fw-semibold text-secondary">Application Accepted</div>
                            <p class="text-muted fs-8 mb-1">
                                Your application for <strong>Frontend Intern</strong> at TechSphere Solutions was approved.
                                Check your email for details.
                            </p>
                            <span class="activity-time">2 hours ago</span>
                        </li>

                        <li class="activity-item primary">
                            <span class="activity-icon-wrapper">
                                <i class="fa-solid fa-envelope"></i>
                            </span>
                            <div class="fw-semibold text-secondary">Interview Invitation</div>
                            <p class="text-muted fs-8 mb-1">
                                Stripe Inc. updated your status for Software Engineering Intern to Under Interview.
                            </p>
                            <span class="activity-time">1 day ago</span>
                        </li>

                        <li class="activity-item info">
                            <span class="activity-icon-wrapper">
                                <i class="fa-solid fa-paper-plane"></i>
                            </span>
                            <div class="fw-semibold text-secondary">Applied for Internship</div>
                            <p class="text-muted fs-8 mb-1">
                                You submitted your application to FigmaLab Studios.
                            </p>
                            <span class="activity-time">3 days ago</span>
                        </li>

                        <li class="activity-item warning">
                            <span class="activity-icon-wrapper">
                                <i class="fa-solid fa-user-pen"></i>
                            </span>
                            <div class="fw-semibold text-secondary">Profile Strength Increased</div>
                            <p class="text-muted fs-8 mb-1">
                                You updated your skill sets and college enrollment records.
                            </p>
                            <span class="activity-time">5 days ago</span>
                        </li>
                    </ul>
                    --%>

                    <!-- Dynamic Recent Activities using DataList -->
                    <ul class="activity-feed">

                        <asp:DataList ID="dlRecentActivities" runat="server" Width="100%">

                            <ItemTemplate>
                                <li class='<%# "activity-item " + Eval("ActivityClass") %>'>

                                    <span class="activity-icon-wrapper">
                                        <i class='<%# Eval("ActivityIcon") %>'></i>
                                    </span>

                                    <div class="fw-semibold text-secondary">
                                        <%# Eval("ActivityTitle") %>
                                    </div>

                                    <p class="text-muted fs-8 mb-1">
                                        <%# Eval("ActivityDescription") %>
                                    </p>

                                    <span class="activity-time">
                                        <%# Eval("ActivityDate", "{0:dd MMM yyyy}") %>
                                    </span>

                                </li>
                            </ItemTemplate>

                        </asp:DataList>

                        <asp:Panel ID="pnlNoActivities" runat="server" Visible="false">
                            <li class="activity-item">
                                <p class="text-muted mb-0">No recent activities found.</p>
                            </li>
                        </asp:Panel>

                    </ul>

                </div>
            </div>

            <!-- Quick Actions & System Information -->
            <div class="col-lg-4">
                <div class="d-flex flex-column gap-4">

                    <!-- Quick Actions -->
                    <div class="bg-white border rounded-3 p-4 shadow-sm">
                        <h5 class="fw-bold text-secondary mb-3">Quick Actions</h5>

                        <div class="d-grid gap-2">
                            <a href="student-profile.aspx" class="btn btn-outline-primary text-start">
                                <i class="fa-solid fa-user-pen me-2"></i>Edit Profile Info
                            </a>

                            <a href="recommendation.aspx" class="btn btn-outline-info text-start text-dark">
                                <i class="fa-solid fa-sparkles me-2"></i>Check Recommendations
                            </a>

                            <a href="../internship-list.aspx" class="btn btn-outline-secondary text-start">
                                <i class="fa-solid fa-magnifying-glass me-2"></i>Search Opportunities
                            </a>

                            <a href="my-applications.aspx" class="btn btn-outline-dark text-start">
                                <i class="fa-solid fa-list me-2"></i>View Applied Jobs
                            </a>
                        </div>
                    </div>

                    <!-- Match Notification Alert -->
                    <div class="bg-light-primary text-primary p-4 border rounded-3 shadow-sm position-relative overflow-hidden">

                        <div class="position-absolute" style="top: -10px; right: -10px; font-size: 5rem; opacity: 0.1; transform: rotate(20deg);">
                            <i class="fa-solid fa-sparkles"></i>
                        </div>

                        <!-- Original static Match Notification HTML commented out -->
                        <%--
                        <h5 class="fw-bold mb-2">90% Match Found!</h5>
                        <p class="fs-8 mb-3 opacity-90 text-dark">
                            A new Frontend Developer Internship position at Spotify was just published
                            that matches your exact profile skills.
                        </p>
                        --%>

                        <h5 class="fw-bold mb-2">
                            <asp:Label ID="lblMatchTitle" runat="server" Text="Recommended Internship"></asp:Label>
                        </h5>

                        <p class="fs-8 mb-3 opacity-90 text-dark">
                            <asp:Label ID="lblMatchDescription" runat="server"
                                Text="Explore internships that match your profile skills."></asp:Label>
                        </p>

                        <a href="../internship-list.aspx" class="btn btn-primary btn-sm px-3 py-1.5 shadow-sm">Check Listing <i class="fa-solid fa-arrow-right ms-1"></i>
                        </a>

                    </div>

                </div>
            </div>

        </div>

    </div>
</asp:Content>

