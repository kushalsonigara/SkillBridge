<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="internship-management.aspx.cs" Inherits="SkillBridge.company.internship_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="company-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Manage Internships</li>
            </ol>
        </nav>

        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Manage Posted Opportunities</h2>
                <p class="text-muted mb-0">Review metrics, edit descriptions, or remove active listings</p>
            </div>
            <a href="add-internship.aspx" class="btn btn-primary"><i class="fa-solid fa-circle-plus me-2"></i>Post New Opportunity</a>
        </div>

        <!-- Table Toolbar -->
        <div class="table-toolbar">
            <div class="input-group max-width-350">
                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                <input type="text" class="form-control form-control-custom border-start-0 ps-1 fs-8" placeholder="Search internships...">
            </div>
        </div>

        <!-- Internship Listings Table -->
        <div class="table-responsive-custom">
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>Internship Title</th>
                        <th>Location</th>
                        <th>Stipend</th>
                        <th>Duration</th>
                        <th>Applicants</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Frontend Developer Intern</strong>
                            <span class="text-muted fs-8">Posted Aug 1, 2026</span>
                        </td>
                        <td><span class="badge bg-light-primary text-primary px-2 py-1 fs-9 rounded-2">Remote</span></td>
                        <td><strong class="text-dark">$1,200/mo</strong></td>
                        <td>3 Months</td>
                        <td>
                            <span class="badge bg-light-info text-info px-2.5 py-1.5 fs-9 rounded-pill fw-bold"><i class="fa-solid fa-user-group me-1"></i>18 Applicants</span>
                        </td>
                        <td class="text-end">
                            <a href="applicants.aspx" class="btn btn-light btn-sm text-primary fw-bold me-1" data-bs-toggle="tooltip" title="View Applicants"><i class="fa-solid fa-user-group"></i></a>
                            <a href="add-internship.aspx?edit=true" class="btn btn-light btn-sm text-warning fw-bold me-1" data-bs-toggle="tooltip" title="Edit Listing"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#" class="btn btn-light btn-sm text-danger fw-bold btn-delete-internship" data-bs-toggle="tooltip" title="Delete Listing"><i class="fa-solid fa-trash-can"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">UI/UX Designer Intern</strong>
                            <span class="text-muted fs-8">Posted Jul 25, 2026</span>
                        </td>
                        <td><span class="badge bg-light-primary text-primary px-2 py-1 fs-9 rounded-2">San Francisco</span></td>
                        <td><strong class="text-dark">$1,400/mo</strong></td>
                        <td>3 Months</td>
                        <td>
                            <span class="badge bg-light-info text-info px-2.5 py-1.5 fs-9 rounded-pill fw-bold"><i class="fa-solid fa-user-group me-1"></i>12 Applicants</span>
                        </td>
                        <td class="text-end">
                            <a href="applicants.aspx" class="btn btn-light btn-sm text-primary fw-bold me-1" data-bs-toggle="tooltip" title="View Applicants"><i class="fa-solid fa-user-group"></i></a>
                            <a href="add-internship.aspx?edit=true" class="btn btn-light btn-sm text-warning fw-bold me-1" data-bs-toggle="tooltip" title="Edit Listing"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#" class="btn btn-light btn-sm text-danger fw-bold btn-delete-internship" data-bs-toggle="tooltip" title="Delete Listing"><i class="fa-solid fa-trash-can"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Digital Marketing Intern</strong>
                            <span class="text-muted fs-8">Posted Jul 20, 2026</span>
                        </td>
                        <td><span class="badge bg-light-primary text-primary px-2 py-1 fs-9 rounded-2">Remote</span></td>
                        <td><strong class="text-dark">$1,000/mo</strong></td>
                        <td>3 Months</td>
                        <td>
                            <span class="badge bg-light-info text-info px-2.5 py-1.5 fs-9 rounded-pill fw-bold"><i class="fa-solid fa-user-group me-1"></i>15 Applicants</span>
                        </td>
                        <td class="text-end">
                            <a href="applicants.aspx" class="btn btn-light btn-sm text-primary fw-bold me-1" data-bs-toggle="tooltip" title="View Applicants"><i class="fa-solid fa-user-group"></i></a>
                            <a href="add-internship.aspx?edit=true" class="btn btn-light btn-sm text-warning fw-bold me-1" data-bs-toggle="tooltip" title="Edit Listing"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#" class="btn btn-light btn-sm text-danger fw-bold btn-delete-internship" data-bs-toggle="tooltip" title="Delete Listing"><i class="fa-solid fa-trash-can"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</asp:Content>

