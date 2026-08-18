<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="SkillBridge.Admin.admin_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
          <div class="dashboard-inner">
        
        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
          <ol class="breadcrumb">
            <li class="breadcrumb-item breadcrumb-item-custom"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Admin Dashboard</li>
          </ol>
        </nav>

        <!-- Welcome title -->
        <div class="mb-4">
          <h2 class="fw-bold text-secondary mb-1">Global Platform Statistics</h2>
          <p class="text-muted mb-0">Overview of student candidate registrations, employer postings, and visual metrics.</p>
        </div>

        <!-- Admin stat cards -->
        <div class="row g-4 mb-4">
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Students</h6>
                <h2>4,800</h2>
              </div>
              <div class="card-stat-icon bg-light-primary">
                <i class="fa-solid fa-user-graduate"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Companies</h6>
                <h2>320</h2>
              </div>
              <div class="card-stat-icon bg-light-success">
                <i class="fa-solid fa-building"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Internships</h6>
                <h2>1,250</h2>
              </div>
              <div class="card-stat-icon bg-light-info">
                <i class="fa-solid fa-briefcase"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Applications</h6>
                <h2>12.4k</h2>
              </div>
              <div class="card-stat-icon bg-light-primary">
                <i class="fa-solid fa-folder-open"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Accepted</h6>
                <h2 class="text-success">4.8k</h2>
              </div>
              <div class="card-stat-icon bg-light-success">
                <i class="fa-solid fa-circle-check"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-2 col-md-4 col-sm-6">
            <div class="card-stat">
              <div class="card-stat-info">
                <h6>Rejected</h6>
                <h2 class="text-danger">1.5k</h2>
              </div>
              <div class="card-stat-icon bg-light-danger">
                <i class="fa-solid fa-circle-xmark"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- Charts row -->
        <div class="row g-4 mb-4">
          <!-- Signup growth -->
          <div class="col-lg-6">
            <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
              <h5 class="fw-bold text-secondary mb-4">User Registration Growth (Monthly)</h5>
              <div style="position: relative; height: 300px;">
                <canvas id="adminGrowthChart"></canvas>
              </div>
            </div>
          </div>

          <!-- Active openings by department -->
          <div class="col-lg-6">
            <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
              <h5 class="fw-bold text-secondary mb-4">Openings vs Applications by Department</h5>
              <div style="position: relative; height: 300px;">
                <canvas id="adminStatsChart"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Platform System logs -->
        <div class="bg-white border rounded-3 p-4 shadow-sm">
          <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <h5 class="fw-bold text-secondary mb-0">System Activity Logs</h5>
            <button class="btn btn-outline-secondary btn-sm" onclick="alert('Logs cleared in frontend demonstration.')"><i class="fa-solid fa-eraser me-2"></i>Clear Logs</button>
          </div>

          <div class="table-responsive">
            <table class="table table-hover align-middle mb-0 text-secondary fs-8">
              <thead class="table-light text-uppercase">
                <tr>
                  <th>Actor</th>
                  <th>Portal Role</th>
                  <th>Action Log Description</th>
                  <th>Timestamp</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong class="text-dark">TechSphere Solutions</strong></td>
                  <td>Employer Partner</td>
                  <td>Published internship listing: "Frontend Developer Intern"</td>
                  <td>3 mins ago</td>
                </tr>
                <tr>
                  <td><strong class="text-dark">John Doe</strong></td>
                  <td>Student Candidate</td>
                  <td>Applied to Stripe Inc: "Software Engineering Intern"</td>
                  <td>12 mins ago</td>
                </tr>
                <tr>
                  <td><strong class="text-dark">Stripe Inc. HR Office</strong></td>
                  <td>Employer Partner</td>
                  <td>Updated student John Doe application review status to "Interview"</td>
                  <td>1 hour ago</td>
                </tr>
                <tr>
                  <td><strong class="text-dark">Jane Smith</strong></td>
                  <td>Student Candidate</td>
                  <td>Registered profile account files and uploaded CV.pdf</td>
                  <td>3 hours ago</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>
</asp:Content>

