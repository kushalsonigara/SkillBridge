<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="applicants.aspx.cs" Inherits="SkillBridge.company.applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <div class="dashboard-inner">


        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="company-dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Applicants
                </li>
            </ol>
        </nav>


        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Incoming Student Applications</h2>
                <p class="text-muted mb-0">
                    Screen candidate profiles, evaluate skill matching, and dispatch review approvals
               
                </p>
            </div>
        </div>

        <!-- Table Toolbar -->

        <!-- Original static HTML commented out -->
        <%--
        <div class="table-toolbar">
            <div class="input-group max-width-350">
                <span class="input-group-text bg-white border-end-0">
                    <i class="fa-solid fa-magnifying-glass text-muted"></i>
                </span>
                <input type="text" class="form-control form-control-custom border-start-0 ps-1 fs-8"
                    placeholder="Search applicants...">
            </div>

            <div class="d-flex align-items-center gap-2">
                <span class="fs-8 text-muted text-nowrap d-none d-sm-inline">
                    Filter By Position
                </span>
                <select class="form-select form-select-sm fs-8 border-light rounded-3 bg-white">
                    <option value="">All Openings</option>
                    <option value="frontend">Frontend Developer Intern</option>
                    <option value="design">UI/UX Designer Intern</option>
                    <option value="marketing">Digital Marketing Intern</option>
                </select>
            </div>
        </div>
        --%>


        <div class="table-toolbar">

            <div class="input-group max-width-350">
                <span class="input-group-text bg-white border-end-0">
                    <i class="fa-solid fa-magnifying-glass text-muted"></i>
                </span>

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="form-control form-control-custom border-start-0 ps-1 fs-8"
                    placeholder="Search applicants..."
                    AutoPostBack="true"
                    OnTextChanged="txtSearch_TextChanged">
                </asp:TextBox>
            </div>

            <div class="d-flex align-items-center gap-2">
                <span class="fs-8 text-muted text-nowrap d-none d-sm-inline">Filter By Position
                </span>

                <asp:DropDownList ID="ddlPosition" runat="server"
                    CssClass="form-select form-select-sm fs-8 border-light rounded-3 bg-white"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

        </div>

        <!-- Applicants Table -->

        <!-- Original static HTML table commented out -->
        <%--
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
                        <td>
                            <span class="fw-semibold text-dark">Frontend Developer Intern</span>
                        </td>
                        <td>
                            <span class="badge-skill me-1 mb-1">HTML5</span>
                            <span class="badge-skill me-1 mb-1">CSS3</span>
                            <span class="badge-skill me-1 mb-1">JavaScript</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0">
                                <i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf
                            </a>
                        </td>
                        <td>
                            <span class="status-badge status-badge-interview">Interview</span>
                        </td>
                        <td class="text-end">
                            <button class="btn btn-success btn-sm rounded-2 me-1">Accept</button>
                            <button class="btn btn-danger btn-sm rounded-2">Reject</button>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Jane Smith</strong>
                            <span class="text-muted fs-8">UC Berkeley &bull; GPA 3.9</span>
                        </td>
                        <td>
                            <span class="fw-semibold text-dark">UI/UX Designer Intern</span>
                        </td>
                        <td>
                            <span class="badge-skill me-1 mb-1">Figma</span>
                            <span class="badge-skill me-1 mb-1">Wireframes</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0">
                                <i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf
                            </a>
                        </td>
                        <td>
                            <span class="status-badge status-badge-review">Under Review</span>
                        </td>
                        <td class="text-end">
                            <button class="btn btn-success btn-sm rounded-2 me-1">Accept</button>
                            <button class="btn btn-danger btn-sm rounded-2">Reject</button>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <strong class="text-secondary d-block">Bob Marley</strong>
                            <span class="text-muted fs-8">MIT Tech &bull; GPA 3.5</span>
                        </td>
                        <td>
                            <span class="fw-semibold text-dark">Digital Marketing Intern</span>
                        </td>
                        <td>
                            <span class="badge-skill me-1 mb-1">SEO</span>
                            <span class="badge-skill me-1 mb-1">Copywriting</span>
                        </td>
                        <td>
                            <a href="#" class="btn btn-link btn-sm text-danger p-0">
                                <i class="fa-solid fa-file-pdf fa-lg me-1"></i>CV.pdf
                            </a>
                        </td>
                        <td>
                            <span class="status-badge status-badge-rejected">Rejected</span>
                        </td>
                        <td class="text-end text-muted fs-8 pe-3">
                            Processed &bull; Rejected
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        --%>


        <div class="table-responsive-custom">

            <asp:GridView ID="gvApplicants" runat="server"
                AutoGenerateColumns="false"
                CssClass="table-custom"
                GridLines="None"
                Width="100%"
                DataKeyNames="ApplicationID"
                EmptyDataText="No applications found for your internships."
                OnRowCommand="gvApplicants_RowCommand">

                <Columns>


                    <asp:TemplateField HeaderText="Candidate Details">
                        <ItemTemplate>
                            <strong class="text-secondary d-block">
                                <%#: Eval("FullName") %>
                            </strong>
                            <span class="text-muted fs-8">
                                <%#: Eval("College") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Applied Position">
                        <ItemTemplate>
                            <span class="fw-semibold text-dark">
                                <%#: Eval("Title") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Profile Skills">
                        <ItemTemplate>
                            <span class="badge-skill me-1 mb-1">
                                <%#: Eval("Skills") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Resume">
                        <ItemTemplate>


                            <asp:HyperLink ID="lnkResume" runat="server"
                                NavigateUrl='<%# ResolveUrl("~/Uploads/Resumes/" + System.IO.Path.GetFileName(Convert.ToString(Eval("ResumePath")))) %>'
                                Target="_blank"
                                CssClass="btn btn-link btn-sm text-danger p-0"
                                Visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("ResumePath"))) %>'>
                                <i class="fa-solid fa-file-pdf fa-lg me-1"></i>View Resume
                            </asp:HyperLink>




                            <asp:Label ID="lblNoResume" runat="server"
                                Text="Not uploaded"
                                CssClass="text-muted fs-8"
                                Visible='<%# String.IsNullOrEmpty(Convert.ToString(Eval("ResumePath"))) %>'>
                            </asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# 
                                        Convert.ToString(Eval("Status")) == "Accepted" ? "status-badge status-badge-accepted" :
                                        Convert.ToString(Eval("Status")) == "Rejected" ? "status-badge status-badge-rejected" :
                                        Convert.ToString(Eval("Status")) == "Interview" ? "status-badge status-badge-interview" :
                                        Convert.ToString(Eval("Status")) == "Under Review" ? "status-badge status-badge-review" :
                                        "status-badge status-badge-pending"
                             %>'>
                                <%#: Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Actions">
                        <ItemStyle CssClass="text-end" />

                        <ItemTemplate>

                            <asp:Button ID="btnAccept" runat="server"
                                Text="Accept"
                                CssClass="btn btn-success btn-sm rounded-2 me-1"
                                CommandName="AcceptApplication"
                                CommandArgument='<%# Eval("ApplicationID") %>'
                                CausesValidation="false"
                                Visible='<%# Convert.ToString(Eval("Status")) != "Accepted" && Convert.ToString(Eval("Status")) != "Rejected" %>'
                                OnClientClick="return confirm('Are you sure you want to accept this application?');" />

                            <asp:Button ID="btnReject" runat="server"
                                Text="Reject"
                                CssClass="btn btn-danger btn-sm rounded-2"
                                CommandName="RejectApplication"
                                CommandArgument='<%# Eval("ApplicationID") %>'
                                CausesValidation="false"
                                Visible='<%# Convert.ToString(Eval("Status")) != "Accepted" && Convert.ToString(Eval("Status")) != "Rejected" %>'
                                OnClientClick="return confirm('Are you sure you want to reject this application?');" />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>
</asp:Content>

