<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="applicants.aspx.cs" Inherits="SkillBridge.company.applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="company-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Applicants</li>
            </ol>
        </nav>

        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Incoming Student Applications</h2>
                <p class="text-muted mb-0">Screen candidate profiles, evaluate skill matching, and dispatch review approvals</p>
            </div>
        </div>

        <!-- Table Toolbar -->
        <div class="table-toolbar">
            <div class="input-group max-width-350">
                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                <input type="text" class="form-control form-control-custom border-start-0 ps-1 fs-8" placeholder="Search applicants...">
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="fs-8 text-muted text-nowrap d-none d-sm-inline">Filter By Position</span>
                <select class="form-select form-select-sm fs-8 border-light rounded-3 bg-white">
                    <option value="">All Openings</option>
                    <option value="frontend">Frontend Developer Intern</option>
                    <option value="design">UI/UX Designer Intern</option>
                    <option value="marketing">Digital Marketing Intern</option>
                </select>
            </div>
        </div>

        <!-- Applicants Table -->
        <div class="table-responsive-custom">
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>Candidate Details</th>
                        <th>Applied Position</th>
                        <th>Profile Skills</th>
                        <th>Resume</th>
                        <th>Status</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">John Doe</strong>
                            <span class="text-muted fs-8">Stanford University &bull; GPA 3.8</span>
                        </td>
                        <td><span class="fw-semibold text-dark">Frontend Developer Intern</span></td>
                        <td>
                            <span class="badge-skill me-1 mb-1">HTML5</span>
                            <span class="badge-skill me-1 mb-1">CSS3</span>
                            <span class="badge-skill me-1 mb-1">JavaScript</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0" onclick="alert('Downloading John_Doe_CV.pdf... (Demo only)')"><i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf</a>
                        </td>
                        <td><span class="status-badge status-badge-interview">Interview</span></td>
                        <td class="text-end">
                            <button class="btn btn-success btn-sm rounded-2 me-1" onclick="alert('John Doe has been accepted! A mock letter of intent was generated.')"><i class="fa-solid fa-check"></i>Accept</button>
                            <button class="btn btn-danger btn-sm rounded-2" onclick="alert('Application rejected.')"><i class="fa-solid fa-xmark"></i>Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Jane Smith</strong>
                            <span class="text-muted fs-8">UC Berkeley &bull; GPA 3.9</span>
                        </td>
                        <td><span class="fw-semibold text-dark">UI/UX Designer Intern</span></td>
                        <td>
                            <span class="badge-skill me-1 mb-1">Figma</span>
                            <span class="badge-skill me-1 mb-1">Wireframes</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0" onclick="alert('Downloading Jane_Smith_CV.pdf... (Demo only)')"><i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf</a>
                        </td>
                        <td><span class="status-badge status-badge-review">Under Review</span></td>
                        <td class="text-end">
                            <button class="btn btn-success btn-sm rounded-2 me-1" onclick="alert('Jane Smith has been accepted! A mock letter of intent was generated.')"><i class="fa-solid fa-check"></i>Accept</button>
                            <button class="btn btn-danger btn-sm rounded-2" onclick="alert('Application rejected.')"><i class="fa-solid fa-xmark"></i>Reject</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Bob Marley</strong>
                            <span class="text-muted fs-8">MIT Tech &bull; GPA 3.5</span>
                        </td>
                        <td><span class="fw-semibold text-dark">Digital Marketing Intern</span></td>
                        <td>
                            <span class="badge-skill me-1 mb-1">SEO</span>
                            <span class="badge-skill me-1 mb-1">Copywriting</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0" onclick="alert('Downloading Bob_Marley_CV.pdf... (Demo only)')"><i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf</a>
                        </td>
                        <td><span class="status-badge status-badge-rejected">Rejected</span></td>
                        <td class="text-end text-muted fs-8 pe-3">Processed &bull; Rejected
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

</asp:Content>

