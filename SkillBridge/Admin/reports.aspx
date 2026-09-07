<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="SkillBridge.Admin.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="admin-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Reports & Analytics</li>
            </ol>
        </nav>

        <h2 class="fw-bold text-secondary mb-4">Export Platform Records</h2>

        <!-- Reports Download Grid -->
        <div class="row g-4 mb-4">
            <!-- Student Report -->
            <div class="col-md-6 col-xl-3">
                <div class="card-premium p-4 h-100 d-flex flex-column">
                    <h5 class="fw-bold text-secondary mb-2"><i class="fa-solid fa-user-graduate text-primary me-2"></i>Students Placement</h5>
                    <p class="text-muted fs-8 mb-4">Export metrics detailing total placed, pending candidates, active resumes, and university distribution lists.</p>
                    <div class="d-flex gap-2 mt-auto">
                        <button class="btn btn-primary btn-sm flex-grow-1 btn-export-report fs-9 py-2" data-type="Student Placement" data-format="CSV"><i class="fa-solid fa-download me-1"></i>Download CSV</button>
                        <button class="btn btn-outline-secondary btn-sm btn-export-report fs-9 py-2" data-type="Student Placement" data-format="PDF"><i class="fa-solid fa-file-pdf"></i></button>
                    </div>
                </div>
            </div>

            <!-- Company Report -->
            <div class="col-md-6 col-xl-3">
                <div class="card-premium p-4 h-100 d-flex flex-column">
                    <h5 class="fw-bold text-secondary mb-2"><i class="fa-solid fa-building text-success me-2"></i>Employers Listings</h5>
                    <p class="text-muted fs-8 mb-4">Includes active corporate accounts, average stipends published, and employer feedback scores.</p>
                    <div class="d-flex gap-2 mt-auto">
                        <button class="btn btn-primary btn-sm flex-grow-1 btn-export-report fs-9 py-2" data-type="Employers Listings" data-format="CSV"><i class="fa-solid fa-download me-1"></i>Download CSV</button>
                        <button class="btn btn-outline-secondary btn-sm btn-export-report fs-9 py-2" data-type="Employers Listings" data-format="PDF"><i class="fa-solid fa-file-pdf"></i></button>
                    </div>
                </div>
            </div>

            <!-- Internship Status Report -->
            <div class="col-md-6 col-xl-3">
                <div class="card-premium p-4 h-100 d-flex flex-column">
                    <h5 class="fw-bold text-secondary mb-2"><i class="fa-solid fa-briefcase text-info me-2"></i>Internship Positions</h5>
                    <p class="text-muted fs-8 mb-4">Export open vs closed listings, categories, average durations, and application volume trends.</p>
                    <div class="d-flex gap-2 mt-auto">
                        <button class="btn btn-primary btn-sm flex-grow-1 btn-export-report fs-9 py-2" data-type="Internship Positions" data-format="CSV"><i class="fa-solid fa-download me-1"></i>Download CSV</button>
                        <button class="btn btn-outline-secondary btn-sm btn-export-report fs-9 py-2" data-type="Internship Positions" data-format="PDF"><i class="fa-solid fa-file-pdf"></i></button>
                    </div>
                </div>
            </div>

            <!-- Application status report -->
            <div class="col-md-6 col-xl-3">
                <div class="card-premium p-4 h-100 d-flex flex-column">
                    <h5 class="fw-bold text-secondary mb-2"><i class="fa-solid fa-folder-open text-warning me-2"></i>Application Pipeline</h5>
                    <p class="text-muted fs-8 mb-4">Get records covering selection ratios, interview timelines, and user application rates.</p>
                    <div class="d-flex gap-2 mt-auto">
                        <button class="btn btn-primary btn-sm flex-grow-1 btn-export-report fs-9 py-2" data-type="Application Pipeline" data-format="CSV"><i class="fa-solid fa-download me-1"></i>Download CSV</button>
                        <button class="btn btn-outline-secondary btn-sm btn-export-report fs-9 py-2" data-type="Application Pipeline" data-format="PDF"><i class="fa-solid fa-file-pdf"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Split Grid (Charts vs Summary Tables) -->
        <div class="row g-4">
            <!-- Doughnut distribution chart -->
            <div class="col-lg-5">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5 class="fw-bold text-secondary mb-4">General Selection Decisions Breakdown</h5>
                    <div style="position: relative; height: 280px;" class="d-flex align-items-center justify-content-center">
                        <canvas id="reportMainChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Summary stats table by dept -->
            <div class="col-lg-7">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5 class="fw-bold text-secondary mb-4">Placements Summary by Department</h5>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-secondary fs-8">
                            <thead class="table-light text-uppercase">
                                <tr>
                                    <th>Department</th>
                                    <th>Active Openings</th>
                                    <th>Placed Students</th>
                                    <th>Selection Rate</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong class="text-dark">Software Development</strong></td>
                                    <td>420 Openings</td>
                                    <td>1,850 Students</td>
                                    <td><span class="badge bg-light-success text-success px-2 py-1 fs-9 rounded-2">44.0%</span></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-dark">UI/UX Design</strong></td>
                                    <td>210 Openings</td>
                                    <td>840 Students</td>
                                    <td><span class="badge bg-light-success text-success px-2 py-1 fs-9 rounded-2">40.0%</span></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-dark">Digital Marketing</strong></td>
                                    <td>320 Openings</td>
                                    <td>1,120 Students</td>
                                    <td><span class="badge bg-light-warning text-warning px-2 py-1 fs-9 rounded-2">35.0%</span></td>
                                </tr>
                                <tr>
                                    <td><strong class="text-dark">Human Resources</strong></td>
                                    <td>150 Openings</td>
                                    <td>480 Students</td>
                                    <td><span class="badge bg-light-success text-success px-2 py-1 fs-9 rounded-2">32.0%</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>

