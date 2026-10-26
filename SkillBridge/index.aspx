<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SkillBridge.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Main Container Partition -->
    <main class="main-container">

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-orb hero-orb-1"></div>
            <div class="hero-orb hero-orb-2"></div>
            <div class="container py-4">
                <div class="row align-items-center gy-5">
                    
                    <!-- Left Hero Content -->
                    <div class="col-lg-6" style="position: relative; z-index: 5;">
                        <div class="d-inline-flex align-items-center gap-2 px-3 py-1.5 rounded-pill mb-3 shadow-sm" style="background: rgba(56, 189, 248, 0.12); border: 1px solid rgba(56, 189, 248, 0.25);">
                            <i class="fa-solid fa-sparkles text-accent"></i>
                            <span class="fs-8 fw-semibold text-white">#1 Platform for Verified Student Internships</span>
                        </div>

                        <h1 class="hero-title mb-4">Kickstart Your <span class="text-accent">Career</span> with the Best Internships</h1>
                        <p class="hero-subtitle mb-4">Connect with verified companies, apply with one click, and track your interview progress in real time. Your dream opportunity is closer than ever.</p>
                        
                        <div class="d-flex flex-wrap gap-3 mb-4">
                            <a href="internship-list.aspx" class="btn btn-primary btn-lg px-4 py-3 shadow-sm fw-semibold"><i class="fa-solid fa-magnifying-glass me-2"></i>Explore Openings</a>
                            <a href="about.aspx" class="btn btn-outline-light btn-lg px-4 py-3 fw-semibold">Learn More</a>
                        </div>

                        <!-- Popular Searches -->
                        <div class="popular-tags">
                            <span class="me-2 fs-8 text-light opacity-75">Trending Searches:</span>
                            <a href="internship-list.aspx?search=Remote" class="me-2 mb-2">Remote</a>
                            <a href="internship-list.aspx?search=Frontend" class="me-2 mb-2">Frontend</a>
                            <a href="internship-list.aspx?search=Figma" class="me-2 mb-2">UI/UX</a>
                            <a href="internship-list.aspx?search=React" class="me-2 mb-2">React</a>
                            <a href="internship-list.aspx?search=Python" class="me-2 mb-2">Python</a>
                        </div>
                    </div>

                    <!-- Right Hero Search Card -->
                    <div class="col-lg-6" style="position: relative; z-index: 5;">
                        <div class="hero-search-card">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-white fw-bold mb-0"><i class="fa-solid fa-filter me-2 text-accent"></i>Quick Internship Search</h4>
                                <span class="badge bg-primary-subtle text-accent border border-accent-subtle rounded-pill px-2.5 py-1 fs-9">Live Feed</span>
                            </div>
                            <p class="text-muted fs-8 mb-4">Filter thousands of active positions across global employers</p>

                            <form action="internship-list.aspx" method="GET">
                                <div class="mb-3">
                                    <label class="form-label text-light fs-8 fw-semibold mb-1">Keywords / Role</label>
                                    <div class="input-group hero-input-group">
                                        <span class="input-group-text bg-transparent border-0 text-accent"><i class="fa-solid fa-briefcase"></i></span>
                                        <input type="text" name="search" class="form-control" placeholder="e.g. Frontend, UI Designer, Python">
                                    </div>
                                </div>

                                <div class="row g-3 mb-3">
                                    <div class="col-sm-6">
                                        <label class="form-label text-light fs-8 fw-semibold mb-1">Category</label>
                                        <div class="input-group hero-input-group">
                                            <span class="input-group-text bg-transparent border-0 text-accent"><i class="fa-solid fa-layer-group"></i></span>
                                            <select name="category" class="form-select">
                                                <option value="">All Categories</option>
                                                <option value="development">Development</option>
                                                <option value="design">UI/UX Design</option>
                                                <option value="marketing">Marketing</option>
                                                <option value="data">Data Science</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label text-light fs-8 fw-semibold mb-1">Location</label>
                                        <div class="input-group hero-input-group">
                                            <span class="input-group-text bg-transparent border-0 text-accent"><i class="fa-solid fa-location-dot"></i></span>
                                            <input type="text" name="location" class="form-control" placeholder="e.g. Remote, NY">
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-accent text-dark w-100 fw-bold py-3 shadow-sm mt-2">
                                    <i class="fa-solid fa-magnifying-glass me-2"></i>Find Internships Now
                                </button>
                            </form>

                            <div class="d-flex align-items-center justify-content-between mt-3 pt-3 border-top border-secondary border-opacity-25 text-muted fs-9">
                                <span><i class="fa-solid fa-shield-halved text-success me-1"></i>100% Verified Companies</span>
                                <span><i class="fa-solid fa-bolt text-warning me-1"></i>Instant 1-Click Apply</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Key Metrics Section -->
        <section class="py-5 bg-white border-bottom">
            <div class="container reveal">
                <div class="row g-4">
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card-main">
                            <div class="stat-icon-wrapper">
                                <i class="fa-solid fa-briefcase"></i>
                            </div>
                            <h2 class="fw-extrabold text-secondary stat-number"><asp:Label ID="lblInternshipCount" runat="server" Text="0" /></h2>
                            <p class="text-muted mb-0 font-weight-500">Total Internships</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card-main">
                            <div class="stat-icon-wrapper" style="background-color: rgba(5, 150, 105, 0.08); color: var(--success);">
                                <i class="fa-solid fa-building"></i>
                            </div>
                            <h2 class="fw-extrabold text-secondary stat-number"><asp:Label ID="lblCompanyCount" runat="server" Text="0" /></h2>
                            <p class="text-muted mb-0 font-weight-500">Partner Companies</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card-main">
                            <div class="stat-icon-wrapper" style="background-color: rgba(56, 189, 248, 0.12); color: #0284C7;">
                                <i class="fa-solid fa-user-graduate"></i>
                            </div>
                            <h2 class="fw-extrabold text-secondary stat-number"><asp:Label ID="lblStudentCount" runat="server" Text="0" /></h2>
                            <p class="text-muted mb-0 font-weight-500">Active Students</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card-main">
                            <div class="stat-icon-wrapper" style="background-color: rgba(217, 119, 6, 0.08); color: var(--warning);">
                                <i class="fa-solid fa-hand-holding-dollar"></i>
                            </div>
                            <h2 class="fw-extrabold text-secondary stat-number"><asp:Label ID="lblApplicationCount" runat="server" Text="0" /></h2>
                            <p class="text-muted mb-0 font-weight-500">Total Applications</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Hiring Partners Marquee -->
        <section class="py-5 bg-light">
            <div class="container reveal">
                <h3 class="section-title-center">Top Hiring Partners</h3>
                <p class="text-center text-muted mb-4">Get hired by industry-leading organizations collaborating directly with our portal</p>

                <div class="marquee-container">
                    <div class="marquee-content">
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-google fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-microsoft fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-amazon fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-meta fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-spotify fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-apple fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-github fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-slack fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-uber fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-stripe fa-2x text-muted"></i></div>
                    </div>
                    <!-- Duplicate for seamless scroll -->
                    <div class="marquee-content" aria-hidden="true">
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-google fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-microsoft fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-amazon fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-meta fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-spotify fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-apple fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-github fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-slack fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-uber fa-2x text-muted"></i></div>
                        <div class="company-logo-card-marquee"><i class="fa-brands fa-stripe fa-2x text-muted"></i></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Browse by Industry Category -->
        <section class="py-5 bg-white border-bottom">
            <div class="container reveal">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end mb-4 gap-3">
                    <div>
                        <h3 class="section-title mb-1">Explore by Category</h3>
                        <p class="text-muted mb-0">Browse specialized domains tailored to your academic background</p>
                    </div>
                    <a href="internship-list.aspx" class="btn btn-outline-primary btn-sm">All Categories <i class="fa-solid fa-arrow-right ms-1"></i></a>
                </div>

                <div class="row g-4">
                    <!-- Category 1 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkDevelopment" runat="server" NavigateUrl="~/internship-list.aspx?search=Development" CssClass="category-card">
                            <div class="category-icon-box bg-light-primary text-primary">
                                <i class="fa-solid fa-laptop-code"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">Software & Engineering</h5>
                            <p class="text-muted fs-8 mb-3">Frontend, Backend, Mobile Apps, Cloud & Full Stack</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>340+ Open Positions</span>
                        </asp:HyperLink>
                    </div>

                    <!-- Category 2 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkDesign" runat="server" NavigateUrl="~/internship-list.aspx?search=Design" CssClass="category-card">
                            <div class="category-icon-box bg-light-success text-success">
                                <i class="fa-solid fa-palette"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">UI/UX & Product Design</h5>
                            <p class="text-muted fs-8 mb-3">Figma, Wireframing, User Research & Prototyping</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>180+ Open Positions</span>
                        </asp:HyperLink>
                    </div>

                    <!-- Category 3 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkData" runat="server" NavigateUrl="~/internship-list.aspx?search=Data" CssClass="category-card">
                            <div class="category-icon-box bg-light-info text-info">
                                <i class="fa-solid fa-brain"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">Data Science & AI</h5>
                            <p class="text-muted fs-8 mb-3">Machine Learning, Python, Analytics & Business Intelligence</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>140+ Open Positions</span>
                        </asp:HyperLink>
                    </div>

                    <!-- Category 4 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkMarketing" runat="server" NavigateUrl="~/internship-list.aspx?search=Marketing" CssClass="category-card">
                            <div class="category-icon-box bg-light-warning text-warning">
                                <i class="fa-solid fa-chart-line"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">Digital Marketing & Growth</h5>
                            <p class="text-muted fs-8 mb-3">SEO, Social Media, Content Strategy & Performance Ads</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>120+ Open Positions</span>
                        </asp:HyperLink>
                    </div>

                    <!-- Category 5 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkFinance" runat="server" NavigateUrl="~/internship-list.aspx?search=Finance" CssClass="category-card">
                            <div class="category-icon-box bg-light-primary text-primary">
                                <i class="fa-solid fa-building-columns"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">Finance & Business Ops</h5>
                            <p class="text-muted fs-8 mb-3">Financial Modeling, Strategy, Auditing & Market Research</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>95+ Open Positions</span>
                        </asp:HyperLink>
                    </div>

                    <!-- Category 6 -->
                    <div class="col-lg-4 col-md-6">
                        <asp:HyperLink ID="lnkHR" runat="server" NavigateUrl="~/internship-list.aspx?search=HR" CssClass="category-card">
                            <div class="category-icon-box bg-light-success text-success">
                                <i class="fa-solid fa-users"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">Human Resources & Talent</h5>
                            <p class="text-muted fs-8 mb-3">Recruiting, People Ops, Employee Engagement & Culture</p>
                            <span class="category-count"><i class="fa-solid fa-circle-dot text-success me-1"></i>75+ Open Positions</span>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </section>

        <!-- Latest Internships Grid -->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end mb-4 gap-3">
                    <div>
                        <h3 class="section-title mb-1">Latest Featured Internships</h3>
                        <p class="text-muted mb-0">High-priority positions with verified stipends and active response rates</p>
                    </div>
                    <a href="internship-list.aspx" class="btn btn-outline-primary btn-sm">View All Openings <i class="fa-solid fa-arrow-right ms-1"></i></a>
                </div>

                <!-- Filter Category Pills -->
                <div class="d-flex justify-content-start gap-2 mb-4 flex-wrap reveal">
                    <button type="button" class="btn btn-filter active" data-filter="all">All Fields</button>
                    <button type="button" class="btn btn-filter" data-filter="development"><i class="fa-solid fa-laptop-code me-2"></i>Development</button>
                    <button type="button" class="btn btn-filter" data-filter="design"><i class="fa-solid fa-palette me-2"></i>Design</button>
                    <button type="button" class="btn btn-filter" data-filter="marketing"><i class="fa-solid fa-chart-line me-2"></i>Marketing</button>
                </div>

                <div class="row g-4" id="internship-list-row">
                    <asp:DataList ID="dlInternships" runat="server"
                        RepeatColumns="3"
                        RepeatDirection="Horizontal"
                        RepeatLayout="Flow"
                        CssClass="w-100">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6 col-filter-item reveal"
                                data-department='<%# Eval("Department") %>'
                                data-title='<%# Eval("Title") %>'
                                data-skills='<%# Eval("RequiredSkills") %>'>
                                <div class="card-premium h-100 p-4 d-flex flex-column">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div>
                                            <span class="badge bg-light-primary text-primary px-3 py-1.5 rounded-3">
                                                <%# Eval("Department") %>
                                            </span>
                                            <span class="text-muted fs-8 ms-2">
                                                <i class="fa-solid fa-clock me-1"></i>
                                                <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                                            </span>
                                        </div>
                                        <button type="button" class="btn-bookmark btn border-0 p-0" aria-label="Bookmark Internship">
                                            <i class="fa-regular fa-bookmark fs-5"></i>
                                        </button>
                                    </div>

                                    <h5 class="card-title fw-bold mb-1">
                                        <a href='<%# "internship-details.aspx?InternshipID=" + Eval("InternshipID") %>' class="text-secondary">
                                            <%# Eval("Title") %>
                                        </a>
                                    </h5>

                                    <p class="text-primary fw-medium mb-3">
                                        <i class="fa-solid fa-building me-1"></i>
                                        <%# Eval("CompanyName") %>
                                        <i class="fa-solid fa-circle-check text-success ms-1 fs-9"></i>
                                    </p>

                                    <p class="text-muted fs-8 mb-3"><%# Eval("Description") %></p>

                                    <div class="mb-4">
                                        <span class="badge-skill me-1 mb-1"><%# Eval("RequiredSkills") %></span>
                                    </div>

                                    <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
                                        <div>
                                            <span class="d-block text-muted fs-9">STIPEND</span>
                                            <span class="fw-bold text-secondary"><%# Eval("Stipend") %></span>
                                        </div>
                                        <a href='<%# "internship-details.aspx?InternshipID=" + Eval("InternshipID") %>'
                                            class="btn btn-primary btn-sm px-3 rounded-2 shadow-sm">Apply Now</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </section>

        <!-- Why SkillBridge Features -->
        <section class="py-5 bg-white border-top border-bottom">
            <div class="container reveal">
                <h3 class="section-title-center">Why SkillBridge?</h3>
                <p class="text-center text-muted mb-5">We provide the most transparent, trusted, and efficient internship portal</p>
                
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6">
                        <div class="feature-box text-center">
                            <div class="feature-box-icon bg-light-primary text-primary mx-auto">
                                <i class="fa-solid fa-shield-halved"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-2">100% Verified</h5>
                            <p class="text-muted fs-8 mb-0">Every hiring partner and internship posting is thoroughly vetted for legitimacy and competitive stipends.</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="feature-box text-center">
                            <div class="feature-box-icon bg-light-success text-success mx-auto">
                                <i class="fa-solid fa-route"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-2">Real-Time Tracking</h5>
                            <p class="text-muted fs-8 mb-0">Track every step—from application review, to technical interviews, to official offer releases on your console.</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="feature-box text-center">
                            <div class="feature-box-icon bg-light-info text-info mx-auto">
                                <i class="fa-solid fa-wand-magic-sparkles"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-2">Skill Matching</h5>
                            <p class="text-muted fs-8 mb-0">Our smart algorithm compares your profile skills with job requirements to surface positions where you stand out.</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="feature-box text-center">
                            <div class="feature-box-icon bg-light-warning text-warning mx-auto">
                                <i class="fa-solid fa-bolt"></i>
                            </div>
                            <h5 class="fw-bold text-secondary mb-2">1-Click Apply</h5>
                            <p class="text-muted fs-8 mb-0">Save your resume and portfolio once, then apply to multiple top companies effortlessly in seconds.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- How It Works Section -->
        <section class="py-5 bg-light">
            <div class="container reveal">
                <h3 class="section-title-center">How It Works</h3>
                <p class="text-center text-muted mb-4">A simple, streamlined three-step workflow for students and hiring partners</p>

                <!-- Interactive Tabs -->
                <div class="d-flex justify-content-center mb-5">
                    <div class="nav nav-pills p-1 rounded-pill shadow-sm border border-light" id="howItWorksTabs" role="tablist">
                        <button class="nav-link active rounded-pill px-4 py-2" id="student-tab" data-bs-toggle="pill" data-bs-target="#tab-students" type="button" role="tab" aria-selected="true">
                            <i class="fa-solid fa-user-graduate me-2"></i>For Students
                        </button>
                        <button class="nav-link rounded-pill px-4 py-2" id="employer-tab" data-bs-toggle="pill" data-bs-target="#tab-employers" type="button" role="tab" aria-selected="false">
                            <i class="fa-solid fa-building me-2"></i>For Employers
                        </button>
                    </div>
                </div>

                <div class="tab-content" id="howItWorksTabContent">
                    <!-- Tab 1: Students -->
                    <div class="tab-pane fade show active" id="tab-students" role="tabpanel" aria-labelledby="student-tab">
                        <div class="row g-4 text-center">
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-primary text-primary border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">1</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Create Profile</h5>
                                    <p class="text-muted fs-8 mb-0">Register as a student, list your skills checklist, add your college information, and upload your PDF Resume.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-primary text-primary border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">2</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Apply with 1-Click</h5>
                                    <p class="text-muted fs-8 mb-0">Explore filterable positions, view match ratings, and submit direct applications with zero friction.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-primary text-primary border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">3</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Track & Get Hired</h5>
                                    <p class="text-muted fs-8 mb-0">Receive instant interview alerts, track review stages, and accept official digital offer letters.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tab 2: Employers -->
                    <div class="tab-pane fade" id="tab-employers" role="tabpanel" aria-labelledby="employer-tab">
                        <div class="row g-4 text-center">
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-success text-success border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">1</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Post Opportunities</h5>
                                    <p class="text-muted fs-8 mb-0">Register your corporate account and publish detailed internship openings with requirements and stipends.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-success text-success border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">2</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Screen Candidates</h5>
                                    <p class="text-muted fs-8 mb-0">Review student resumes, evaluate skill tags, and shortlist candidates from a unified dashboard.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
                                    <div class="bg-light-success text-success border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                        <span class="fs-4 fw-bold">3</span>
                                    </div>
                                    <h5 class="fw-bold text-secondary mb-2">Onboard Top Talent</h5>
                                    <p class="text-muted fs-8 mb-0">Issue offer approvals, coordinate onboarding timelines, and grow your talent pipeline seamlessly.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="py-5 bg-white border-bottom">
            <div class="container reveal">
                <h3 class="section-title-center">Student Success Stories</h3>
                <p class="text-center text-muted mb-5">Hear how students secured positions at leading tech firms through SkillBridge</p>

                <div class="row g-4">
                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial-card h-100">
                            <i class="fa-solid fa-quote-right testimonial-quote"></i>
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div style="width: 48px; height: 48px; background: rgba(37, 99, 235, 0.1);" class="rounded-circle d-flex align-items-center justify-content-center text-primary fw-bold">
                                    SJ
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-secondary">Sarah Jenkins</h6>
                                    <span class="fs-8 text-primary fw-medium"><i class="fa-solid fa-building me-1"></i>Web Developer @ Spotify</span>
                                </div>
                            </div>
                            <div class="text-warning mb-2 fs-8">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <p class="text-muted fs-8 mb-0">"The application tracking timeline gave me complete visibility. I knew exactly when Spotify reviewed my resume, allowing me to prepare for interviews with confidence."</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial-card h-100">
                            <i class="fa-solid fa-quote-right testimonial-quote"></i>
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div style="width: 48px; height: 48px; background: rgba(5, 150, 105, 0.1);" class="rounded-circle d-flex align-items-center justify-content-center text-success fw-bold">
                                    DL
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-secondary">David Lee</h6>
                                    <span class="fs-8 text-success fw-medium"><i class="fa-solid fa-building me-1"></i>UI Designer @ Google</span>
                                </div>
                            </div>
                            <div class="text-warning mb-2 fs-8">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <p class="text-muted fs-8 mb-0">"The skill recommendation system directly matched me with UI openings that fit my Figma skillset. I secured an interview within 5 days of creating my account."</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial-card h-100">
                            <i class="fa-solid fa-quote-right testimonial-quote"></i>
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div style="width: 48px; height: 48px; background: rgba(56, 189, 248, 0.15);" class="rounded-circle d-flex align-items-center justify-content-center text-info fw-bold">
                                    ER
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-secondary">Elena Rostova</h6>
                                    <span class="fs-8 text-info fw-medium"><i class="fa-solid fa-building me-1"></i>Marketing Intern @ Amazon</span>
                                </div>
                            </div>
                            <div class="text-warning mb-2 fs-8">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <p class="text-muted fs-8 mb-0">"As an international student, having verified listings with guaranteed stipends saved me hundreds of hours compared to generic job portals."</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call To Action Section -->
        <section class="container my-5">
            <div class="cta-section text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="mb-3">Ready to Accelerate Your Career?</h2>
                        <p class="text-light opacity-75 mb-4">Create your free account today as a student to explore exclusive opportunities, or register as an employer partner to recruit top student talent.</p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="register.aspx" class="btn btn-white bg-white text-primary btn-lg px-4 py-3 fw-bold shadow-sm">Sign Up as Student</a>
                            <a href="register.aspx?type=company" class="btn btn-outline-light btn-lg px-4 py-3 fw-bold">Register as Company</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

