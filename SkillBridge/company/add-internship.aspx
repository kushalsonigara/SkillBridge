<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="add-internship.aspx.cs" Inherits="SkillBridge.company.company_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="company-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="internship-management.aspx">Positions</a></li>
                <li id="breadcrumb-action-node" class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Post Position</li>
            </ol>
        </nav>

        <h2 id="page-title-node" class="fw-bold text-secondary mb-4">Post a New Internship</h2>

        <!-- Position Form -->
        <form class="needs-validation-custom" data-success-msg="Internship position successfully published!" data-redirect="internship-management.aspx" novalidate>
            <div class="row g-4">

                <div class="col-lg-8">
                    <div class="bg-white border rounded-3 p-4 shadow-sm">

                        <div class="row g-3">
                            <!-- Title -->
                            <div class="col-12">
                                <label for="intern-title" class="form-label form-label-custom">Internship Title</label>
                                <input type="text" id="intern-title" class="form-control form-control-custom" placeholder="e.g. Associate Backend Developer" required>
                                <div class="invalid-feedback-custom">Please specify the position title.</div>
                            </div>

                            <!-- Category -->
                            <div class="col-md-6">
                                <label for="intern-dept" class="form-label form-label-custom">Department Category</label>
                                <select id="intern-dept" class="form-select form-control-custom" required>
                                    <option value="" selected disabled>Select Department</option>
                                    <option value="tech">Software Development</option>
                                    <option value="design">UI/UX & Graphics</option>
                                    <option value="marketing">Marketing & Growth</option>
                                    <option value="content">Content & Copywriting</option>
                                    <option value="hr">Human Resources</option>
                                </select>
                                <div class="invalid-feedback-custom">Please select a department category.</div>
                            </div>

                            <!-- Stipend -->
                            <div class="col-md-6">
                                <label for="intern-stipend" class="form-label form-label-custom">Stipend (USD / Month)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0 text-muted fs-8">$</span>
                                    <input type="number" id="intern-stipend" class="form-control form-control-custom border-start-0 ps-1" placeholder="e.g. 1200" required>
                                    <div class="invalid-feedback-custom w-100">Please specify monthly stipend amount (0 for unpaid).</div>
                                </div>
                            </div>

                            <!-- Duration -->
                            <div class="col-md-6">
                                <label for="intern-duration" class="form-label form-label-custom">Duration</label>
                                <select id="intern-duration" class="form-select form-control-custom" required>
                                    <option value="3" selected>3 Months</option>
                                    <option value="6">6 Months</option>
                                    <option value="12">12 Months</option>
                                </select>
                            </div>

                            <!-- Location Select -->
                            <div class="col-md-6">
                                <label for="intern-loc-type" class="form-label form-label-custom">Location Type</label>
                                <select id="intern-loc-type" class="form-select form-control-custom" required>
                                    <option value="remote" selected>Remote</option>
                                    <option value="onsite">On-Site (Office HQ)</option>
                                    <option value="hybrid">Hybrid</option>
                                </select>
                            </div>

                            <!-- Address Location -->
                            <div class="col-12">
                                <label for="intern-address" class="form-label form-label-custom">Office Location Address</label>
                                <input type="text" id="intern-address" class="form-control form-control-custom" placeholder="e.g. Palo Alto, California (Or 'Global Remote')" required>
                                <div class="invalid-feedback-custom">Please specify the address or remote parameter.</div>
                            </div>

                            <!-- Deadline Date -->
                            <div class="col-md-6">
                                <label for="intern-deadline" class="form-label form-label-custom">Application Deadline</label>
                                <input type="date" id="intern-deadline" class="form-control form-control-custom" required>
                                <div class="invalid-feedback-custom">Please select an application deadline.</div>
                            </div>

                            <!-- Skills Check -->
                            <div class="col-md-6">
                                <label class="form-label form-label-custom">Required Skills (Press Enter to add tags)</label>
                                <div id="skills-wrapper" class="skills-select-wrapper">
                                    <input type="text" id="skill-input" class="skill-tag-input" placeholder="e.g. Java, Python">
                                </div>
                                <input type="hidden" id="hidden-skills-field" name="skills">
                            </div>

                            <!-- Detailed Description -->
                            <div class="col-12">
                                <label for="intern-description" class="form-label form-label-custom">Detailed Description & Responsibilities</label>
                                <textarea id="intern-description" class="form-control form-control-custom" rows="8" placeholder="Draft internship responsibilities, requirements checklist, work scope, and eligibility criteria..." required></textarea>
                                <div class="invalid-feedback-custom">Please write a detailed job description.</div>
                            </div>

                        </div>

                    </div>
                </div>

                <!-- Summary Sidebar & Publish buttons -->
                <div class="col-lg-4">
                    <div class="bg-white border rounded-3 p-4 shadow-sm position-sticky" style="top: 100px;">
                        <h5 class="fw-bold text-secondary mb-3">Publish Actions</h5>
                        <p class="text-muted fs-8 mb-4">Once published, this internship position will instantly reflect in public listing pages and skill-matching alerts for students.</p>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-circle-check me-2"></i>Publish Opening</button>
                            <a href="internship-management.aspx" class="btn btn-outline-secondary">Cancel & Go Back</a>
                        </div>
                    </div>
                </div>

            </div>
        </form>

    </div>
</asp:Content>

