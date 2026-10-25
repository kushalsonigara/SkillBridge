<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="apply-internship.aspx.cs" Inherits="SkillBridge.student.apply_internship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
     <div class="container py-5">

        <div class="page-header-bg rounded-4 p-4 mb-4">
            <h2>Apply for Internship</h2>
            <p class="text-secondary mb-0">
                Review the opportunity and submit your application.
            </p>
        </div>

        <div class="row g-4">

            <div class="col-lg-7">
                <div class="card-premium p-4 h-100">

                    <h4 class="mb-4">Internship Details</h4>

                    <h3>
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </h3>

                    <p class="text-secondary">
                        <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                    </p>

                    <hr />

                    <div class="mb-3">
                        <strong>Location</strong>
                        <p>
                            <asp:Label ID="lblLocation" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="row g-3">

                        <div class="col-md-6">
                            <strong>Monthly Stipend</strong>
                            <p>
                                ₹<asp:Label ID="lblStipend" runat="server"></asp:Label>
                            </p>
                        </div>

                        <div class="col-md-6">
                            <strong>Duration</strong>
                            <p>
                                <asp:Label ID="lblDuration" runat="server"></asp:Label>
                            </p>
                        </div>

                    </div>

                    <div class="mb-3">
                        <strong>Application Deadline</strong>
                        <p>
                            <asp:Label ID="lblDeadline" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="mb-3">
                        <strong>Required Skills</strong>
                        <p>
                            <asp:Label ID="lblSkills" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="mb-3">
                        <strong>Description</strong>
                        <p>
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </p>
                    </div>

                </div>
            </div>

            <div class="col-lg-5">
                <div class="card-premium p-4">

                    <h4 class="mb-4">Your Application</h4>

                    <div class="mb-3">
                        <label>Full Name</label>
                        <asp:Label ID="lblStudentName" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label>College</label>
                        <asp:Label ID="lblCollege" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label>Course</label>
                        <asp:Label ID="lblCourse" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label>Skills</label>
                        <asp:Label ID="lblStudentSkills" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label>Cover Letter</label>
                        <asp:TextBox ID="txtCoverLetter" runat="server"
                            TextMode="MultiLine" Rows="6"
                            CssClass="form-control"
                            placeholder="Explain your skills, relevant projects, and why you want this internship."></asp:TextBox>
                    </div>

                    <asp:Button ID="btnApply" runat="server"
                        Text="Submit Application"
                        CssClass="btn btn-primary w-100"
                        OnClick="btnApply_Click" />

                    <div class="mt-3">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>

                    <a href="my-applications.aspx"
                        class="btn btn-outline-secondary w-100 mt-3">
                        View My Applications
                    </a>

                </div>
            </div>

        </div>

    </div>
</asp:Content>

