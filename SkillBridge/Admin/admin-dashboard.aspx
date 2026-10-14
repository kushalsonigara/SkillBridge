<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="SkillBridge.Admin.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="../index.aspx">Home</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">Admin Dashboard</li>
            </ol>
        </nav>

        <!-- Welcome title -->
        <div class="mb-4">
            <h2 class="fw-bold text-secondary mb-1">Global Platform Statistics</h2>
            <p class="text-muted mb-0">Overview of student candidate registrations, employer postings, and visual metrics.</p>
        </div>

        <!-- Admin stat cards -->
        <div class="row g-4 mb-4">
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Students</h6>
                        <h2>
                            <asp:Label ID="lblStudents" runat="server" Text="0"></asp:Label>
                        </h2>
                        <%-- <h2>4,800</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-primary">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Companies</h6>
                        <h2>
                            <asp:Label ID="lblCompanies" runat="server" Text="0"></asp:Label>
                        </h2>
                        <%--<h2>320</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-success">
                        <i class="fa-solid fa-building"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Internships</h6>
                        <h2>
                            <asp:Label ID="lblInternships" runat="server" Text="N/A"></asp:Label>
                        </h2>
                        <%--<h2>1,250</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-info">
                        <i class="fa-solid fa-briefcase"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Applications</h6>
                        <h2>
                            <asp:Label ID="lblApplications" runat="server" Text="N/A"></asp:Label>
                        </h2>
                        <%--<h2>12.4k</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-primary">
                        <i class="fa-solid fa-folder-open"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Accepted</h6>
                        <h2 class="text-success">
                            <asp:Label ID="lblAccepted" runat="server" Text="N/A"></asp:Label>
                        </h2>
                        <%--<h2 class="text-success">4.8k</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-success">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-sm-6">
                <div class="card-stat">
                    <div class="card-stat-info">
                        <h6>Rejected</h6>
                        <h2 class="text-danger">
                            <asp:Label ID="lblRejected" runat="server" Text="N/A"></asp:Label>
                        </h2>
                        <%--<h2 class="text-danger">1.5k</h2>--%>
                    </div>
                    <div class="card-stat-icon bg-light-danger">
                        <i class="fa-solid fa-circle-xmark"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts row -->
        
<!-- Recent Registrations and Contact Messages -->
<div class="row g-4 mb-4">

    <!-- Recent Registrations -->
    <div class="col-lg-6">
        <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
            <h5 class="fw-bold text-secondary mb-4">
                Recent Registrations
            </h5>

            <div class="table-responsive">
                <asp:GridView ID="gvRecentRegistrations" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle mb-0 text-secondary"
                    GridLines="None"
                    EmptyDataText="No registrations found.">
                    <Columns>
                        <asp:BoundField DataField="FullName"
                            HeaderText="Name" />
                        <asp:BoundField DataField="Role"
                            HeaderText="Role" />
                        <asp:BoundField DataField="CreatedAt"
                            HeaderText="Registered"
                            DataFormatString="{0:dd MMM yyyy}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- Recent Contact Messages -->
    <div class="col-lg-6">
        <div class="bg-white border rounded-3 p-4 shadow-sm h-100">
            <h5 class="fw-bold text-secondary mb-4">
                Recent Contact Messages
            </h5>

            <div class="table-responsive">
                <asp:GridView ID="gvRecentMessages" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle mb-0 text-secondary"
                    GridLines="None"
                    EmptyDataText="No contact messages found.">
                    <Columns>
                        <asp:BoundField DataField="FullName"
                            HeaderText="Name" />
                        <asp:BoundField DataField="Subject"
                            HeaderText="Subject" />
                        <asp:BoundField DataField="CreatedAt"
                            HeaderText="Received"
                            DataFormatString="{0:dd MMM yyyy}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</div>


        

    </div>
</asp:Content>

