<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="company-dashboard.aspx.cs" Inherits="SkillBridge.company.company_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
     <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="../index.aspx">Home</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">
                    Employer Dashboard
                </li>
            </ol>
        </nav>

        <!-- Welcome Title -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Company Console</h2>
                <p class="text-muted mb-0">
                    Hiring metrics and student applicant listings for your company.
                </p>
            </div>

            <a href="add-internship.aspx" class="btn btn-primary shadow-sm">
                <i class="fa-solid fa-circle-plus me-2"></i>Post New Opening
            </a>
        </div>

        <!-- Metrics Stat Cards -->
        <div class="row g-4 mb-4">

            <!-- Total Positions -->
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Total Positions</h6>
                        <%-- Original HTML: <h2>5</h2> --%>
                        <h2>
                            <asp:Label ID="lblTotalPositions" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-primary">
                        <i class="fa-solid fa-folder-open"></i>
                    </div>
                </div>
            </div>

            <!-- Active Openings -->
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Active Openings</h6>
                        <%-- Original HTML: <h2 class="text-success">3</h2> --%>
                        <h2 class="text-success">
                            <asp:Label ID="lblActiveOpenings" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-success">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>
                </div>
            </div>

            <!-- Total Applications -->
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Applications</h6>
                        <%-- Original HTML: <h2 class="text-warning">45</h2> --%>
                        <h2 class="text-warning">
                            <asp:Label ID="lblTotalApplications" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-warning">
                        <i class="fa-solid fa-file-invoice"></i>
                    </div>
                </div>
            </div>

            <!-- Selected Students -->
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Selected Students</h6>
                        <%-- Original HTML: <h2 class="text-info">15</h2> --%>
                        <h2 class="text-info">
                            <asp:Label ID="lblSelectedStudents" runat="server" Text="0"></asp:Label>
                        </h2>
                    </div>
                    <div class="card-stat-icon bg-light-info">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                </div>
            </div>

        </div>

        <!-- Charts Row replaced with Internship Overview and Applicant Management -->

        <%--
        Original chart section removed:
        <div class="row g-4 mb-4">
            <div class="col-lg-8">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5>Incoming Applications Trend</h5>
                    <canvas id="companyMonthlyChart"></canvas>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5>Review Distribution</h5>
                    <canvas id="companyStatusChart"></canvas>
                </div>
            </div>
        </div>
        --%>

        <!-- Internship Overview and Applicant Management -->
        <div class="row g-4 mb-4">

            <!-- Internship Overview -->
            <div class="col-lg-6">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-bold text-secondary mb-0">Internship Overview</h5>
                        <i class="fa-solid fa-briefcase text-primary fs-4"></i>
                    </div>

                    <p class="text-muted mb-4">
                        Manage your internship opportunities and attract suitable candidates.
                    </p>

                    <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-3">
                        <span class="text-secondary">Manage Posted Internships</span>
                        <a href="internship-management.aspx" class="btn btn-light btn-sm text-primary fw-bold">
                            Manage <i class="fa-solid fa-arrow-right ms-1"></i>
                        </a>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-secondary">Post a New Internship</span>
                        <a href="add-internship.aspx" class="btn btn-light btn-sm text-success fw-bold">
                            Post Now <i class="fa-solid fa-plus ms-1"></i>
                        </a>
                    </div>

                </div>
            </div>

            <!-- Applicant Management -->
            <div class="col-lg-6">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-bold text-secondary mb-0">Applicant Management</h5>
                        <i class="fa-solid fa-users text-primary fs-4"></i>
                    </div>

                    <p class="text-muted mb-4">
                        Review student applications and follow up on candidates for your openings.
                    </p>

                    <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-3">
                        <span class="text-secondary">Review Applications</span>
                        <a href="applicants.aspx" class="btn btn-light btn-sm text-primary fw-bold">
                            View Applicants <i class="fa-solid fa-arrow-right ms-1"></i>
                        </a>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-secondary">Recent Applications</span>
                        <a href="#recentApplications" class="btn btn-light btn-sm text-success fw-bold">
                            View Recent <i class="fa-solid fa-arrow-down ms-1"></i>
                        </a>
                    </div>

                </div>
            </div>

        </div>

        <!-- Recent Applications Summary -->
        <div id="recentApplications" class="bg-white border rounded-3 p-4 shadow-sm">

            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <h5 class="fw-bold text-secondary mb-0">Recent Applications Inbox</h5>
                <a href="applicants.aspx" class="btn btn-outline-primary btn-sm px-3">
                    View Full Inbox
                </a>
            </div>

            <div class="table-responsive">

                <%-- Original static HTML table and dummy rows replaced with ASP.NET GridView --%>
                <%--
                <table class="table table-hover align-middle mb-0 text-secondary fs-8">
                    <thead class="table-light text-uppercase">
                        <tr>
                            <th>Student Name</th>
                            <th>Applied Position</th>
                            <th>College Name</th>
                            <th>Date Applied</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        Dummy application rows removed.
                    </tbody>
                </table>
                --%>

                <asp:GridView ID="gvRecentApplications" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle mb-0 text-secondary fs-8"
                    GridLines="None"
                    Width="100%"
                    EmptyDataText="No recent applications found.">

                    <HeaderStyle CssClass="table-light text-uppercase" />

                    <Columns>

                        <asp:BoundField DataField="FullName" HeaderText="Student Name" />

                        <asp:BoundField DataField="Title" HeaderText="Applied Position" />

                        <asp:BoundField DataField="College" HeaderText="College Name" />

                        <asp:BoundField DataField="ApplicationDate"
                            HeaderText="Date Applied"
                            DataFormatString="{0:dd MMM yyyy}" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkReview" runat="server"
                                    NavigateUrl="applicants.aspx"
                                    CssClass="btn btn-light btn-sm text-primary fw-bold">
                                    Review File
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>
        </div>

    </div>
</asp:Content>

