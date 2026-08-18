<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="my-applications.aspx.cs" Inherits="SkillBridge.student.my_applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="student-dashboard.html">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">My Applications</li>
            </ol>
        </nav>

        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">My Applications</h2>
                <p class="text-muted mb-0">Review status updates for all submitted applications</p>
            </div>
            <a href="internship-list.html" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass me-2"></i>Apply for More</a>
        </div>

        <!-- Table Toolbar -->
        <div class="table-toolbar">
            <div class="d-flex align-items-center gap-2 flex-grow-1 max-width-350">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                    <input type="text" class="form-control form-control-custom ps-1 border-start-0 fs-8" placeholder="Search table...">
                </div>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="fs-8 text-muted text-nowrap d-none d-sm-inline">Filter Status</span>
                <select class="form-select form-select-sm fs-8 border-light rounded-3 bg-white">
                    <option value="">All Statuses</option>
                    <option value="pending">Pending</option>
                    <option value="review">Under Review</option>
                    <option value="interview">Interview</option>
                    <option value="accepted">Accepted</option>
                    <option value="rejected">Rejected</option>
                </select>
            </div>
        </div>

        <!-- Applications Table -->
        <div class="table-responsive-custom">
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>Internship Position</th>
                        <th>Company</th>
                        <th>Applied Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Frontend Developer</strong>
                            <span class="text-muted fs-8">Remote | 3 Months</span>
                        </td>
                        <td>
                            <span class="fw-medium text-dark"><i class="fa-solid fa-building text-primary me-2"></i>TechSphere Solutions</span>
                        </td>
                        <td>Aug 1, 2026</td>
                        <td>
                            <span class="status-badge status-badge-accepted">Accepted</span>
                        </td>
                        <td>
                            <a href="track-application.html?id=1" class="btn btn-outline-primary btn-sm px-3 rounded-2"><i class="fa-solid fa-route me-1"></i>Track Flow</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Software Engineering Intern</strong>
                            <span class="text-muted fs-8">Palo Alto, CA | 6 Months</span>
                        </td>
                        <td>
                            <span class="fw-medium text-dark"><i class="fa-solid fa-building text-primary me-2"></i>Stripe Inc.</span>
                        </td>
                        <td>Jul 28, 2026</td>
                        <td>
                            <span class="status-badge status-badge-interview">Interview</span>
                        </td>
                        <td>
                            <a href="track-application.html?id=2" class="btn btn-outline-primary btn-sm px-3 rounded-2"><i class="fa-solid fa-route me-1"></i>Track Flow</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">UI/UX Designer Intern</strong>
                            <span class="text-muted fs-8">San Francisco, CA | 3 Months</span>
                        </td>
                        <td>
                            <span class="fw-medium text-dark"><i class="fa-solid fa-building text-primary me-2"></i>FigmaLab Studios</span>
                        </td>
                        <td>Jul 25, 2026</td>
                        <td>
                            <span class="status-badge status-badge-pending">Pending</span>
                        </td>
                        <td>
                            <a href="track-application.html?id=3" class="btn btn-outline-primary btn-sm px-3 rounded-2"><i class="fa-solid fa-route me-1"></i>Track Flow</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Digital Marketing Intern</strong>
                            <span class="text-muted fs-8">Remote | 3 Months</span>
                        </td>
                        <td>
                            <span class="fw-medium text-dark"><i class="fa-solid fa-building text-primary me-2"></i>GrowthHack Inc.</span>
                        </td>
                        <td>Jul 20, 2026</td>
                        <td>
                            <span class="status-badge status-badge-rejected">Rejected</span>
                        </td>
                        <td>
                            <a href="track-application.html?id=4" class="btn btn-outline-primary btn-sm px-3 rounded-2"><i class="fa-solid fa-route me-1"></i>Track Flow</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Custom Pagination -->
        <div class="pagination-custom">
            <span class="pagination-info">Showing entries <strong>1 - 4</strong> of 4</span>
            <ul class="pagination-pages">
                <li class="pagination-page-item disabled"><a href="#" class="pagination-page-link"><i class="fa-solid fa-chevron-left"></i></a></li>
                <li class="pagination-page-item active"><a href="#" class="pagination-page-link">1</a></li>
                <li class="pagination-page-item disabled"><a href="#" class="pagination-page-link"><i class="fa-solid fa-chevron-right"></i></a></li>
            </ul>
        </div>

    </div>

</asp:Content>

