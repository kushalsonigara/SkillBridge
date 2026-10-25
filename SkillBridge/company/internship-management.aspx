<%@ Page Title="" Language="C#" MasterPageFile="~/company/company.Master" AutoEventWireup="true" CodeBehind="internship-management.aspx.cs" Inherits="SkillBridge.company.internship_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="company-dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Manage Internships
                </li>
            </ol>
        </nav>

        <!-- Page Heading -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">Manage Posted Opportunities</h2>
                <p class="text-muted mb-0">Review metrics, edit descriptions, or remove active listings</p>
            </div>

            <a href="add-internship.aspx" class="btn btn-primary">
                <i class="fa-solid fa-circle-plus me-2"></i>Post New Opportunity
            </a>
        </div>

        <!-- Search Toolbar -->

        <%-- Original HTML search input replaced with ASP.NET TextBox --%>
        <%--
        <input type="text" class="form-control form-control-custom"
               placeholder="Search internships...">
        --%>

        <div class="table-toolbar">
            <div class="input-group max-width-350">
                <span class="input-group-text bg-white border-end-0">
                    <i class="fa-solid fa-magnifying-glass text-muted"></i>
                </span>

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="form-control form-control-custom border-start-0 ps-1 fs-8"
                    placeholder="Search internships..."
                    AutoPostBack="true"
                    OnTextChanged="txtSearch_TextChanged">
                </asp:TextBox>
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3"></asp:Label>

        <!-- Internship GridView -->
        <div class="table-responsive-custom">

            <asp:GridView ID="gvInternships" runat="server"
                AutoGenerateColumns="False"
                CssClass="table-custom"
                GridLines="None"
                Width="100%"
                DataKeyNames="InternshipID"
                EmptyDataText="No internships found."
                OnRowCommand="gvInternships_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Internship Title">
                        <ItemTemplate>
                            <strong class="text-secondary d-block">
                                <%# Eval("Title") %>
                            </strong>
                            <span class="text-muted fs-8">Posted <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <span class="badge bg-light-primary text-primary px-2 py-1 fs-9 rounded-2">
                                <%# Eval("Location") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Stipend">
                        <ItemTemplate>
                            <strong class="text-dark">
                                <%# Eval("Stipend", "{0:N2}") %>
                            </strong>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Duration" HeaderText="Duration" />

                    <asp:TemplateField HeaderText="Applicants">
                        <ItemTemplate>
                            <span class="badge bg-light-info text-info px-2 py-1 fs-9 rounded-pill fw-bold">
                                <i class="fa-solid fa-user-group me-1"></i>
                                <%# Eval("Applicants") %> Applicants
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemStyle HorizontalAlign="Right" />

                        <ItemTemplate>

                            <asp:HyperLink ID="lnkApplicants" runat="server"
                                NavigateUrl='<%# "applicants.aspx?InternshipID=" + Eval("InternshipID") %>'
                                CssClass="btn btn-light btn-sm text-primary fw-bold me-1"
                                ToolTip="View Applicants">
                                <i class="fa-solid fa-user-group"></i>
                            </asp:HyperLink>

                            <asp:HyperLink ID="lnkEdit" runat="server"
                                NavigateUrl='<%# "add-internship.aspx?edit=true&InternshipID=" + Eval("InternshipID") %>'
                                CssClass="btn btn-light btn-sm text-warning fw-bold me-1"
                                ToolTip="Edit Listing">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </asp:HyperLink>

                            <asp:LinkButton ID="btnDelete" runat="server"
                                CommandName="DeleteInternship"
                                CommandArgument='<%# Eval("InternshipID") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this internship?');"
                                CssClass="btn btn-light btn-sm text-danger fw-bold"
                                ToolTip="Delete Listing">
                                <i class="fa-solid fa-trash-can"></i>
                            </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>
</asp:Content>

