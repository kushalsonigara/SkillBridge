<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SkillBridge.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Main Container Partition -->
    <main class="main-container">
        <!-- Login Section -->
        <section class="py-5 bg-light flex-grow-1 d-flex align-items-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-5">
                        <div class="form-card auth-card-glow">

                            <div class="text-center mb-4">
                                <h3 class="fw-bold text-secondary mb-1">Welcome Back</h3>
                                <p class="text-muted fs-7">Select your portal role to access your dashboard</p>
                            </div>

                            <!-- Role Selector buttons -->
                            <div class="form-tab-container p-1 mb-4 shadow-sm" style="border-radius: 8px;">
                                <button id="role-student" class="form-tab-btn active py-2 fs-8 rounded-2" onclick="setLoginRole('student')"><i class="fa-solid fa-user-graduate me-1"></i>Student</button>
                                <button id="role-company" class="form-tab-btn py-2 fs-8 rounded-2" onclick="setLoginRole('company')"><i class="fa-solid fa-building me-1"></i>Company</button>
                                <button id="role-admin" class="form-tab-btn py-2 fs-8 rounded-2" onclick="setLoginRole('admin')"><i class="fa-solid fa-user-shield me-1"></i>Admin</button>
                            </div>

                            <!-- Login Form -->
                            <form id="login-form" class="needs-validation-custom" data-success-msg="Login successful!" data-redirect="student/student-dashboard.aspx" novalidate>
                                <div class="mb-3">
                                    <label for="login-email" class="form-label form-label-custom">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text border-end-0 bg-white"><i class="fa-solid fa-envelope text-muted"></i></span>
                                        <input type="email" id="login-email" class="form-control form-control-custom ps-2 border-start-0" placeholder="e.g. user@example.com" required>
                                        <div class="invalid-feedback-custom w-100">Please enter a valid email address.</div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <label for="login-password" class="form-label form-label-custom mb-0">Password</label>
                                        <a href="#" class="fs-8 fw-semibold" onclick="alert('Forgot password link clicked. An OTP verification is simulated.')">Forgot Password?</a>
                                    </div>
                                    <div class="input-group password-field-container">
                                        <span class="input-group-text border-end-0 bg-white"><i class="fa-solid fa-lock text-muted"></i></span>
                                        <input type="password" id="login-password" class="form-control form-control-custom ps-2 border-start-0" placeholder="••••••••" required>
                                        <button type="button" class="password-toggle-btn" style="right: 12px;"><i class="fa-solid fa-eye"></i></button>
                                        <div class="invalid-feedback-custom w-100">Please enter your password.</div>
                                    </div>
                                </div>

                                <div class="form-check mb-4">
                                    <input class="form-check-input text-primary" type="checkbox" id="remember-me">
                                    <label class="form-check-label fs-7 text-muted" for="remember-me">
                                        Remember me on this device
                                    </label>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold"><i class="fa-solid fa-right-to-bracket me-2"></i>Sign In</button>
                            </form>

                            <div class="text-center mt-4 text-muted fs-7">
                                Don't have an account? <a href="register.aspx" class="fw-bold">Sign up here</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Interactive Role Switching script -->
    <script>
        function setLoginRole(role) {
            // Toggle button active status
            const btnStudent = document.getElementById('role-student');
            const btnCompany = document.getElementById('role-company');
            const btnAdmin = document.getElementById('role-admin');
            const form = document.getElementById('login-form');

            btnStudent.classList.remove('active');
            btnCompany.classList.remove('active');
            btnAdmin.classList.remove('active');

            if (role === 'student') {
                btnStudent.classList.add('active');
                form.setAttribute('data-redirect', 'student/student-dashboard.aspx');
            } else if (role === 'company') {
                btnCompany.classList.add('active');
                form.setAttribute('data-redirect', 'company/company-dashboard.aspx');
            } else if (role === 'admin') {
                btnAdmin.classList.add('active');
                form.setAttribute('data-redirect', 'Admin/admin-dashboard.aspx');
            }
        }
    </script>
</asp:Content>


