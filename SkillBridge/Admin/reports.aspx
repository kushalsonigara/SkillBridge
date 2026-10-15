<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="SkillBridge.Admin.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
    /* ==========================================
       SKILLBRIDGE REPORT CENTER
    ========================================== */

    .dashboard-inner {
        color: #e2e8f0;
    }

    /* Report Header */

    .report-header {
        background: linear-gradient(120deg, #172554, #1d4ed8);
        color: #ffffff;
        padding: 28px 30px;
        border: 1px solid #263b70;
        border-radius: 14px;
        margin-bottom: 25px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
    }

    .report-header h2 {
        color: #ffffff !important;
        font-size: 27px;
        letter-spacing: -0.4px;
    }

    .report-header p {
        color: #dbeafe;
        font-size: 15px;
    }

    /* Filter Panel */

    .report-filter-card,
    .report-preview-card {
        background: #111827;
        border: 1px solid #263449;
        border-radius: 14px;
        padding: 25px;
        margin-bottom: 24px;
        box-shadow: 0 8px 22px rgba(0, 0, 0, 0.12);
    }

    .report-filter-card h5,
    .report-preview-card h4 {
        color: #f1f5f9 !important;
    }

    .report-label {
        display: block;
        color: #cbd5e1;
        font-size: 13px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    /* Input Controls */

    .report-control {
        width: 100%;
        min-height: 43px;
        padding: 10px 12px;
        color: #e2e8f0;
        background-color: #0b1220;
        border: 1px solid #334155;
        border-radius: 8px;
        outline: none;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .report-control:focus {
        color: #ffffff;
        background-color: #0b1220;
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
    }

    .report-control option {
        color: #e2e8f0;
        background: #111827;
    }

    /* Buttons */

    .report-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .report-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 11px 17px;
        min-height: 42px;
        border: 1px solid transparent;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s, transform 0.2s;
    }

    .report-btn:hover {
        transform: translateY(-1px);
    }

    .report-primary {
        color: #ffffff;
        background: #2563eb;
    }

    .report-primary:hover {
        color: #ffffff;
        background: #1d4ed8;
    }

    .report-success {
        color: #ffffff;
        background: #059669;
    }

    .report-success:hover {
        color: #ffffff;
        background: #047857;
    }

    .report-secondary {
        color: #e2e8f0;
        background: #263449;
        border-color: #334155;
    }

    .report-secondary:hover {
        color: #ffffff;
        background: #334155;
    }

    /* Messages */

    .report-message {
        display: block;
        margin-top: 15px;
        color: #93c5fd;
        font-size: 13px;
        font-weight: 500;
        overflow-wrap: anywhere;
    }

    /* Report Count */

    #ContentPlaceHolder2_lblRecordCount {
        display: inline-block;
        color: #bfdbfe;
        background: #1e3a8a;
        border: 1px solid #1d4ed8;
        border-radius: 7px;
        padding: 8px 12px;
        font-size: 12px;
        font-weight: 600;
    }

    .report-preview-card .text-muted {
        color: #94a3b8 !important;
    }

    /* Report Table */

    .report-table {
        width: 100%;
        margin-top: 18px;
        border-collapse: separate;
        border-spacing: 0;
        color: #dbe4f0;
        background: #111827;
        font-size: 13px;
    }

    .report-table th {
        color: #cbd5e1 !important;
        background: #1e293b !important;
        padding: 14px 13px;
        border-bottom: 1px solid #334155;
        white-space: nowrap;
        font-weight: 600;
    }

    .report-table td {
        color: #dbe4f0 !important;
        background: #111827 !important;
        padding: 13px;
        border-bottom: 1px solid #263449;
        overflow-wrap: anywhere;
        vertical-align: middle;
    }

    .report-table tr:hover td {
        background: #172338 !important;
    }

    .report-table tr:last-child td {
        border-bottom: none;
    }

    .report-table tr td[colspan] {
        color: #94a3b8 !important;
        text-align: center;
        padding: 25px;
    }

    /* Breadcrumb */

    .breadcrumb-custom {
        margin-bottom: 22px;
    }

    .breadcrumb-custom .breadcrumb-item,
    .breadcrumb-custom .breadcrumb-item.active {
        color: #94a3b8;
    }

    .breadcrumb-custom a {
        color: #60a5fa;
        text-decoration: none;
    }

    .breadcrumb-custom a:hover {
        color: #93c5fd;
    }

    .breadcrumb-item + .breadcrumb-item::before {
        color: #475569;
    }

    /* ==========================================
       PRINT BRANDING
    ========================================== */

    .print-brand {
        display: none;
        align-items: center;
        gap: 12px;
        margin-bottom: 18px;
    }

    .print-brand-icon {
        width: 44px;
        height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #2563eb;
        color: #ffffff;
        border-radius: 10px;
        font-size: 22px;
    }

    .print-brand h3 {
        margin: 0;
        color: #2563eb;
        font-weight: 800;
        font-size: 24px;
    }

    .print-brand p {
        margin: 3px 0 0;
        color: #64748b;
        font-size: 12px;
    }

    .print-divider {
        display: none;
        border: 0;
        border-top: 2px solid #2563eb;
        margin: 0 0 24px;
    }

    /* Responsive */

    @media (max-width: 768px) {
        .report-header {
            padding: 21px;
        }

        .report-header h2 {
            font-size: 23px;
        }

        .report-filter-card,
        .report-preview-card {
            padding: 17px;
        }

        .report-actions {
            flex-direction: column;
        }

        .report-btn {
            width: 100%;
        }

        .report-table {
            font-size: 12px;
        }

        .report-table th,
        .report-table td {
            padding: 10px;
        }
    }

    /* ==========================================
       PRINT / SAVE AS PDF
    ========================================== */

    @media print {

        @page {
            size: A4 landscape;
            margin: 15mm;
        }

        body {
            color: #111827 !important;
            background: #ffffff !important;
            font-family: Arial, sans-serif !important;
            font-size: 10pt !important;
        }

        /* Hide website controls */

        .report-header,
        .report-filter-card,
        .breadcrumb-custom,
        .report-actions,
        .report-message,
        .sidebar,
        .navbar,
        header,
        footer,
        nav {
            display: none !important;
        }

        /* Hide everything except the report */

        body * {
            visibility: hidden !important;
        }

        .report-preview-card,
        .report-preview-card * {
            visibility: visible !important;
        }

        .report-preview-card {
            position: absolute !important;
            left: 0 !important;
            top: 0 !important;
            width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            border: none !important;
            border-radius: 0 !important;
            box-shadow: none !important;
            background: #ffffff !important;
        }

        /* Show SkillBridge logo and branding */

        .print-brand {
            display: flex !important;
            align-items: center !important;
        }

        .print-brand-icon {
            background: #2563eb !important;
            color: #ffffff !important;
            print-color-adjust: exact;
            -webkit-print-color-adjust: exact;
        }

        .print-brand h3 {
            color: #2563eb !important;
            font-size: 24pt !important;
        }

        .print-brand p {
            color: #64748b !important;
        }

        .print-divider {
            display: block !important;
            border-top: 2px solid #2563eb !important;
        }

        .report-preview-card h4 {
            color: #111827 !important;
            font-size: 20pt !important;
            margin-bottom: 5px !important;
        }

        .report-preview-card .text-muted {
            color: #475569 !important;
        }

        #ContentPlaceHolder2_lblRecordCount {
            color: #111827 !important;
            background: #ffffff !important;
            border: 1px solid #94a3b8 !important;
        }

        .table-responsive {
            overflow: visible !important;
        }

        .report-table {
            width: 100% !important;
            border-collapse: collapse !important;
            font-size: 8pt !important;
            margin-top: 20px !important;
        }

        .report-table th {
            background: #e2e8f0 !important;
            color: #111827 !important;
            border: 1px solid #cbd5e1 !important;
            padding: 8px !important;
            white-space: normal !important;
        }

        .report-table td {
            background: #ffffff !important;
            color: #111827 !important;
            border: 1px solid #cbd5e1 !important;
            padding: 8px !important;
            overflow-wrap: anywhere !important;
        }

        .report-table tr {
            page-break-inside: avoid;
        }

        a {
            color: #111827 !important;
            text-decoration: none !important;
        }
    }
