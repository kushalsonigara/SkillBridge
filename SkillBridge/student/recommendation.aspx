<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="recommendation.aspx.cs" Inherits="SkillBridge.student.recommendation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="student-dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Recommendations
                </li>
            </ol>
        </nav>

        <!-- Page Welcome Title -->
        <div class="mb-4">
            <h2 class="fw-bold text-secondary mb-1">
                <i class="fa-solid fa-sparkles text-primary me-2 animate-pulse"></i>
                Recommended Openings
            </h2>

            <p class="text-muted mb-0">
                These positions are ranked according to your profile skills.
               
                <asp:Label ID="lblStudentSkills" runat="server"></asp:Label>
            </p>
        </div>

        <!-- Original Static Recommendation Cards Commented Out

        <div class="row g-4">

            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4">
                    <h5>Frontend Developer</h5>
                    <span>TechSphere Solutions</span>
                    <p>Static demo recommendation.</p>
                    <a href="../internship-list.aspx">Apply Now</a>
                </div>
            </div>

            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4">
                    <h5>UI/UX Designer</h5>
                    <span>FigmaLab Studios</span>
                    <p>Static demo recommendation.</p>
                    <a href="../internship-list.aspx">Apply Now</a>
                </div>
            </div>

            <div class="col-lg-6 col-xl-4">
                <div class="card-premium h-100 p-4">
                    <h5>Software Intern</h5>
                    <span>Stripe Inc.</span>
                    <p>Static demo recommendation.</p>
                    <a href="../internship-list.aspx">Apply Now</a>
                </div>
            </div>

        </div>

        End of Original Static Recommendation Cards -->

        <!-- Dynamic Recommendation Cards -->
        <div class="row g-4">

            <asp:DataList ID="dlRecommendations" runat="server"
                RepeatColumns="3"
                RepeatDirection="Horizontal"
                CssClass="w-100"
                ItemStyle-VerticalAlign="Top">

                <ItemTemplate>

                    <div class="col-lg-6 col-xl-4 mb-4">

                        <div class="card-premium h-100 p-4 d-flex flex-column position-relative overflow-hidden">

                            <!-- Match Percentage -->
                            <div class="position-absolute" style="top: 0; right: 0;">
                                <div class="bg-primary text-white fs-9 fw-bold px-3 py-1 rounded-bottom-start shadow-sm">
                                    <i class="fa-solid fa-fire me-1"></i>
                                    <%#: Eval("MatchPercentage") %>% Match
                               
                                </div>
                            </div>

                            <!-- Internship Title and Company -->
                            <div class="d-flex align-items-center gap-3 mb-3 mt-2">

                                <div class="bg-light border rounded-3 d-flex align-items-center justify-content-center"
                                    style="width: 50px; height: 50px; flex-shrink: 0;">
                                    <i class="fa-solid fa-laptop-code text-primary fa-lg"></i>
                                </div>

                                <div>
                                    <h5 class="card-title fw-bold mb-0">
                                        <%#: Eval("Title") %>
                                    </h5>

                                    <span class="text-muted fs-8">
                                        <%#: Eval("CompanyName") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Internship Description -->
                            <p class="text-muted fs-8 mb-3">
                                <%#: Eval("Description") %>
                            </p>

                            <!-- Matching Skills -->
                            <div class="mb-3">

                                <span class="badge-skill me-1 mb-1 bg-success text-white">Matching Skills
                                </span>

                                <span class="text-muted fs-8">
                                    <%#: Eval("MatchedSkills") %>
                                </span>

                            </div>

                            <!-- Internship Details -->
                            <div class="mb-3">

                                <span class="badge bg-light text-dark me-1 mb-1">
                                    <i class="fa-solid fa-location-dot me-1"></i>
                                    <%#: Eval("Location") %>
                                </span>

                                <span class="badge bg-light text-dark me-1 mb-1">
                                    <%#: Eval("InternshipType") %>
                                </span>

                                <span class="badge bg-light text-dark me-1 mb-1">
                                    <%#: Eval("Duration") %>
                                </span>

                            </div>


                            <!-- Stipend and Action Buttons -->
                            <div class="border-top pt-3 mt-auto d-flex justify-content-between align-items-center">

                                <div>
                                    <span class="d-block text-muted fs-9">STIPEND</span>

                                    <span class="fw-bold text-secondary fs-8">
                                        <%#: Eval("Stipend") %>
                                    </span>
                                </div>

                                <div class="d-flex gap-2">

                                    <asp:Button ID="btnViewMore" runat="server"
                                        Text="View More"
                                        CssClass="btn btn-outline-primary btn-sm px-3 rounded-2"
                                        CommandArgument='<%# Eval("InternshipID") %>'
                                        OnClick="btnViewMore_Click" />

                                    <asp:Button ID="btnApplyNow" runat="server"
                                        Text="Apply Now"
                                        CssClass="btn btn-primary btn-sm px-3 rounded-2 shadow-sm"
                                        CommandArgument='<%# Eval("InternshipID") %>'
                                        OnClick="btnApplyNow_Click" />

                                </div>

                            </div>


                        </div>

                    </div>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </div>
</asp:Content>

