<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="recommendation.aspx.cs" Inherits="SkillBridge.student.recommendation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="student-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Recommendations</li>
            </ol>
        </nav>

        <!-- Dynamic Page Welcome Title -->
        <div class="mb-4">
            <h2 class="fw-bold text-secondary mb-1"><i class="fa-solid fa-sparkles text-primary me-2 animate-pulse"></i>Recommended Openings</h2>
            <p class="text-muted mb-0">These positions match your active profile skills checklist: <span class="badge bg-light-primary text-primary">HTML5</span> <span class="badge bg-light-primary text-primary">CSS3</span> <span class="badge bg-light-primary text-primary">JavaScript</span> <span class="badge bg-light-primary text-primary">Bootstrap</span>.</p>
        </div>

        <!-- Grid Cards Recommendations -->
        <div class="row g-4">
            <!-- Card 1 (95% Match) -->
            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4 d-flex flex-column border-primary position-relative overflow-hidden" style="border-width: 1px;">
                    <!-- Match Badge Overlay -->
                    <div class="position-absolute" style="top: 0; right: 0;">
                        <div class="bg-primary text-white fs-9 fw-bold px-3 py-1.5 rounded-bottom-start shadow-sm"><i class="fa-solid fa-fire me-1"></i>95% Match</div>
                    </div>

                    <div class="d-flex align-items-center gap-3 mb-3 mt-2">
                        <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; flex-shrink: 0;">
                            <i class="fa-solid fa-laptop-code text-primary fa-lg"></i>
                        </div>
                        <div>
                            <h5 class="card-title fw-bold mb-0">Frontend Developer</h5>
                            <span class="text-muted fs-8">TechSphere Solutions</span>
                        </div>
                    </div>

                    <p class="text-muted fs-8 mb-3">Excellent alignment with your profile details. TechSphere is looking for basic JavaScript capabilities and custom Bootstrap layout builds.</p>

                    <div class="mb-3">
                        <span class="badge-skill me-1 mb-1 bg-success text-white">HTML5</span>
                        <span class="badge-skill me-1 mb-1 bg-success text-white">CSS3</span>
                        <span class="badge-skill me-1 mb-1 bg-success text-white">JavaScript</span>
                        <span class="badge-skill me-1 mb-1 bg-success text-white">Bootstrap</span>
                    </div>

                    <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
                        <div>
                            <span class="d-block text-muted fs-9">STIPEND</span>
                            <span class="fw-bold text-secondary fs-8">$1,200/mo</span>
                        </div>
                        <a href="../internship-list.aspx" class="btn btn-primary btn-sm px-3 rounded-2 shadow-sm">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 2 (80% Match) -->
            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4 d-flex flex-column position-relative overflow-hidden">
                    <div class="position-absolute" style="top: 0; right: 0;">
                        <div class="bg-success text-white fs-9 fw-bold px-3 py-1.5 rounded-bottom-start shadow-sm"><i class="fa-solid fa-bolt me-1"></i>80% Match</div>
                    </div>

                    <div class="d-flex align-items-center gap-3 mb-3 mt-2">
                        <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; flex-shrink: 0;">
                            <i class="fa-solid fa-palette text-success fa-lg"></i>
                        </div>
                        <div>
                            <h5 class="card-title fw-bold mb-0">UI/UX Designer</h5>
                            <span class="text-muted fs-8">FigmaLab Studios</span>
                        </div>
                    </div>

                    <p class="text-muted fs-8 mb-3">High skill match: CSS3 layout components structure. Note that this role also requests Figma wireframing experience.</p>

                    <div class="mb-3">
                        <span class="badge-skill me-1 mb-1 bg-success text-white">HTML5</span>
                        <span class="badge-skill me-1 mb-1 bg-success text-white">CSS3</span>
                        <span class="badge-skill me-1 mb-1 bg-danger-subtle text-danger"><i class="fa-solid fa-circle-exclamation me-1"></i>Figma</span>
                    </div>

                    <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
                        <div>
                            <span class="d-block text-muted fs-9">STIPEND</span>
                            <span class="fw-bold text-secondary fs-8">$1,400/mo</span>
                        </div>
                        <a href="../internship-list.aspx" class="btn btn-primary btn-sm px-3 rounded-2 shadow-sm">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 3 (75% Match) -->
            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4 d-flex flex-column position-relative overflow-hidden">
                    <div class="position-absolute" style="top: 0; right: 0;">
                        <div class="bg-warning text-white fs-9 fw-bold px-3 py-1.5 rounded-bottom-start shadow-sm"><i class="fa-solid fa-check me-1"></i>75% Match</div>
                    </div>

                    <div class="d-flex align-items-center gap-3 mb-3 mt-2">
                        <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; flex-shrink: 0;">
                            <i class="fa-solid fa-code text-info fa-lg"></i>
                        </div>
                        <div>
                            <h5 class="card-title fw-bold mb-0">Software Intern</h5>
                            <span class="text-muted fs-8">Stripe Inc.</span>
                        </div>
                    </div>

                    <p class="text-muted fs-8 mb-3">Matches your JavaScript programming knowledge. The role also requires backend scripting scripts like Python/SQL.</p>

                    <div class="mb-3">
                        <span class="badge-skill me-1 mb-1 bg-success text-white">JavaScript</span>
                        <span class="badge-skill me-1 mb-1 bg-danger-subtle text-danger"><i class="fa-solid fa-circle-exclamation me-1"></i>Python</span>
                        <span class="badge-skill me-1 mb-1 bg-danger-subtle text-danger"><i class="fa-solid fa-circle-exclamation me-1"></i>SQL</span>
                    </div>

                    <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
                        <div>
                            <span class="d-block text-muted fs-9">STIPEND</span>
                            <span class="fw-bold text-secondary fs-8">$1,500/mo</span>
                        </div>
                        <a href="../internship-list.aspx" class="btn btn-primary btn-sm px-3 rounded-2 shadow-sm">Apply Now</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

