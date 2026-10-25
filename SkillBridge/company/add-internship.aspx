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
        <%--        <form class="needs-validation-custom" data-success-msg="Internship position successfully published!" data-redirect="internship-management.aspx" novalidate>--%>
        <div class="row g-4">

            <div class="col-lg-8">
                <div class="bg-white border rounded-3 p-4 shadow-sm">

                    <div class="row g-3">
                        <!-- Title -->
                        <div class="col-12">
                            <label for="intern-title" class="form-label form-label-custom">Internship Title</label>
                            <asp:TextBox ID="intern_title" runat="server" class="form-control form-control-custom" placeholder="e.g. Associate Backend Developer"></asp:TextBox>
                            <%--                                <input type="text" id="intern-title" class="form-control form-control-custom" placeholder="e.g. Associate Backend Developer" required>--%>
                        </div>

                        <!-- Category -->
                        <div class="col-md-6">
                            <label for="intern-dept" class="form-label form-label-custom">Department Category</label>
                            <asp:DropDownList ID="intern_dept" runat="server" class="form-select form-control-custom">
                                <asp:ListItem Value="">Select Department</asp:ListItem>
                                <asp:ListItem Value="Software Development">Software Development</asp:ListItem>
                                <asp:ListItem Value="UI/UX & Graphics">UI/UX & Graphics</asp:ListItem>
                                <asp:ListItem Value="Marketing & Growth">Marketing & Growth</asp:ListItem>
                                <asp:ListItem Value="Content & Copywriting">Content & Copywriting</asp:ListItem>
                                <asp:ListItem Value="Human Resources">Human Resources</asp:ListItem>
                                <asp:ListItem Value="Data Science">Data Science</asp:ListItem>
                            </asp:DropDownList>
                            <%-- <select id="intern-dept" class="form-select form-control-custom" required>
                                    <option value="" selected disabled>Select Department</option>
                                    <option value="tech">Software Development</option>
                                    <option value="design">UI/UX & Graphics</option>
                                    <option value="marketing">Marketing & Growth</option>
                                    <option value="content">Content & Copywriting</option>
                                    <option value="hr">Human Resources</option>
                                </select>--%>
                            <div class="invalid-feedback-custom">Please select a department category.</div>
                        </div>

                        <!-- Stipend -->
                        <div class="col-md-6">
                            <label for="intern-stipend" class="form-label form-label-custom">Stipend (USD / Month)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 text-muted fs-8">$</span>
                                <asp:TextBox ID="intern_stipend" runat="server" TextMode="Number" class="form-control form-control-custom border-start-0 ps-1" placeholder="e.g. 1200"></asp:TextBox>
                                <%--                                    <input type="number" id="intern-stipend" class="form-control form-control-custom border-start-0 ps-1" placeholder="e.g. 1200" required>--%>
                                <div class="invalid-feedback-custom w-100">Please specify monthly stipend amount (0 for unpaid).</div>
                            </div>
                        </div>

                        <!-- Duration -->
                        <div class="col-md-6">
                            <label for="intern-duration" class="form-label form-label-custom">Duration</label>
                            <asp:DropDownList ID="intern_duration" class="form-select form-control-custom" runat="server">
                                <asp:ListItem Value="">Select Duration</asp:ListItem>
                                <asp:ListItem Value="3 Months">3 Months</asp:ListItem>
                                <asp:ListItem Value="6 Months">6 Months</asp:ListItem>
                                <asp:ListItem Value="12 Months">12 Months</asp:ListItem>
                            </asp:DropDownList>
                            <%--<select id="intern-duration" class="form-select form-control-custom" required>
                                <option value="3" selected>3 Months</option>
                                <option value="6">6 Months</option>
                                <option value="12">12 Months</option>
                            </select>--%>
                        </div>

                        <!-- Location Select -->
                        <div class="col-md-6">
                            <label for="intern-loc-type" class="form-label form-label-custom">Location Type</label>
                            <asp:DropDownList ID="intern_loc_type" class="form-select form-control-custom" runat="server">
                                <asp:ListItem Value="">Select Location Type</asp:ListItem>
                                <asp:ListItem Value="Remote">Remote</asp:ListItem>
                                <asp:ListItem Value="On-Site">On-Site</asp:ListItem>
                                <asp:ListItem Value="Hybrid">Hybrid</asp:ListItem>
                            </asp:DropDownList>
                            <%--  <select id="intern-loc-type" class="form-select form-control-custom" required>
                                <option value="remote" selected>Remote</option>
                                <option value="onsite">On-Site (Office HQ)</option>
                                <option value="hybrid">Hybrid</option>
                            </select>--%>
                        </div>

                        <!-- Address Location -->
                        <div class="col-12">
                            <label for="intern-address" class="form-label form-label-custom">Office Location Address</label>
                            <asp:TextBox ID="intern_location" class="form-control form-control-custom" placeholder="e.g. Palo Alto, California (Or 'Global Remote')" runat="server"></asp:TextBox>
                            <%--                            <input type="text" id="intern-address" class="form-control form-control-custom" placeholder="e.g. Palo Alto, California (Or 'Global Remote')" required>--%>
                            <div class="invalid-feedback-custom">Please specify the address or remote parameter.</div>
                        </div>

                        <!-- Deadline Date -->
                        <div class="col-md-6">
                            <label for="intern-deadline" class="form-label form-label-custom">Application Deadline</label>
                            <asp:TextBox ID="intern_deadline" runat="server" TextMode="Date" class="form-control form-control-custom"></asp:TextBox>
                            <%--                            <input type="date" id="intern-deadline" class="form-control form-control-custom" required>--%>
                            <div class="invalid-feedback-custom">Please select an application deadline.</div>
                        </div>

                        <!-- Skills Check -->
                        <div class="col-md-6">
                            <label class="form-label form-label-custom">Required Skills (Press Enter to add tags)</label>
                            <div id="skills-wrapper" class="skills-select-wrapper">
                                <asp:TextBox ID="intern_skills" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control form-control-custom" placeholder="e.g. Java, Python, SQL, HTML, CSS"></asp:TextBox>
                                <%--                                <input type="text" id="skill-input" class="skill-tag-input" placeholder="e.g. Java, Python">--%>
                            </div>
                            <label class="form-label form-label-custom">
                                Required Skills (comma-separated)
                            </label>
                        </div>

                        <!-- Detailed Description -->
                        <div class="col-12">
                            <label for="intern-description" class="form-label form-label-custom">Detailed Description & Responsibilities</label>
                            <asp:TextBox ID="intern_description" runat="server" TextMode="MultiLine" class="form-control form-control-custom" Rows="8" placeholder="Draft internship responsibilities, requirements checklist, work scope, and eligibility criteria..."></asp:TextBox>
                            <%--                            <textarea id="intern-description" class="form-control form-control-custom" rows="8" placeholder="Draft internship responsibilities, requirements checklist, work scope, and eligibility criteria..." required></textarea>--%>
                            <div class="invalid-feedback-custom">Please write a detailed job description.</div>
                        </div>

                        <!-- Bottom Publish Buttons -->
                        <div class="col-12">
                            <div class="d-flex justify-content-end gap-3 mt-2">

                                <asp:Button ID="btnCancelInternship"
                                    runat="server"
                                    Text="Cancel"
                                    CssClass="btn btn-outline-secondary px-4"
                                    CausesValidation="false"
                                    OnClick="btnCancelInternship_Click" />

                                <asp:Button ID="btnPublishInternship"
                                    runat="server"
                                    Text="Publish Internship"
                                    CssClass="btn btn-primary px-4"
                                    OnClick="btnPublishInternship_Click" />

                            </div>

                            <asp:Label ID="lblInternshipMessage"
                                runat="server"
                                CssClass="internship-message"></asp:Label>
                        </div>

                    </div>

                </div>
            </div>

            <!-- Right Sidebar -->
            <div class="col-lg-4">
                <div class="position-sticky" style="top: 100px;">

                    <!-- Posting Overview -->
                    <div class="bg-white border rounded-3 p-4 shadow-sm mb-4">

                        <div class="d-flex align-items-center mb-3">
                            <div class="d-flex align-items-center justify-content-center rounded-3 me-3"
                                style="width: 46px; height: 46px; background: #2563eb;">
                                <i class="fa-solid fa-briefcase text-white fs-4"></i>
                            </div>

                            <div>
                                <h5 class="fw-bold text-secondary mb-1">Posting Overview</h5>
                                <small class="text-muted">Before you publish</small>
                            </div>
                        </div>

                        <p class="text-muted small mb-3">
                            Create a clear and informative internship opportunity to help students understand the role.
                        </p>

                        <div class="border rounded-3 p-3 mb-3">
                            <div class="d-flex align-items-center mb-3">
                                <i class="fa-solid fa-heading text-primary me-3"></i>
                                <div>
                                    <div class="fw-semibold text-secondary">Position Details</div>
                                    <small class="text-muted">Title and department</small>
                                </div>
                            </div>

                            <div class="d-flex align-items-center mb-3">
                                <i class="fa-solid fa-indian-rupee-sign text-primary me-3"></i>
                                <div>
                                    <div class="fw-semibold text-secondary">Compensation</div>
                                    <small class="text-muted">Stipend and duration</small>
                                </div>
                            </div>

                            <div class="d-flex align-items-center mb-3">
                                <i class="fa-solid fa-code text-primary me-3"></i>
                                <div>
                                    <div class="fw-semibold text-secondary">Required Skills</div>
                                    <small class="text-muted">Skills students should have</small>
                                </div>
                            </div>

                            <div class="d-flex align-items-center">
                                <i class="fa-solid fa-calendar-days text-primary me-3"></i>
                                <div>
                                    <div class="fw-semibold text-secondary">Application Deadline</div>
                                    <small class="text-muted">Last date to apply</small>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-start p-3 rounded-3"
                            style="background: rgba(37, 99, 235, 0.10);">
                            <i class="fa-solid fa-circle-info text-primary me-2 mt-1"></i>
                            <small class="text-muted">Review your information carefully before publishing your internship.
                            </small>
                        </div>

                    </div>

                    <!-- Posting Tips -->
                    <div class="bg-white border rounded-3 p-4 shadow-sm">

                        <h6 class="fw-bold text-secondary mb-3">
                            <i class="fa-solid fa-lightbulb text-warning me-2"></i>
                            Tips for a Better Posting
                        </h6>

                        <div class="mb-3">
                            <div class="fw-semibold text-secondary small mb-1">
                                <i class="fa-solid fa-check-circle text-success me-2"></i>
                                Write a clear title
                            </div>
                            <small class="text-muted">Example: Junior Java Developer.
                            </small>
                        </div>

                        <div class="mb-3">
                            <div class="fw-semibold text-secondary small mb-1">
                                <i class="fa-solid fa-check-circle text-success me-2"></i>
                                Explain the role
                            </div>
                            <small class="text-muted">Include responsibilities and learning opportunities.
                            </small>
                        </div>

                        <div>
                            <div class="fw-semibold text-secondary small mb-1">
                                <i class="fa-solid fa-check-circle text-success me-2"></i>
                                Add relevant skills
                            </div>
                            <small class="text-muted">Separate skills with commas, such as Java, SQL, and HTML.
                            </small>
                        </div>

                    </div>

                </div>
            </div>



        </div>
        <%--</form>--%>
    </div>
</asp:Content>

