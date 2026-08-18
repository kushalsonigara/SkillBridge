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
                            <form id="login-form" class="needs-validation-custom" data-success-msg="Login successful!" data-redirect="student-dashboard.html" novalidate>
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
                                Don't have an account? <a href="register.html" class="fw-bold">Sign up here</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
    </main>
    </section>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer -->
    <footer class="footer-custom">
        <div class="container">
            <div class="row g-4 mb-5">
                <div class="col-lg-4 col-md-6">
                    <a class="navbar-brand navbar-brand-custom text-white mb-3" href="index.html"><i class="fa-solid fa-graduation-cap text-accent"></i><span>Skill</span>Bridge </a>
                    <p class="footer-text mb-4">
                        A focused internship portal for students, employers, and administrators to manage opportunities, applications, and hiring progress in one place.
                    </p>
                    <div class="d-flex flex-wrap gap-2">
                        <a href="#" class="footer-social-btn" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a><a href="#" class="footer-social-btn" aria-label="Twitter"><i class="fa-brands fa-twitter"></i></a><a href="#" class="footer-social-btn" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a><a href="#" class="footer-social-btn" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h5>For Students</h5>
                    <a href="internship-list.html" class="footer-link">Find Internships</a> <a href="student-dashboard.html" class="footer-link">Dashboard</a> <a href="recommendation.html" class="footer-link">Recommendations</a> <a href="my-applications.html" class="footer-link">Track Applications</a>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h5>For Employers</h5>
                    <a href="register.html?type=company" class="footer-link">Post an Internship</a> <a href="company-dashboard.html" class="footer-link">Company Dashboard</a> <a href="applicants.html" class="footer-link">Browse Applicants</a> <a href="login.html" class="footer-link">Employer Login</a>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h5>Quick Access</h5>
                    <a href="about.html" class="footer-support-link"><span>About SkillBridge</span> <i class="fa-solid fa-arrow-right"></i></a><a href="contact.html" class="footer-support-link"><span>Contact Support</span> <i class="fa-solid fa-arrow-right"></i></a><a href="login.html" class="footer-support-link"><span>Sign In</span> <i class="fa-solid fa-arrow-right"></i></a><a href="register.html" class="footer-support-link mb-0"><span>Create Account</span> <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="footer-divider">
            </div>
            <div class="footer-bottom">
                <p class="mb-0">
                    &copy; 2026 SkillBridge Internship Portal. All rights reserved.
                </p>
                <div class="footer-legal-links">
                    <a href="#" class="text-muted footer-link mb-0">Privacy Policy</a> <a href="#" class="text-muted footer-link mb-0">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
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
                form.setAttribute('data-redirect', 'student-dashboard.html');
            } else if (role === 'company') {
                btnCompany.classList.add('active');
                form.setAttribute('data-redirect', 'company-dashboard.html');
            } else if (role === 'admin') {
                btnAdmin.classList.add('active');
                form.setAttribute('data-redirect', 'admin-dashboard.html');
            }
        }
    </script>
</asp:Content>


