<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="my-applications.aspx.cs" Inherits="SkillBridge.student.my_applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
     <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="student-dashboard.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">
                    My Applications
                </li>
            </ol>
        </nav>

        <!-- Page Heading -->
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold text-secondary mb-1">My Applications</h2>
                <p class="text-muted mb-0">Review status updates for all submitted applications</p>
            </div>

            <a href="../internship-list.aspx" class="btn btn-primary">
                <i class="fa-solid fa-magnifying-glass me-2"></i>Apply for More
            </a>
        </div>

        <!-- Table Toolbar -->
        <div class="table-toolbar">

            <div class="d-flex align-items-center gap-2 flex-grow-1 max-width-350">
                <div class="input-group">
                    <span class="input-group-text bg-white border-end-0">
                        <i class="fa-solid fa-magnifying-glass text-muted"></i>
                    </span>

                    <asp:TextBox ID="txtSearch" runat="server"
                        CssClass="form-control form-control-custom ps-1 border-start-0 fs-8"
                        placeholder="Search table..."
                        AutoPostBack="true"
                        OnTextChanged="txtSearch_TextChanged">
                    </asp:TextBox>
                </div>
            </div>

            <div class="d-flex align-items-center gap-2">
                <span class="fs-8 text-muted text-nowrap d-none d-sm-inline">Filter Status</span>

                <asp:DropDownList ID="ddlStatus" runat="server"
                    CssClass="form-select form-select-sm fs-8 border-light rounded-3 bg-white"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">

                    <asp:ListItem Text="All Statuses" Value=""></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Under Review" Value="Under Review"></asp:ListItem>
                    <asp:ListItem Text="Interview" Value="Interview"></asp:ListItem>
                    <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                    <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>

                </asp:DropDownList>
            </div>

        </div>

        <!-- Applications Table -->
        <div class="table-responsive-custom">

            <asp:GridView ID="gvApplications" runat="server"
                AutoGenerateColumns="False"
                CssClass="table-custom"
                GridLines="None"
                Width="100%"
                EmptyDataText="You have not applied for any internships yet."
                DataKeyNames="ApplicationID">

                <Columns>

                    <asp:TemplateField HeaderText="Internship Position">
                        <ItemTemplate>
                            <strong class="text-secondary d-block">
                                <%# Eval("Title") %>
                            </strong>
                            <span class="text-muted fs-8">
                                <%# Eval("Location") %> |
                                <%# Eval("Duration") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <span class="fw-medium text-dark">
                                <i class="fa-solid fa-building text-primary me-2"></i>
                                <%# Eval("CompanyName") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Applied Date">
                        <ItemTemplate>
                            <%# Eval("ApplicationDate", "{0:dd MMM yyyy}") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# "status-badge " + (Eval("Status").ToString() == "Accepted" ? "status-badge-accepted" : Eval("Status").ToString() == "Rejected" ? "status-badge-rejected" : Eval("Status").ToString() == "Interview" ? "status-badge-interview" : "status-badge-pending") %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkTrack" runat="server"
                                NavigateUrl='<%# "~/student/track-application.aspx?id=" + Eval("ApplicationID") %>'
                                CssClass="btn btn-outline-primary btn-sm px-3 rounded-2">
                                <i class="fa-solid fa-route me-1"></i>Track Flow
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="text-muted d-block text-center mt-3">
            </asp:Label>

        </div>

        <!-- Original Static HTML Table Commented Out

        <div class="table-responsive-custom">
            <table class="table-custom">
                <thead>
                    <tr>
                        <th>Internship Position</th>
                        <th>Company</th>
                        <th>Applied Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    Original four static sample rows removed from display.
                </tbody>
            </table>
        </div>

        -->

        <!-- Original Pagination Commented Out
        <div class="pagination-custom">
            <span class="pagination-info">Showing entries 1 - 4 of 4</span>
            <ul class="pagination-pages">
                <li class="pagination-page-item disabled">
                    <a href="#" class="pagination-page-link">Previous</a>
                </li>
                <li class="pagination-page-item active">
                    <a href="#" class="pagination-page-link">1</a>
                </li>
                <li class="pagination-page-item disabled">
                    <a href="#" class="pagination-page-link">Next</a>
                </li>
            </ul>
        </div>
        -->

    </div>
</asp:Content>

