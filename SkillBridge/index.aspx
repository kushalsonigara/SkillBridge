<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SkillBridge.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
      <!-- Main Container Partition -->
  <main class="main-container">
    <!-- Hero Banner -->
    <section class="hero-section">
    <div class="hero-orb hero-orb-1"></div>
    <div class="hero-orb hero-orb-2"></div>
    <div class="container py-4">
      <div class="row align-items-center gy-5">
        <div class="col-lg-6" style="position: relative; z-index: 5;">
          <h1 class="hero-title mb-4">Kickstart Your <span class="text-accent">Career</span> with the Best Internships</h1>
          <p class="hero-subtitle mb-4">Connect with verified companies, apply easily, and track your progress in real-time. Your dream internship is just a click away.</p>
          <div class="d-flex gap-3">
            <a href="internship-list.html" class="btn btn-primary btn-lg px-4 shadow"><i class="fa-solid fa-magnifying-glass me-2"></i>Explore Openings</a>
            <a href="about.html" class="btn btn-outline-light btn-lg px-4">Learn More</a>
          </div>
          <div class="popular-tags mt-4">
            <span class="me-2 fs-7 text-light opacity-75">Popular Searches:</span>
            <a href="internship-list.html?search=Remote" class="me-2 mb-2">Remote</a>
            <a href="internship-list.html?search=Figma" class="me-2 mb-2">Figma</a>
            <a href="internship-list.html?search=React" class="me-2 mb-2">React</a>
            <a href="internship-list.html?search=Python" class="me-2 mb-2">Python</a>
          </div>
        </div>
        <div class="col-lg-6" style="position: relative; z-index: 5;">
          <!-- Glassmorphism search form -->
          <div class="search-container-glass">
            <h4 class="text-white mb-3"><i class="fa-solid fa-filter me-2 text-accent"></i>Quick Search</h4>
            <form action="internship-list.html" method="GET">
              <div class="mb-3">
                <label class="form-label text-light fs-7">Keywords / Role</label>
                <div class="input-group">
                  <span class="input-group-text bg-white border-0"><i class="fa-solid fa-briefcase text-muted"></i></span>
                  <input type="text" name="search" class="form-control border-0" placeholder="e.g. Web Developer, UI Designer">
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label text-light fs-7">Location</label>
                <div class="input-group">
                  <span class="input-group-text bg-white border-0"><i class="fa-solid fa-location-dot text-muted"></i></span>
                  <input type="text" name="location" class="form-control border-0" placeholder="e.g. New York, Remote">
                </div>
              </div>
              <div class="mb-4">
                <label class="form-label text-light fs-7">Duration</label>
                <select name="duration" class="form-select border-0">
                  <option value="">Any Duration</option>
                  <option value="3">3 Months</option>
                  <option value="6">6 Months</option>
                </select>
              </div>
              <button type="submit" class="btn btn-accent text-dark w-100 fw-bold py-2 shadow-sm"><i class="fa-solid fa-magnifying-glass me-2"></i>Search Internships</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Statistics Section -->
  <section class="py-5 bg-white border-bottom">
    <div class="container reveal">
      <div class="row g-4">
        <div class="col-md-3 col-sm-6">
          <div class="stat-card-main">
            <div class="stat-icon-wrapper">
              <i class="fa-solid fa-briefcase"></i>
            </div>
            <h2 class="fw-extrabold text-secondary stat-number" data-target="1250" data-suffix="+">0</h2>
            <p class="text-muted mb-0 font-weight-500">Active Internships</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stat-card-main">
            <div class="stat-icon-wrapper">
              <i class="fa-solid fa-building"></i>
            </div>
            <h2 class="fw-extrabold text-secondary stat-number" data-target="320" data-suffix="+">0</h2>
            <p class="text-muted mb-0 font-weight-500">Partner Companies</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stat-card-main">
            <div class="stat-icon-wrapper">
              <i class="fa-solid fa-user-graduate"></i>
            </div>
            <h2 class="fw-extrabold text-secondary stat-number" data-target="4800" data-suffix="+">0</h2>
            <p class="text-muted mb-0 font-weight-500">Placed Students</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stat-card-main">
            <div class="stat-icon-wrapper">
              <i class="fa-solid fa-hand-holding-dollar"></i>
            </div>
            <h2 class="fw-extrabold text-secondary stat-number" data-target="1.5" data-decimals="1" data-prefix="$" data-suffix="k">0</h2>
            <p class="text-muted mb-0 font-weight-500">Avg. Stipend/mo</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Featured Companies -->
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
        </div>
      </div>
    </div>
  </section>

  <!-- Latest Internships -->
  <section class="py-5">
    <div class="container">
      <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end mb-4 gap-3">
        <div>
          <h3 class="section-title mb-0">Latest Internships</h3>
          <p class="text-muted mb-0">New positions published within the last 48 hours</p>
        </div>
        <a href="internship-list.html" class="btn btn-outline-primary btn-sm">View All Openings <i class="fa-solid fa-arrow-right ms-1"></i></a>
      </div>

      <!-- Filter Category Pills -->
      <div class="d-flex justify-content-start gap-2 mb-4 flex-wrap reveal">
        <button class="btn btn-filter active" data-filter="all">All Fields</button>
        <button class="btn btn-filter" data-filter="development"><i class="fa-solid fa-laptop-code me-2"></i>Development</button>
        <button class="btn btn-filter" data-filter="design"><i class="fa-solid fa-palette me-2"></i>Design</button>
        <button class="btn btn-filter" data-filter="marketing"><i class="fa-solid fa-chart-line me-2"></i>Marketing</button>
      </div>

      <div class="row g-4" id="internship-list-row">
        <!-- Card 1 -->
        <div class="col-lg-4 col-md-6 col-filter-item development reveal">
          <div class="card-premium h-100 p-4 d-flex flex-column">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <span class="badge bg-light-primary text-primary px-3 py-2 rounded-3"><i class="fa-solid fa-laptop-code me-1"></i>Development</span>
                <span class="text-muted fs-8 ms-2 d-none d-sm-inline-block"><i class="fa-solid fa-clock me-1"></i>2 days ago</span>
              </div>
              <button class="btn-bookmark btn border-0 p-0" aria-label="Bookmark Internship">
                <i class="fa-regular fa-bookmark fs-5"></i>
              </button>
            </div>
            <h5 class="card-title fw-bold"><a href="apply.html" class="text-dark">Frontend Developer Intern</a></h5>
            <p class="text-primary fw-medium mb-3"><i class="fa-solid fa-building me-1"></i>TechSphere Solutions</p>
            <p class="text-muted fs-7 mb-4">Join our engineering department to design UI components and integrate endpoints. Collaborations with designers using Figma...</p>
            <div class="mb-4">
              <span class="badge-skill me-2 mb-2">HTML5/CSS3</span>
              <span class="badge-skill me-2 mb-2">JavaScript</span>
              <span class="badge-skill me-2 mb-2">Bootstrap</span>
            </div>
            <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
              <div>
                <span class="d-block text-muted fs-8">STIPEND</span>
                <span class="fw-bold text-secondary">$1,200/mo</span>
              </div>
              <a href="apply.html" class="btn btn-primary btn-sm px-3 rounded-3">Apply Now</a>
            </div>
          </div>
        </div>
        <!-- Card 2 -->
        <div class="col-lg-4 col-md-6 col-filter-item design reveal">
          <div class="card-premium h-100 p-4 d-flex flex-column">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <span class="badge bg-light-success text-success px-3 py-2 rounded-3"><i class="fa-solid fa-palette me-1"></i>UI/UX Design</span>
                <span class="text-muted fs-8 ms-2 d-none d-sm-inline-block"><i class="fa-solid fa-clock me-1"></i>3 days ago</span>
              </div>
              <button class="btn-bookmark btn border-0 p-0" aria-label="Bookmark Internship">
                <i class="fa-regular fa-bookmark fs-5"></i>
              </button>
            </div>
            <h5 class="card-title fw-bold"><a href="apply.html" class="text-dark">UI/UX Designer Intern</a></h5>
            <p class="text-primary fw-medium mb-3"><i class="fa-solid fa-building me-1"></i>FigmaLab Studios</p>
            <p class="text-muted fs-7 mb-4">Design product flows, clickable mockups, and run user research sessions for active client projects. Perfect portfolio builder...</p>
            <div class="mb-4">
              <span class="badge-skill me-2 mb-2">Figma</span>
              <span class="badge-skill me-2 mb-2">Wireframing</span>
              <span class="badge-skill me-2 mb-2">User Research</span>
            </div>
            <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
              <div>
                <span class="d-block text-muted fs-8">STIPEND</span>
                <span class="fw-bold text-secondary">$1,400/mo</span>
              </div>
              <a href="apply.html" class="btn btn-primary btn-sm px-3 rounded-3">Apply Now</a>
            </div>
          </div>
        </div>
        <!-- Card 3 -->
        <div class="col-lg-4 col-md-6 col-filter-item marketing reveal">
          <div class="card-premium h-100 p-4 d-flex flex-column">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <span class="badge bg-light-warning text-warning px-3 py-2 rounded-3"><i class="fa-solid fa-chart-line me-1"></i>Marketing</span>
                <span class="text-muted fs-8 ms-2 d-none d-sm-inline-block"><i class="fa-solid fa-clock me-1"></i>4 days ago</span>
              </div>
              <button class="btn-bookmark btn border-0 p-0" aria-label="Bookmark Internship">
                <i class="fa-regular fa-bookmark fs-5"></i>
              </button>
            </div>
            <h5 class="card-title fw-bold"><a href="apply.html" class="text-dark">Social Media Marketing</a></h5>
            <p class="text-primary fw-medium mb-3"><i class="fa-solid fa-building me-1"></i>GrowthHack Inc.</p>
            <p class="text-muted fs-7 mb-4">Lead marketing campaigns, analyze visual engagement statistics, and manage content pipelines for organic lead acquisition...</p>
            <div class="mb-4">
              <span class="badge-skill me-2 mb-2">SEO</span>
              <span class="badge-skill me-2 mb-2">Analytics</span>
              <span class="badge-skill me-2 mb-2">Copywriting</span>
            </div>
            <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">
              <div>
                <span class="d-block text-muted fs-8">STIPEND</span>
                <span class="fw-bold text-secondary">$1,000/mo</span>
              </div>
              <a href="apply.html" class="btn btn-primary btn-sm px-3 rounded-3">Apply Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section class="py-5 bg-white border-top border-bottom">
    <div class="container reveal">
      <h3 class="section-title-center">Why SkillBridge?</h3>
      <p class="text-center text-muted mb-5">We provide the most transparent and advanced internship tracking system</p>
      <div class="row g-4 text-center">
        <div class="col-md-4">
          <div class="p-4">
            <div class="stat-icon-wrapper bg-light-primary text-primary mb-3">
              <i class="fa-solid fa-shield-halved fa-lg"></i>
            </div>
            <h5 class="fw-bold mb-3">Verified Listings</h5>
            <p class="text-muted fs-7">All hiring partners are thoroughly vetted. Rest assured that every internship listed is legitimate and pays competitive stipends.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4">
            <div class="stat-icon-wrapper bg-light-success text-success mb-3">
              <i class="fa-solid fa-route fa-lg"></i>
            </div>
            <h5 class="fw-bold mb-3">Timeline Tracking</h5>
            <p class="text-muted fs-7">Never be left in the dark. View exactly where your application is—from initial review, to interviews, to official offer releases.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4">
            <div class="stat-icon-wrapper bg-light-info text-info mb-3">
              <i class="fa-solid fa-graduation-cap fa-lg"></i>
            </div>
            <h5 class="fw-bold mb-3">Skill Matching</h5>
            <p class="text-muted fs-7">Our system analyzes your skills checklist in your profile to recommend positions that yield high selection probabilities.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- How It Works Section -->
  <section class="py-5 bg-light">
    <div class="container reveal">
      <h3 class="section-title-center">How It Works</h3>
      <p class="text-center text-muted mb-4">Simple three-step workflow to land your next professional opportunity</p>
      
      <!-- Interactive Pill Tabs -->
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
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">1</span>
                </div>
                <h5 class="fw-bold">Create Profile</h5>
                <p class="text-muted fs-7">Register as a student, update your educational records, list your skill-tags, and upload your PDF Resume.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">2</span>
                </div>
                <h5 class="fw-bold">Apply with 1-Click</h5>
                <p class="text-muted fs-7">Search our filterable listings, draft cover letters with our forms, and submit applications directly.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">3</span>
                </div>
                <h5 class="fw-bold">Track Status</h5>
                <p class="text-muted fs-7">Monitor changes in real-time, schedule interviews, and accept official offers on your personalized dashboard.</p>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Tab 2: Employers -->
        <div class="tab-pane fade" id="tab-employers" role="tabpanel" aria-labelledby="employer-tab">
          <div class="row g-4 text-center">
            <div class="col-md-4">
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">1</span>
                </div>
                <h5 class="fw-bold">Post Listings</h5>
                <p class="text-muted fs-7">Register your organization, set up requirements, specify skills, duration, and competitive stipend rates.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">2</span>
                </div>
                <h5 class="fw-bold">Review Applicants</h5>
                <p class="text-muted fs-7">Filter applicants using our advanced resume tracking tools, view candidate profiles, and shortlist top talent.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="p-3">
                <div class="bg-white border rounded-circle shadow-sm mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                  <span class="fs-3 fw-bold text-primary">3</span>
                </div>
                <h5 class="fw-bold">Hire Interns</h5>
                <p class="text-muted fs-7">Release digital offers with 1-click, coordinate onboarding, and build a streamlined student talent pipeline.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials Section -->
  <section class="py-5">
    <div class="container reveal">
      <h3 class="section-title-center">Student Testimonials</h3>
      <p class="text-center text-muted mb-5">See how candidates secured positions using our interface</p>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="testimonial-card h-100">
            <i class="fa-solid fa-quote-right testimonial-quote"></i>
            <div class="d-flex align-items-center gap-3 mb-3">
              <div style="width: 50px; height: 50px; background-color: #E2E8F0;" class="rounded-circle d-flex align-items-center justify-content-center">
                <i class="fa-solid fa-user text-muted"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-0">Sarah Jenkins</h6>
                <span class="fs-8 text-primary">Web Developer @ Spotify</span>
              </div>
            </div>
            <div class="text-warning mb-2">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="text-muted fs-7 mb-0">"The application tracking timeline is a game-changer! I knew exactly when Spotify reviewed my resume, which helped me prepare for the interviews on time."</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="testimonial-card h-100">
            <i class="fa-solid fa-quote-right testimonial-quote"></i>
            <div class="d-flex align-items-center gap-3 mb-3">
              <div style="width: 50px; height: 50px; background-color: #E2E8F0;" class="rounded-circle d-flex align-items-center justify-content-center">
                <i class="fa-solid fa-user text-muted"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-0">David Lee</h6>
                <span class="fs-8 text-primary">UI Designer @ Google</span>
              </div>
            </div>
            <div class="text-warning mb-2">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="text-muted fs-7 mb-0">"The skill matching tool guided me to apply to UI roles that aligned with my Figma skillset. I had an interview schedule within 5 days of registering."</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="testimonial-card h-100">
            <i class="fa-solid fa-quote-right testimonial-quote"></i>
            <div class="d-flex align-items-center gap-3 mb-3">
              <div style="width: 50px; height: 50px; background-color: #E2E8F0;" class="rounded-circle d-flex align-items-center justify-content-center">
                <i class="fa-solid fa-user text-muted"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-0">Elena Rostova</h6>
                <span class="fs-8 text-primary">Marketing Intern @ Amazon</span>
              </div>
            </div>
            <div class="text-warning mb-2">
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
              <i class="fa-solid fa-star"></i>
            </div>
            <p class="text-muted fs-7 mb-0">"As an international student, having access to verified company listings and competitive stipends saved me countless hours of checking other sites."</p>
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
          <h2 class="mb-3">Ready to Discover Your Potential?</h2>
          <p class="text-light opacity-75 mb-4">Create your free account today as a student to explore openings, or join as a company partner to acquire talented student interns.</p>
          <div class="d-flex justify-content-center gap-3 flex-wrap">
            <a href="register.html" class="btn btn-white bg-white text-primary btn-lg px-4 fw-bold">Sign Up as Student</a>
            <a href="register.html?type=company" class="btn btn-outline-light btn-lg px-4">Register as Company</a>
          </div>
        </div>
      </div>
    </div>
  </section>
      </main>
</asp:Content>

