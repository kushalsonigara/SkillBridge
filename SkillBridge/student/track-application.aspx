<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="track-application.aspx.cs" Inherits="SkillBridge.student.student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="student-dashboard.html">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="my-applications.html">Applications</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Track Flow</li>
            </ol>
        </nav>

        <!-- Tracker Header Details Card -->
        <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div class="d-flex align-items-center gap-3">
                    <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                        <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
                    </div>
                    <div>
                        <h4 class="fw-bold text-secondary mb-1">Frontend Developer Intern</h4>
                        <p class="text-muted fs-8 mb-0"><i class="fa-solid fa-building me-1"></i>TechSphere Solutions &bull; Remote &bull; Posted 3 days ago</p>
                    </div>
                </div>
                <span class="badge bg-light-primary text-primary px-3 py-2 fs-8 rounded-pill"><i class="fa-solid fa-circle-notch fa-spin me-1"></i>Active Tracking</span>
            </div>
        </div>

        <!-- Visual Applications Timeline Progress Container -->
        <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">
            <h5 class="fw-bold text-secondary mb-5 text-center text-sm-start">Recruitment Step Pipeline</h5>

            <div class="tracking-timeline">
                <!-- Line progress bar in background (CSS width will be calculated by js or hardcoded for demo) -->
                <div class="timeline-progress" style="width: 66%;"></div>

                <!-- Step 1 -->
                <div class="timeline-step completed">
                    <div class="step-node">
                        <i class="fa-solid fa-check"></i>
                    </div>
                    <div class="step-title">Applied</div>
                    <div class="step-date">Aug 1, 2026</div>
                </div>

                <!-- Step 2 -->
                <div class="timeline-step completed">
                    <div class="step-node">
                        <i class="fa-solid fa-check"></i>
                    </div>
                    <div class="step-title">Under Review</div>
                    <div class="step-date">Aug 3, 2026</div>
                </div>

                <!-- Step 3 -->
                <div class="timeline-step active">
                    <div class="step-node">
                        <i class="fa-solid fa-video fa-spin-pulse"></i>
                    </div>
                    <div class="step-title">Interview Round</div>
                    <div class="step-date">Aug 10, 2026</div>
                </div>

                <!-- Step 4 -->
                <div class="timeline-step">
                    <div class="step-node">
                        <i class="fa-solid fa-award"></i>
                    </div>
                    <div class="step-title">Decision</div>
                    <div class="step-date">TBA</div>
                </div>
            </div>
        </div>

        <!-- Alert updates & details -->
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="bg-light-primary text-primary p-4 border rounded-3 shadow-sm mb-4 h-100">
                    <h5 class="fw-bold mb-3"><i class="fa-solid fa-circle-exclamation me-2"></i>Shortlist Notice</h5>
                    <p class="fs-7 text-dark opacity-90 mb-3">Congratulations! TechSphere Solutions recruitment coordinators have reviewed your credentials, resume, and cover letter, and have invited you to join the technical interview stage.</p>

                    <div class="bg-white border rounded-3 p-3 text-secondary mb-3">
                        <h6 class="fw-bold text-secondary mb-2"><i class="fa-regular fa-calendar me-2"></i>Interview Schedule Details</h6>
                        <div class="row fs-7 gy-2">
                            <div class="col-sm-6"><strong>Date:</strong> August 10, 2026</div>
                            <div class="col-sm-6"><strong>Time:</strong> 10:00 AM - 10:45 AM EST</div>
                            <div class="col-sm-6"><strong>Mode:</strong> Video Conference Call</div>
                            <div class="col-sm-6"><strong>Coordinator:</strong> Sarah Carter (HR Lead)</div>
                        </div>
                    </div>

                    <div class="d-flex gap-2 flex-wrap">
                        <a href="#" class="btn btn-primary btn-sm px-4 rounded-3" onclick="alert('Google Meet link loading... (Demo only)')"><i class="fa-solid fa-video me-2"></i>Join Video Call</a>
                        <a href="#" class="btn btn-outline-secondary btn-sm px-3 rounded-3" onclick="alert('Interview rescheduled requested. HR will contact you shortly.')">Reschedule Request</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                    <h5 class="fw-bold text-secondary mb-3">Next Step Checklist</h5>
                    <div class="d-flex gap-3 mb-3 border-bottom pb-2">
                        <i class="fa-regular fa-circle-check text-success fa-lg mt-1"></i>
                        <div class="fs-8 text-muted"><strong>Resume Screened:</strong> Passed successfully. Core skill sets checked.</div>
                    </div>
                    <div class="d-flex gap-3 mb-3 border-bottom pb-2">
                        <i class="fa-solid fa-spinner text-primary fa-spin fa-lg mt-1"></i>
                        <div class="fs-8 text-muted"><strong>Technical Call:</strong> Prepare basic JavaScript concepts, CSS grids, and CSS preprocessor methods.</div>
                    </div>
                    <div class="d-flex gap-3">
                        <i class="fa-regular fa-circle text-muted fa-lg mt-1"></i>
                        <div class="fs-8 text-muted"><strong>Review Board Decision:</strong> Letter of Intent or rejection details will compile in 48 hours post interview.</div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

