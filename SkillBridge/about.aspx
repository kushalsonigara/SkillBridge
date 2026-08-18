<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="SkillBridge.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <!-- Main Container Partition -->
  <main class="main-container">
    <!-- Page Header -->
    <section class="page-header-bg text-center">
    <div class="container">
      <h1 class="mb-0">About Our Portal</h1>
    </div>
  </section>

  <!-- Portal Introduction -->
  <section class="py-5 reveal">
    <div class="container">
      <div class="row align-items-center gy-4">
        <div class="col-lg-6">
          <h3 class="section-title">Bridging Academics & Industry</h3>
          <p class="lead text-muted mb-4">SkillBridge is a next-generation platform designed to streamline internship placements for students, companies, and academic coordinators.</p>
          <p class="mb-4">We understand the hurdles students face when transitioning from academic fields into professional spaces. Simultaneously, we recognize how challenging it is for companies to target the right talent matches quickly. SkillBridge automates standard applications, tracks reviews transparently, and provides metrics to administrators on student placement progress.</p>
          <div class="d-flex gap-3">
            <a href="register.html" class="btn btn-primary px-4"><i class="fa-solid fa-user-plus me-2"></i>Create Free Account</a>
            <a href="contact.html" class="btn btn-outline-secondary px-4">Contact Sales</a>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-4 bg-white border rounded-3 shadow-md">
            <h4 class="fw-bold mb-4 text-secondary"><i class="fa-solid fa-circle-check text-primary me-2"></i>Platform Highlights</h4>
            <div class="d-flex gap-3 mb-3">
              <div class="bg-light-primary text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                <i class="fa-solid fa-list-check"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-1">Centralized Panel</h6>
                <p class="text-muted fs-7 mb-0">Track all applications, reviews, feedback, and letters of intent in a single dashboard.</p>
              </div>
            </div>
            <div class="d-flex gap-3 mb-3">
              <div class="bg-light-success text-success rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                <i class="fa-solid fa-sliders"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-1">Interactive Filters</h6>
                <p class="text-muted fs-7 mb-0">Search internships easily by location, stipends, duration, and direct skill compatibility matches.</p>
              </div>
            </div>
            <div class="d-flex gap-3">
              <div class="bg-light-info text-info rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                <i class="fa-solid fa-chart-pie"></i>
              </div>
              <div>
                <h6 class="fw-bold mb-1">Analytics Dashboard</h6>
                <p class="text-muted fs-7 mb-0">Rich visual charts powered by Chart.js representing registration records, growth, and statuses.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Mission, Vision & Objectives Section -->
  <section class="py-5 bg-white border-top border-bottom reveal">
    <div class="container">
      <div class="row g-4">
        <div class="col-md-4">
          <div class="card-premium h-100 p-4">
            <div class="stat-icon-wrapper mb-3">
              <i class="fa-solid fa-bullseye"></i>
            </div>
            <h4 class="fw-bold mb-3 text-secondary">Our Mission</h4>
            <p class="text-muted fs-7 mb-0">To democratize internship access by offering students a transparent portal to connect directly with organizations, minimizing paperwork and recruitment gaps.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-premium h-100 p-4">
            <div class="stat-icon-wrapper bg-light-success text-success mb-3">
              <i class="fa-solid fa-eye"></i>
            </div>
            <h4 class="fw-bold mb-3 text-secondary">Our Vision</h4>
            <p class="text-muted fs-7 mb-0">To become the global gold standard system linking universities and industry sectors, supporting workforce readiness through skill-based discovery workflows.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-premium h-100 p-4">
            <div class="stat-icon-wrapper bg-light-info text-info mb-3">
              <i class="fa-solid fa-compass"></i>
            </div>
            <h4 class="fw-bold mb-3 text-secondary">Objectives</h4>
            <p class="text-muted fs-7 mb-0">Provide responsive interfaces for tracking workflows, support administrative checks, compile reliable placement metrics, and foster career development.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Meet the Team Section -->
  <section class="py-5 bg-light reveal">
    <div class="container">
      <h3 class="section-title-center">Meet the Developers</h3>
      <p class="text-center text-muted mb-5">The engineers and designers behind the SkillBridge platform</p>
      <div class="row g-4 justify-content-center">
        <!-- Team Member 1 -->
        <div class="col-lg-3 col-md-6">
          <div class="card-premium p-4 text-center">
            <div class="bg-light border rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; overflow: hidden;">
              <i class="fa-solid fa-user-astronaut fa-3x text-muted"></i>
            </div>
            <h5 class="fw-bold mb-1">Alex Carter</h5>
            <span class="fs-8 text-primary d-block mb-3">Lead System Architect</span>
            <p class="text-muted fs-8 mb-4">Oversees database schemas, cloud infrastructure, and core authentication structures.</p>
            <div class="d-flex justify-content-center gap-2">
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-linkedin-in"></i></a>
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-github"></i></a>
            </div>
          </div>
        </div>
        <!-- Team Member 2 -->
        <div class="col-lg-3 col-md-6">
          <div class="card-premium p-4 text-center">
            <div class="bg-light border rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; overflow: hidden;">
              <i class="fa-solid fa-user-tie fa-3x text-muted"></i>
            </div>
            <h5 class="fw-bold mb-1">Jane Montgomery</h5>
            <span class="fs-8 text-primary d-block mb-3">Frontend Engineer</span>
            <p class="text-muted fs-8 mb-4">Focuses on user experiences, dashboard layouts, custom CSS stylesheets, and responsive frameworks.</p>
            <div class="d-flex justify-content-center gap-2">
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-linkedin-in"></i></a>
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-dribbble"></i></a>
            </div>
          </div>
        </div>
        <!-- Team Member 3 -->
        <div class="col-lg-3 col-md-6">
          <div class="card-premium p-4 text-center">
            <div class="bg-light border rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; overflow: hidden;">
              <i class="fa-solid fa-user-shield fa-3x text-muted"></i>
            </div>
            <h5 class="fw-bold mb-1">Marcus Vance</h5>
            <span class="fs-8 text-primary d-block mb-3">Security & Compliance</span>
            <p class="text-muted fs-8 mb-4">Coordinates validation layers, portal encryption, student profile data privacy, and security checks.</p>
            <div class="d-flex justify-content-center gap-2">
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-linkedin-in"></i></a>
              <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 4px;"><i class="fa-brands fa-twitter"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</section>
</asp:Content>

