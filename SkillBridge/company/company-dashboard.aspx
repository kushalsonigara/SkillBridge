<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="company-dashboard.aspx.cs" Inherits="SkillBridge.company.company_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Employer Dashboard</li>
            </ol>
        </nav>

        <!-- Welcome title -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Company Console</h2>
                <p class="text-muted mb-0">Hiring metrics and student applicant listings for <strong>TechSphere Solutions</strong>.</p>
            </div>
            <a href="add-internship.html" class="btn btn-primary shadow-sm"><i class="fa-solid fa-circle-plus me-2"></i>Post New Opening</a>
        </div>

        <!-- Metrics stat cards -->
        <div class="row g-4 mb-4">
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Total Positions</h6>
                        <h2>5</h2>
                    </div>
                    <div class="card-stat-icon bg-light-primary">
                        <i class="fa-solid fa-folder-open"></i>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Active Openings</h6>
                        <h2 class="text-success">3</h2>
                    </div>
                    <div class="card-stat-icon bg-light-success">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Applications</h6>
                        <h2 class="text-warning">45</h2>
                    </div>
                    <div class="card-stat-icon bg-light-warning">
                        <i class="fa-solid fa-file-invoice"></i>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Selected Students</h6>
                        <h2 class="text-info">15</h2>
                    </div>
                    <div class="card-stat-icon bg-light-info">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts Row -->
        <div class="row g-4 mb-4">
            <!-- Monthly applications trend -->
            <div class="col-lg-8">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5 class="fw-bold text-secondary mb-4">Incoming Applications Trend</h5>
                    <div style="position: relative; height: 300px;">
                        <canvas id="companyMonthlyChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Application breakdown doughnut -->
            <div class="col-lg-4">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5 class="fw-bold text-secondary mb-4">Review Distribution</h5>
                    <div style="position: relative; height: 260px;">
                        <canvas id="companyStatusChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent applications summary -->
        <div class="bg-white border rounded-3 p-4 shadow-sm">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <h5 class="fw-bold text-secondary mb-0">Recent Applications Inbox</h5>
                <a href="applicants.html" class="btn btn-outline-primary btn-sm px-3">View Full Inbox</a>
            </div>

            <div class="table-responsive">
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
                        <tr>
                            <td><strong class="text-dark">Jane Doe</strong></td>
                            <td>Frontend Developer Intern</td>
                            <td>Stanford University</td>
                            <td>Aug 1, 2026</td>
                            <td><a href="applicants.html" class="btn btn-light btn-sm text-primary fw-bold">Review File</a></td>
                        </tr>
                        <tr>
                            <td><strong class="text-dark">Bob Marley</strong></td>
                            <td>UI/UX Designer Intern</td>
                            <td>MIT Tech</td>
                            <td>Jul 31, 2026</td>
                            <td><a href="applicants.html" class="btn btn-light btn-sm text-primary fw-bold">Review File</a></td>
                        </tr>
                        <tr>
                            <td><strong class="text-dark">Sarah Connor</strong></td>
                            <td>Digital Marketing Intern</td>
                            <td>UC Berkeley</td>
                            <td>Jul 30, 2026</td>
                            <td><a href="applicants.html" class="btn btn-light btn-sm text-primary fw-bold">Review File</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</asp:Content>

