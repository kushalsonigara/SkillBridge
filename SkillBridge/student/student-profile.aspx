<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="student-profile.aspx.cs" Inherits="SkillBridge.student.student_profile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Dashboard Inner Panel -->
    <div class="dashboard-inner">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="breadcrumb-custom">
            <ol class="breadcrumb">
                <li class="breadcrumb-item breadcrumb-item-custom"><a href="student-dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item breadcrumb-item-custom active" aria-current="page">My Profile</li>
            </ol>
        </nav>

        <h2 class="fw-bold text-secondary mb-4">Edit Profile Settings</h2>

        <!-- Profile Edit Form -->
        <div class="needs-validation-custom">
            <div class="row g-4">

                <!-- Sidebar: Avatar and resume -->
                <div class="col-lg-4">
                    <div class="d-flex flex-column gap-4">
                        <!-- Avatar card -->
                        <div class="bg-white border rounded-3 p-4 text-center shadow-sm">
                            <div class="profile-image-upload">
                                <!-- Default user SVG / placeholder -->
                                <div style="width: 114px; height: 114px; background-color: #E2E8F0;" class="rounded-circle d-flex align-items-center justify-content-center mx-auto">
                                    <i class="fa-solid fa-user text-muted fa-4x"></i>
                                </div>
                                <%--<label for="avatar-file" class="profile-image-upload-btn">--%>
                                <span class="profile-image-upload-btn">
                                    <i class="fa-solid fa-camera"></i>
                                </span>
                                <%--                                <input type="file" id="avatar-file" accept="image/*" onchange="alert('New profile picture selected.')">--%>
                            </div>

                            <h5 class="fw-bold text-secondary mb-1">
                                <asp:Label ID="lblStudentName" runat="server" />
                            </h5>

                            <p class="text-muted fs-8 mb-3">
                                Student at
                                <asp:Label ID="lblStudentCollege" runat="server" />
                            </p>

                            <span class="badge bg-light-primary text-primary px-3 py-1.5 rounded-3 fw-bold fs-9">Profile Score:
                                <asp:Label ID="lblProfileScore" runat="server" Text="0%" />
                            </span>

                            <%--     <h5 class="fw-bold text-secondary mb-1">John Doe</h5>
                            <p class="text-muted fs-8 mb-3">Student at Stanford University</p>
                            <span class="badge bg-light-primary text-primary px-3 py-1.5 rounded-3 fw-bold fs-9">Profile Score: 85%</span>--%>
                        </div>

                        <!-- Resume Upload Card -->
                        <div class="bg-white border rounded-3 p-4 shadow-sm">
                            <h5 class="fw-bold text-secondary mb-3"><i class="fa-solid fa-file-pdf me-2 text-primary"></i>Resume Attachment</h5>

                            <div class="d-flex align-items-center p-3 bg-light rounded-3 mb-3 border">
                                <div class="d-flex align-items-center gap-2 overflow-hidden">
                                    <i class="fa-solid fa-file-pdf text-danger fa-lg flex-shrink-0"></i>
                                    <asp:Label ID="lblResumeName" runat="server" CssClass="fs-8 text-secondary text-truncate fw-semibold" Text="No resume uploaded" />
                                </div>
                            </div>

                            <%-- <div class="d-flex align-items-center justify-content-between p-3 bg-light rounded-3 mb-3 border">
                                <div class="d-flex align-items-center gap-2 overflow-hidden">
                                    <i class="fa-solid fa-file-pdf text-danger fa-lg flex-shrink-0"></i>
                                    <span class="fs-8 text-secondary text-truncate fw-semibold">John_Doe_CV.pdf</span>
                                </div>
                                <a href="#" class="btn btn-sm btn-link text-danger p-0" onclick="alert('Resume file deleted. Please upload a new resume.')"><i class="fa-solid fa-trash-can"></i></a>
                            </div>--%>

                            <div class="upload-drag-zone p-3">
                                <i class="fa-solid fa-file-arrow-up fa-lg mb-2"></i>
                                <p class="fs-8 text-muted mb-0">Drag and drop file or click to replace</p>
                                <asp:FileUpload ID="studentresume" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Info Forms -->
                <div class="col-lg-8">
                    <div class="d-flex flex-column gap-4">

                        <!-- Personal Info -->
                        <div class="bg-white border rounded-3 p-4 shadow-sm">
                            <h5 class="fw-bold text-secondary border-bottom pb-2 mb-3"><i class="fa-solid fa-user me-2 text-primary"></i>Personal Information</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="student-name" class="form-label form-label-custom">Full Name</label>
                                    <asp:TextBox ID="studentname" runat="server" CssClass="form-control form-control-custom" />
                                    <%--<input type="text" id="student-name" class="form-control form-control-custom" value="John Doe" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-email" class="form-label form-label-custom">Email Address</label>
                                    <asp:TextBox ID="studentemail" runat="server" TextMode="Email" CssClass="form-control form-control-custom" ReadOnly="true" />
                                    <%--                                    <input type="email" id="student-email" class="form-control form-control-custom" value="john@university.edu" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-phone" class="form-label form-label-custom">Mobile Number</label>
                                    <asp:TextBox ID="studentphone" runat="server" TextMode="Phone" CssClass="form-control form-control-custom" />
                                    <%--                                    <input type="tel" id="student-phone" class="form-control form-control-custom" value="9876543210" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-dob" class="form-label form-label-custom">Date of Birth</label>
                                    <asp:TextBox ID="studentdob" runat="server" TextMode="Date" CssClass="form-control form-control-custom" />
                                    <%--                                    <input type="date" id="student-dob" class="form-control form-control-custom" value="2004-06-15" required>--%>
                                </div>
                            </div>
                        </div>

                        <!-- Education Details -->
                        <div class="bg-white border rounded-3 p-4 shadow-sm">
                            <h5 class="fw-bold text-secondary border-bottom pb-2 mb-3"><i class="fa-solid fa-graduation-cap me-2 text-primary"></i>Academic Details</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="student-college" class="form-label form-label-custom">College / University</label>
                                    <asp:TextBox ID="studentcollege" runat="server" CssClass="form-control form-control-custom" />
                                    <%--                                    <input type="text" id="student-college" class="form-control form-control-custom" value="Stanford University" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-course" class="form-label form-label-custom">Course / Program</label>
                                    <asp:TextBox ID="studentcourse" runat="server" CssClass="form-control form-control-custom" />
                                    <%--                                    <input type="text" id="student-course" class="form-control form-control-custom" value="B.S. Computer Science" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-gpa" class="form-label form-label-custom">Current GPA / Percentage</label>
                                    <asp:TextBox ID="studentgpa" runat="server" CssClass="form-control form-control-custom" />

                                    <%--                                    <input type="text" id="student-gpa" class="form-control form-control-custom" value="3.8 / 4.0" required>--%>
                                </div>
                                <div class="col-md-6">
                                    <label for="student-grad" class="form-label form-label-custom">Expected Graduation Year</label>
                                    <asp:TextBox ID="studentgrad" runat="server" TextMode="Number" CssClass="form-control form-control-custom" />
                                    <%--                                    <input type="number" id="student-grad" class="form-control form-control-custom" value="2027" required>--%>
                                </div>
                            </div>
                        </div>

                        <!-- Skill tag inputs -->
                        <div class="bg-white border rounded-3 p-4 shadow-sm">
                            <h5 class="fw-bold text-secondary border-bottom pb-2 mb-3"><i class="fa-solid fa-sliders me-2 text-primary"></i>Professional Skill Badges</h5>
                            <label class="form-label form-label-custom">
                                Manage Skills (comma-separated)
   
                            </label>

                            <asp:TextBox ID="studentskills" runat="server"
                                CssClass="form-control form-control-custom"
                                TextMode="MultiLine" Rows="3" />

                            <p class="fs-8 text-muted mt-2 mb-0">
                                Enter skills separated by commas, for example: ASP.NET, C#, SQL Server.
   
                            </p>
                        </div>

                        <!-- Save trigger -->
                        <div class="d-flex justify-content-end gap-3">
                            <asp:Button ID="studentreset" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClick="studentreset_Click" />
<%--                            <button type="reset" class="btn btn-outline-secondary px-4 py-2">Reset Fields</button>--%>
                            <asp:Button ID="studentsave" runat="server" Text="Save Changes" CssClass="btn btn-primary px-5 py-2" OnClick="studentsave_Click" />
                            <%--<button type="submit" class="btn btn-primary px-5 py-2"><i class="fa-solid fa-floppy-disk me-2"></i>Save Changes</button>--%>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

