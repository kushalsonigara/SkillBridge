<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="internship-list.aspx.cs" Inherits="SkillBridge.internship_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Main Container Partition -->
    <main class="main-container">
        <!-- Page Header -->
        <section class="page-header-bg text-center mb-5">
            <div class="container">
                <h1 class="mb-3">Explore Opportunities</h1>
                <p class="mb-0 text-accent fs-6">Find and apply to matching industry positions in technology, creative design, and administration</p>
            </div>
        </section>

        <!-- Main Directory Section -->
        <section class="pb-5 flex-grow-1 reveal">
            <div class="container">
                <div class="row g-4">

                    <!-- Filters Sidebar Column -->
                    <div class="col-lg-4 col-md-5">
                        <div class="form-card p-4 shadow-sm position-sticky" style="top: 100px;">
                            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                <h5 class="fw-bold text-secondary mb-0"><i class="fa-solid fa-sliders text-primary me-2"></i>Filter Panel</h5>
                                <a href="internship-list.html" class="fs-8 fw-semibold text-danger">Reset All</a>
                            </div>

                            <form action="internship-list.html" method="GET" onsubmit="event.preventDefault(); alert('Filters applied! (Demo only)')">
                                <!-- Search Keyword -->
                                <div class="mb-3">
                                    <label class="form-label form-label-custom">Keyword Search</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white"><i class="fa-solid fa-magnifying-glass text-muted fs-8"></i></span>
                                        <input type="text" class="form-control form-control-custom border-start-0 ps-1" placeholder="e.g. Developer, Designer">
                                    </div>
                                </div>

                                <!-- Location select -->
                                <div class="mb-3">
                                    <label class="form-label form-label-custom">Location</label>
                                    <select class="form-select form-control-custom">
                                        <option value="">All Locations</option>
                                        <option value="remote">Remote</option>
                                        <option value="ny">New York, NY</option>
                                        <option value="sf">San Francisco, CA</option>
                                        <option value="ch">Chicago, IL</option>
                                    </select>
                                </div>

                                <!-- Skills Checklist -->
                                <div class="mb-3">
                                    <label class="form-label form-label-custom">Skills Checklist</label>
                                    <div class="form-check fs-8 mb-2">
                                        <input class="form-check-input" type="checkbox" id="check-html" checked>
                                        <label class="form-check-label text-muted" for="check-html">HTML5 / CSS3</label>
                                    </div>
                                    <div class="form-check fs-8 mb-2">
                                        <input class="form-check-input" type="checkbox" id="check-js" checked>
                                        <label class="form-check-label text-muted" for="check-js">JavaScript</label>
                                    </div>
                                    <div class="form-check fs-8 mb-2">
                                        <input class="form-check-input" type="checkbox" id="check-figma">
                                        <label class="form-check-label text-muted" for="check-figma">Figma / Wireframing</label>
                                    </div>
                                    <div class="form-check fs-8 mb-2">
                                        <input class="form-check-input" type="checkbox" id="check-python">
                                        <label class="form-check-label text-muted" for="check-python">Python / Data Analytics</label>
                                    </div>
                                </div>

                                <!-- Duration -->
                                <div class="mb-3">
                                    <label class="form-label form-label-custom">Duration</label>
                                    <select class="form-select form-control-custom">
                                        <option value="">Any Duration</option>
                                        <option value="3">3 Months</option>
                                        <option value="6">6 Months</option>
                                    </select>
                                </div>

                                <!-- Company Partner -->
                                <div class="mb-4">
                                    <label class="form-label form-label-custom">Company Partner</label>
                                    <input type="text" class="form-control form-control-custom" placeholder="e.g. Stripe, FigmaLab">
                                </div>

                                <button type="submit" class="btn btn-primary w-100 py-2"><i class="fa-solid fa-filter me-2"></i>Apply Filters</button>
                            </form>
                        </div>
                    </div>

                    <!-- Internship Cards Grid Column (Feed) -->
                    <div class="col-lg-8 col-md-7">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <span class="text-muted fs-7">Showing <strong>3</strong> Positions</span>
                            <div class="d-flex align-items-center gap-2">
                                <span class="fs-8 text-muted text-nowrap">Sort By</span>
                                <select class="form-select form-select-sm fs-8 border-light bg-white rounded-3">
                                    <option value="recent">Most Recent</option>
                                    <option value="stipend">Highest Stipend</option>
                                    <option value="deadline">Upcoming Deadline</option>
                                </select>
                            </div>
                        </div>

                        <div class="d-flex flex-column gap-3" id="job-feed-list">
                            <!-- Internship Card 1 -->
                            <div class="card-premium p-4 job-item-card mb-4">
                                <div class="d-flex gap-3 mb-3">
                                    <!-- Logo -->
                                    <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center flex-shrink-0" style="width: 60px; height: 60px;">
                                        <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
                                    </div>

                                    <!-- Main Body -->
                                    <div class="flex-grow-1 min-width-0">
                                        <div class="d-flex justify-content-between align-items-start gap-2">
                                            <h5 class="fw-bold text-secondary mb-1 text-truncate">Frontend Developer Intern</h5>
                                            <button class="btn-bookmark btn border-0 p-0 text-muted" aria-label="Bookmark Internship">
                                                <i class="fa-regular fa-bookmark fs-5"></i>
                                            </button>
                                        </div>

                                        <div class="d-flex align-items-center gap-2 flex-wrap mb-2">
                                            <span class="text-primary fw-semibold fs-7"><i class="fa-solid fa-building me-1"></i>TechSphere Solutions</span>
                                            <span class="badge bg-light-primary text-primary px-2 py-0.5 rounded-2 fs-9"><i class="fa-solid fa-location-dot me-1 animate-icon-pin"></i>Remote</span>
                                        </div>

                                        <p class="text-muted fs-8 mb-3 leading-relaxed">Assist the development team in writing clean responsive styles and implementing UI mockups. You will collaborate on core frontend feature architectures, integrate RESTful API outputs, and design modern landing profiles for business applications.</p>

                                        <div class="d-flex flex-wrap gap-1">
                                            <span class="badge-skill">HTML5/CSS3</span>
                                            <span class="badge-skill">JavaScript</span>
                                            <span class="badge-skill">Bootstrap</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Divider and Footer info -->
                                <div class="border-top pt-3 d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                                    <!-- Left: Info Bar -->
                                    <div class="d-flex flex-wrap gap-3 fs-8 text-muted">
                                        <span class="d-inline-flex align-items-center"><i class="fa-solid fa-hand-holding-dollar text-primary me-1.5 animate-icon-stipend"></i><strong>$1,200</strong>/mo</span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-clock text-primary me-1.5"></i><strong>3 Months</strong></span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-calendar-days text-primary me-1.5 animate-icon-calendar"></i>Deadline: <strong>Aug 15, 2026</strong></span>
                                    </div>

                                    <!-- Right: Action Buttons -->
                                    <div class="d-flex gap-2 justify-content-end">
                                        <a href="apply.html" class="btn btn-outline-secondary btn-sm px-3 rounded-3 fs-8 py-2">View Details</a>
                                        <button class="btn btn-primary btn-sm px-4 rounded-3 shadow-sm fs-8 py-2" onclick="openQuickApply('Frontend Developer Intern', 'TechSphere Solutions')">Apply Now</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Internship Card 2 -->
                            <div class="card-premium p-4 job-item-card mb-4">
                                <div class="d-flex gap-3 mb-3">
                                    <!-- Logo -->
                                    <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center flex-shrink-0" style="width: 60px; height: 60px;">
                                        <i class="fa-solid fa-palette fa-2x text-success"></i>
                                    </div>

                                    <!-- Main Body -->
                                    <div class="flex-grow-1 min-width-0">
                                        <div class="d-flex justify-content-between align-items-start gap-2">
                                            <h5 class="fw-bold text-secondary mb-1 text-truncate">UI/UX Designer Intern</h5>
                                            <button class="btn-bookmark btn border-0 p-0 text-muted" aria-label="Bookmark Internship">
                                                <i class="fa-regular fa-bookmark fs-5"></i>
                                            </button>
                                        </div>

                                        <div class="d-flex align-items-center gap-2 flex-wrap mb-2">
                                            <span class="text-primary fw-semibold fs-7"><i class="fa-solid fa-building me-1"></i>FigmaLab Studios</span>
                                            <span class="badge bg-light-primary text-primary px-2 py-0.5 rounded-2 fs-9"><i class="fa-solid fa-location-dot me-1 animate-icon-pin"></i>San Francisco</span>
                                        </div>

                                        <p class="text-muted fs-8 mb-3 leading-relaxed">Work closely with product managers to design interactive wireframes, user research reports, and test flows. You will maintain our active design systems, build interactive prototypes, and participate in design feedback sessions.</p>

                                        <div class="d-flex flex-wrap gap-1">
                                            <span class="badge-skill">Figma</span>
                                            <span class="badge-skill">Wireframing</span>
                                            <span class="badge-skill">User Research</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Divider and Footer info -->
                                <div class="border-top pt-3 d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                                    <!-- Left: Info Bar -->
                                    <div class="d-flex flex-wrap gap-3 fs-8 text-muted">
                                        <span class="d-inline-flex align-items-center"><i class="fa-solid fa-hand-holding-dollar text-success me-1.5 animate-icon-stipend"></i><strong>$1,400</strong>/mo</span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-clock text-success me-1.5"></i><strong>6 Months</strong></span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-calendar-days text-success me-1.5 animate-icon-calendar"></i>Deadline: <strong>Aug 20, 2026</strong></span>
                                    </div>

                                    <!-- Right: Action Buttons -->
                                    <div class="d-flex gap-2 justify-content-end">
                                        <a href="apply.html" class="btn btn-outline-secondary btn-sm px-3 rounded-3 fs-8 py-2">View Details</a>
                                        <button class="btn btn-primary btn-sm px-4 rounded-3 shadow-sm fs-8 py-2" onclick="openQuickApply('UI/UX Designer Intern', 'FigmaLab Studios')">Apply Now</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Internship Card 3 -->
                            <div class="card-premium p-4 job-item-card mb-4">
                                <div class="d-flex gap-3 mb-3">
                                    <!-- Logo -->
                                    <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center flex-shrink-0" style="width: 60px; height: 60px;">
                                        <i class="fa-solid fa-chart-line fa-2x text-warning"></i>
                                    </div>

                                    <!-- Main Body -->
                                    <div class="flex-grow-1 min-width-0">
                                        <div class="d-flex justify-content-between align-items-start gap-2">
                                            <h5 class="fw-bold text-secondary mb-1 text-truncate">Social Media Marketing Intern</h5>
                                            <button class="btn-bookmark btn border-0 p-0 text-muted" aria-label="Bookmark Internship">
                                                <i class="fa-regular fa-bookmark fs-5"></i>
                                            </button>
                                        </div>

                                        <div class="d-flex align-items-center gap-2 flex-wrap mb-2">
                                            <span class="text-primary fw-semibold fs-7"><i class="fa-solid fa-building me-1"></i>GrowthHack Inc.</span>
                                            <span class="badge bg-light-primary text-primary px-2 py-0.5 rounded-2 fs-9"><i class="fa-solid fa-location-dot me-1 animate-icon-pin"></i>Remote</span>
                                        </div>

                                        <p class="text-muted fs-8 mb-3 leading-relaxed">Oversee platform channels, track page interaction logs, write promotional copies, and manage content pipelines. You will write engaging content posts, perform keyword analytics research, and assist on campaign analytics dashboards.</p>

                                        <div class="d-flex flex-wrap gap-1">
                                            <span class="badge-skill">SEO</span>
                                            <span class="badge-skill">Analytics</span>
                                            <span class="badge-skill">Copywriting</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Divider and Footer info -->
                                <div class="border-top pt-3 d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                                    <!-- Left: Info Bar -->
                                    <div class="d-flex flex-wrap gap-3 fs-8 text-muted">
                                        <span class="d-inline-flex align-items-center"><i class="fa-solid fa-hand-holding-dollar text-warning me-1.5 animate-icon-stipend"></i><strong>$1,000</strong>/mo</span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-clock text-warning me-1.5"></i><strong>3 Months</strong></span>
                                        <span class="text-light-border d-none d-sm-inline">|</span>
                                        <span class="d-inline-flex align-items-center"><i class="fa-regular fa-calendar-days text-warning me-1.5 animate-icon-calendar"></i>Deadline: <strong>Aug 25, 2026</strong></span>
                                    </div>

                                    <!-- Right: Action Buttons -->
                                    <div class="d-flex gap-2 justify-content-end">
                                        <a href="apply.html" class="btn btn-outline-secondary btn-sm px-3 rounded-3 fs-8 py-2">View Details</a>
                                        <button class="btn btn-primary btn-sm px-4 rounded-3 shadow-sm fs-8 py-2" onclick="openQuickApply('Social Media Marketing Intern', 'GrowthHack Inc.')">Apply Now</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Custom table style pagination design -->
                            <div class="pagination-custom mt-4">
                                <span class="pagination-info">Showing page <strong>1</strong> of 5 pages</span>
                                <ul class="pagination-pages">
                                    <li class="pagination-page-item disabled"><a href="#" class="pagination-page-link"><i class="fa-solid fa-chevron-left"></i></a></li>
                                    <li class="pagination-page-item active"><a href="#" class="pagination-page-link">1</a></li>
                                    <li class="pagination-page-item"><a href="#" class="pagination-page-link">2</a></li>
                                    <li class="pagination-page-item"><a href="#" class="pagination-page-link">3</a></li>
                                    <li class="pagination-page-item"><a href="#" class="pagination-page-link"><i class="fa-solid fa-chevron-right"></i></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
        </section>

    </main>

</asp:Content>

