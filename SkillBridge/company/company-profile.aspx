<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="company-profile.aspx.cs" Inherits="SkillBridge.company.company_profile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="company-dashboard.html">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Company Profile</li>
            </ol>
        </nav>

        <h2 class="fw-bold text-secondary mb-4">Edit Company Profile</h2>

        <!-- Profile Edit Form -->
        <form class="needs-validation-custom" data-success-msg="Company details updated successfully!" data-redirect="company-profile.html" novalidate>
            <div class="row g-4">

                <!-- Logo Sidebar Card -->
                <div class="col-lg-4">
                    <div class="d-flex flex-column gap-4">
                        <div class="bg-white border rounded-3 p-4 text-center shadow-sm">
                            <div class="profile-image-upload mb-3">
                                <div style="width: 114px; height: 114px; background-color: #E2E8F0;" class="rounded-circle d-flex align-items-center justify-content-center mx-auto border-dashed">
                                    <i class="fa-solid fa-building text-muted fa-4x"></i>
                                </div>
                                <label for="logo-file" class="profile-image-upload-btn">
                                    <i class="fa-solid fa-camera"></i>
                                </label>
                                <input type="file" id="logo-file" accept="image/*" onchange="alert('New company logo selected.')">
                            </div>
                            <h5 class="fw-bold text-secondary mb-1">TechSphere Solutions</h5>
                            <p class="text-muted fs-8 mb-3">HQ: Palo Alto, California</p>
                            <span class="badge bg-light-primary text-primary px-3 py-1.5 rounded-3 fw-bold fs-9">Industry: Technology</span>
                        </div>
                    </div>
                </div>

                <!-- Profile Info Cards -->
                <div class="col-lg-8">
                    <div class="d-flex flex-column gap-4">
                        <!-- Core Profile Information -->
                        <div class="bg-white border rounded-3 p-4 shadow-sm">
                            <h5 class="fw-bold text-secondary border-bottom pb-2 mb-3"><i class="fa-solid fa-building me-2 text-primary"></i>Company Information</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="comp-name" class="form-label form-label-custom">Company Name</label>
                                    <input type="text" id="comp-name" class="form-control form-control-custom" value="TechSphere Solutions" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="comp-email" class="form-label form-label-custom">Corporate Email</label>
                                    <input type="email" id="comp-email" class="form-control form-control-custom" value="hr@techspheresolutions.com" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="comp-contact" class="form-label form-label-custom">Contact Person Name</label>
                                    <input type="text" id="comp-contact" class="form-control form-control-custom" value="Sarah Jenkins" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="comp-url" class="form-label form-label-custom">Website URL</label>
                                    <input type="url" id="comp-url" class="form-control form-control-custom" value="https://techspheresolutions.com" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="comp-industry" class="form-label form-label-custom">Industry Segment</label>
                                    <select id="comp-industry" class="form-select form-control-custom" required>
                                        <option value="technology" selected>Technology / Engineering</option>
                                        <option value="finance">Finance / Fintech</option>
                                        <option value="marketing">Marketing / Sales</option>
                                        <option value="design">UI/UX Design Studio</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="comp-address" class="form-label form-label-custom">Headquarters Address</label>
                                    <input type="text" id="comp-address" class="form-control form-control-custom" value="120 University Avenue, Palo Alto, CA" required>
                                </div>
                                <div class="col-12">
                                    <label for="comp-desc" class="form-label form-label-custom">Company Profile Description</label>
                                    <textarea id="comp-desc" class="form-control form-control-custom" rows="5" required>TechSphere Solutions is a global engineering firm dedicated to constructing premium, responsive web systems and integrations for startups and enterprises worldwide.</textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Action buttons -->
                        <div class="d-flex justify-content-end gap-3">
                            <button type="reset" class="btn btn-outline-secondary px-4 py-2">Reset</button>
                            <button type="submit" class="btn btn-primary px-5 py-2"><i class="fa-solid fa-floppy-disk me-2"></i>Save Changes</button>
                        </div>
                    </div>
                </div>

            </div>
        </form>

    </div>
</asp:Content>