</style>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
  

    <div class="dashboard-inner">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom">
                    <a href="admin-dashboard.aspx">Dashboard</a>
                </li>

                <li class="breadcrumb-item breadcrumb-item-custom active"
                    aria-current="page">
                    Report Center
                </li>
            </ol>
        </nav>

        <!-- Page Header -->
        <div class="report-header">
            <h2 class="fw-bold mb-2">
                <i class="fa-solid fa-file-lines me-2"></i>
                Report Center
            </h2>

            <p class="mb-0">
                View, filter, and download SkillBridge platform reports.
            </p>
        </div>

        <!-- Report Selection and Filters -->
        <div class="report-filter-card">

            <h5 class="fw-bold text-secondary mb-4">
                <i class="fa-solid fa-filter me-2"></i>
                Configure Your Report
            </h5>

            <div class="row g-3">

                <!-- Report Type -->
                <div class="col-md-6 col-lg-4">

                    <label class="report-label">Report Type</label>

                    <asp:DropDownList ID="ddlReportType" runat="server"
                        CssClass="report-control">

                        <asp:ListItem Value="Applications">
                            Application Report
                        </asp:ListItem>

                        <asp:ListItem Value="Students">
                            Student Report
                        </asp:ListItem>

                        <asp:ListItem Value="Companies">
                            Company Report
                        </asp:ListItem>

                        <asp:ListItem Value="Internships">
                            Internship Report
                        </asp:ListItem>

                        <asp:ListItem Value="Selection">
                            Selection Report
                        </asp:ListItem>

                        <asp:ListItem Value="Registrations">
                            Registration Report
                        </asp:ListItem>

                        <asp:ListItem Value="Contacts">
                            Contact Messages Report
                        </asp:ListItem>

                        <asp:ListItem Value="Performance">
                            Internship Performance Report
                        </asp:ListItem>

                    </asp:DropDownList>

                </div>

                <!-- From Date -->
                <div class="col-md-6 col-lg-4">

                    <label class="report-label">From Date</label>

                    <asp:TextBox ID="txtFromDate" runat="server"
                        TextMode="Date" CssClass="report-control">
                    </asp:TextBox>

                </div>

                <!-- To Date -->
                <div class="col-md-6 col-lg-4">

                    <label class="report-label">To Date</label>

                    <asp:TextBox ID="txtToDate" runat="server"
                        TextMode="Date" CssClass="report-control">
                    </asp:TextBox>

                </div>

                <!-- Application Status -->
                <div class="col-md-6 col-lg-4">

                    <label class="report-label">Application Status</label>

                    <asp:DropDownList ID="ddlStatus" runat="server"
                        CssClass="report-control">

                        <asp:ListItem Value="">All Statuses</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="Accepted">Accepted</asp:ListItem>
                        <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                        <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>

                    </asp:DropDownList>

                </div>

            </div>

            <!-- Action Buttons -->
            <div class="report-actions mt-4">

                <asp:Button ID="btnViewReport" runat="server"
                    Text="View Report"
                    CssClass="report-btn report-primary"
                    OnClick="btnViewReport_Click" />

                <asp:Button ID="btnDownloadCSV" runat="server"
                    Text="Download CSV"
                    CssClass="report-btn report-success"
                    OnClick="btnDownloadCSV_Click" />

                <asp:Button ID="btnPrintReport" runat="server"
                    Text="Print / Save as PDF"
                    CssClass="report-btn report-secondary"
                    OnClientClick="window.print(); return false;" />

            </div>

            <asp:Label ID="lblReportMessage" runat="server"
                CssClass="report-message" EnableViewState="false">
            </asp:Label>

        </div>

        <!-- Report Preview -->
        <div class="report-preview-card">

            <!-- SkillBridge Branding: Printed Report Only -->
            <div class="print-brand">

                <div class="print-brand-icon">
                    <i class="fa-solid fa-graduation-cap"></i>
                </div>

                <div>
                    <h3>SkillBridge</h3>
                    <p>Internship Management Portal</p>
                </div>

            </div>

            <hr class="print-divider" />

            <!-- Report Title and Record Count -->
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">

                <div>
                    <h4 class="fw-bold text-secondary mb-1">

                        <asp:Label ID="lblReportTitle" runat="server"
                            Text="Application Report">
                        </asp:Label>

                    </h4>

                    <p class="text-muted mb-0">
                        Database report preview
                    </p>

                </div>

                <span class="badge bg-primary px-3 py-2">

                    <asp:Label ID="lblRecordCount" runat="server"
                        Text="0 Records">
                    </asp:Label>

                </span>

            </div>

            <!-- Report Data Table -->
            <div class="table-responsive mt-3">

                <asp:GridView ID="gvReport" runat="server"
                    AutoGenerateColumns="True"
                    CssClass="report-table"
                    GridLines="None"
                    EmptyDataText="No records found for the selected filters."
                    ShowHeaderWhenEmpty="True"
                    HeaderStyle-CssClass="table-light"
                    RowStyle-CssClass="align-middle">
                </asp:GridView>

            </div>

        </div>

    </div>


    </asp:Content>


