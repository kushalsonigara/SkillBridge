<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="internship-list.aspx.cs" Inherits="SkillBridge.internship_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="main-container">

        <!-- Page Header -->
        <section class="page-header-bg text-center mb-5">
            <div class="container">
                <h1 class="mb-3">Explore Opportunities</h1>
                <p class="mb-0 text-accent fs-6">
                    Find and apply to matching industry positions in technology, creative design, and administration
               
                </p>
            </div>
        </section>

        <!-- Main Directory Section -->
        <section class="pb-5 flex-grow-1 reveal">
            <div class="container">
                <div class="row g-4">

                    <!-- Filters Sidebar -->
                    <div class="col-lg-4 col-md-5">
                        <div class="form-card p-4 shadow-sm position-sticky" style="top: 100px;">

                            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                <h5 class="fw-bold text-secondary mb-0">
                                    <i class="fa-solid fa-sliders text-primary me-2"></i>Filter Panel
                                </h5>

                                <%-- Original HTML:
                                <a href="internship-list.aspx" class="fs-8 fw-semibold text-danger">Reset All</a>
                                --%>

                                <asp:HyperLink ID="lnkReset" runat="server"
                                    NavigateUrl="~/internship-list.aspx"
                                    CssClass="fs-8 fw-semibold text-danger">Reset All</asp:HyperLink>
                            </div>

                            <%-- Original HTML form commented out:
                            <form action="internship-list.aspx" method="GET">
                                <input type="text" placeholder="e.g. Developer, Designer">
                                <select>
                                    <option value="">All Locations</option>
                                </select>
                                <button type="submit">Apply Filters</button>
                            </form>
                            --%>

                            <!-- Keyword Search -->
                            <div class="mb-3">
                                <label class="form-label form-label-custom">Keyword Search</label>

                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fa-solid fa-magnifying-glass text-muted fs-8"></i>
                                    </span>

                                    <asp:TextBox ID="txtKeyword" runat="server"
                                        CssClass="form-control form-control-custom border-start-0 ps-1"
                                        placeholder="e.g. Developer, Designer">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <!-- Location -->
                            <div class="mb-3">
                                <label class="form-label form-label-custom">Location</label>

                                <asp:DropDownList ID="ddlLocation" runat="server"
                                    CssClass="form-select form-control-custom">
                                    <asp:ListItem Text="All Locations" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Remote" Value="Remote"></asp:ListItem>
                                </asp:DropDownList>
                            </div>


                            <!-- Skills Checklist -->
                            <div class="mb-3">
                                <label class="form-label form-label-custom">Skills Checklist</label>

                                <div class="form-check fs-8 mb-2">
                                    <asp:CheckBox ID="chkHTML" runat="server" Text="HTML5 / CSS3" />
                                </div>

                                <div class="form-check fs-8 mb-2">
                                    <asp:CheckBox ID="chkJavaScript" runat="server" Text="JavaScript" />
                                </div>

                                <div class="form-check fs-8 mb-2">
                                    <asp:CheckBox ID="chkFigma" runat="server" Text="Figma / Wireframing" />
                                </div>

                                <div class="form-check fs-8 mb-2">
                                    <asp:CheckBox ID="chkPython" runat="server" Text="Python / Data Analytics" />
                                </div>
                            </div>


                            <!-- Duration -->
                            <div class="mb-3">
                                <label class="form-label form-label-custom">Duration</label>

                                <asp:DropDownList ID="ddlDuration" runat="server"
                                    CssClass="form-select form-control-custom">
                                    <asp:ListItem Text="Any Duration" Value=""></asp:ListItem>
                                    <asp:ListItem Text="3 Months" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="6 Months" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <!-- Company -->
                            <div class="mb-4">
                                <label class="form-label form-label-custom">Company Partner</label>

                                <asp:TextBox ID="txtCompany" runat="server"
                                    CssClass="form-control form-control-custom"
                                    placeholder="e.g. Company name">
                                </asp:TextBox>
                            </div>

                            <!-- Apply Filters -->
                            <asp:Button ID="btnApplyFilters" runat="server"
                                Text="Apply Filters"
                                CssClass="btn btn-primary w-100 py-2"
                                OnClick="btnApplyFilters_Click" />

                        </div>
                    </div>

                    <!-- Internship Cards Column -->
                    <div class="col-lg-8 col-md-7">

                        <div class="d-flex justify-content-between align-items-center mb-4">

                            <%-- Original HTML:
                            <span class="text-muted fs-7">Showing <strong>3</strong> Positions</span>
                            --%>

                            <asp:Label ID="lblPositionCount" runat="server"
                                CssClass="text-muted fs-7">
                            </asp:Label>

                            <div class="d-flex align-items-center gap-2">
                                <span class="fs-8 text-muted text-nowrap">Sort By</span>

                                <asp:DropDownList ID="ddlSort" runat="server"
                                    CssClass="form-select form-select-sm fs-8 border-light bg-white rounded-3"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                                    <asp:ListItem Text="Most Recent" Value="recent"></asp:ListItem>
                                    <asp:ListItem Text="Highest Stipend" Value="stipend"></asp:ListItem>
                                    <asp:ListItem Text="Upcoming Deadline" Value="deadline"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <%-- Original three static internship cards are commented out.
                        They have been replaced with the DataList below.

                        <div class="card-premium p-4 job-item-card mb-4">
                            <h5>Frontend Developer Intern</h5>
                            <span>TechSphere Solutions</span>
                            <p>Original demo description</p>
                            <span>$1,200/mo</span>
                            <span>3 Months</span>
                            <button>View Details</button>
                            <button>Apply Now</button>
                        </div>

                        <div class="card-premium p-4 job-item-card mb-4">
                            <h5>UI/UX Designer Intern</h5>
                            <span>FigmaLab Studios</span>
                            <p>Original demo description</p>
                            <span>$1,400/mo</span>
                            <span>6 Months</span>
                            <button>View Details</button>
                            <button>Apply Now</button>
                        </div>

                        <div class="card-premium p-4 job-item-card mb-4">
                            <h5>Social Media Marketing Intern</h5>
                            <span>GrowthHack Inc.</span>
                            <p>Original demo description</p>
                            <span>$1,000/mo</span>
                            <span>3 Months</span>
                            <button>View Details</button>
                            <button>Apply Now</button>
                        </div>
                        --%>

                        <!-- Database-Bound Internship Cards -->
                        <asp:DataList ID="dlInternships" runat="server"
                            RepeatLayout="Flow"
                            Width="100%">

                            <ItemTemplate>

                                <div class="card-premium p-4 job-item-card mb-4">

                                    <div class="d-flex gap-3 mb-3">

                                        <!-- Internship Icon -->
                                        <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center flex-shrink-0"
                                            style="width: 60px; height: 60px;">
                                            <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
                                        </div>

                                        <!-- Internship Information -->
                                        <div class="flex-grow-1 min-width-0">

                                            <div class="d-flex justify-content-between align-items-start gap-2">
                                                <h5 class="fw-bold text-secondary mb-1 text-truncate">
                                                    <%#: Eval("Title") %>
                                                </h5>
                                            </div>

                                            <div class="d-flex align-items-center gap-2 flex-wrap mb-2">
                                                <span class="text-primary fw-semibold fs-7">
                                                    <i class="fa-solid fa-building me-1"></i>
                                                    <%#: Eval("CompanyName") %>
                                                </span>

                                                <span class="badge bg-light-primary text-primary px-2 py-0.5 rounded-2 fs-9">
                                                    <i class="fa-solid fa-location-dot me-1 animate-icon-pin"></i>
                                                    <%#: Eval("Location") %>
                                                </span>
                                            </div>

                                            <p class="text-muted fs-8 mb-3 leading-relaxed">
                                                <%#: Eval("Description") %>
                                            </p>

                                            <div class="d-flex flex-wrap gap-1">
                                                <span class="badge-skill">
                                                    <%#: Eval("RequiredSkills") %>
                                                </span>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Internship Footer -->
                                    <div class="border-top pt-3 d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">

                                        <div class="d-flex flex-wrap gap-3 fs-8 text-muted">

                                            <span class="d-inline-flex align-items-center">
                                                <i class="fa-solid fa-hand-holding-dollar text-primary me-1.5"></i>
                                                <strong><%#: Eval("Stipend") %></strong>/month
                                            </span>

                                            <span class="text-light-border d-none d-sm-inline">|</span>

                                            <span class="d-inline-flex align-items-center">
                                                <i class="fa-regular fa-clock text-primary me-1.5"></i>
                                                <strong><%#: Eval("Duration") %> Months</strong>
                                            </span>

                                            <span class="text-light-border d-none d-sm-inline">|</span>

                                            <span class="d-inline-flex align-items-center">
                                                <i class="fa-regular fa-calendar-days text-primary me-1.5"></i>
                                                Deadline:
                                               
                                                <strong>
                                                    <%# Eval("Deadline") == DBNull.Value ? "Not specified" : Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %>
                                                </strong>
                                            </span>

                                        </div>

                                        <!-- Action Buttons -->
                                        <div class="d-flex gap-2 justify-content-end">

                                            <asp:HyperLink ID="lnkViewDetails" runat="server"
                                                NavigateUrl='<%# "~/internship-details.aspx?InternshipID=" + Eval("InternshipID") %>'
                                                CssClass="btn btn-outline-secondary btn-sm px-3 rounded-3 fs-8 py-2">
                                                View Details
                                            </asp:HyperLink>

                                            <asp:HyperLink ID="lnkApply" runat="server"
                                                NavigateUrl='<%# "~/apply-internship.aspx?InternshipID=" + Eval("InternshipID") %>'
                                                CssClass="btn btn-primary btn-sm px-4 rounded-3 shadow-sm fs-8 py-2">
                                                Apply Now
                                            </asp:HyperLink>

                                        </div>

                                    </div>
                                </div>

                            </ItemTemplate>

                        </asp:DataList>

                        <!-- No Results Message -->
                        <asp:Panel ID="pnlNoInternships" runat="server"
                            Visible="false"
                            CssClass="alert alert-info">
                            No internships found. Please try different filters.
                       
                        </asp:Panel>

                        <%-- Original static pagination commented out:
                        <div class="pagination-custom mt-4">
                            <span class="pagination-info">Showing page 1 of 5 pages</span>
                            <ul class="pagination-pages">
                                <li class="pagination-page-item disabled">
                                    <a href="#" class="pagination-page-link">Previous</a>
                                </li>
                                <li class="pagination-page-item active">
                                    <a href="#" class="pagination-page-link">1</a>
                                </li>
                                <li class="pagination-page-item">
                                    <a href="#" class="pagination-page-link">2</a>
                                </li>
                                <li class="pagination-page-item">
                                    <a href="#" class="pagination-page-link">3</a>
                                </li>
                            </ul>
                        </div>
                        --%>
                    </div>
                </div>
            </div>
        </section>

    </main>

</asp:Content>

