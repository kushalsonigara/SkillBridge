<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="SkillBridge.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <!-- Main Container Partition -->
    <main class="main-container">

        <!-- Main Register Section -->
        <section class="py-5 bg-light flex-grow-1 d-flex align-items-center">

            <div class="container">

                <div class="row justify-content-center">

                    <div class="col-lg-8 col-md-10">

                        <!-- Registration Tab Controllers -->
                        <div class="form-tab-container shadow-sm">

                            <button type="button" id="tab-student-btn" class="form-tab-btn active">
                                <i class="fa-solid fa-user-graduate me-2"></i>
                                Student Registration
                            </button>

                            <button type="button" id="tab-company-btn" class="form-tab-btn">
                                <i class="fa-solid fa-building me-2"></i>
                                Company Registration
                            </button>

                        </div>


                        <!-- ================================================= -->
                        <!-- STUDENT REGISTRATION CARD -->
                        <!-- ================================================= -->

                        <div id="student-reg-card" class="form-card auth-card-glow">

                            <h3 class="fw-bold text-secondary mb-1">Create Student Profile
                            </h3>

                            <p class="text-muted fs-7 mb-4">
                                Register as a candidate to search and apply for premium internships.
                            </p>

                            <div class="row g-3">

                                <!-- Full Name -->
                                <div class="col-md-6">

                                    <label for="student-name"
                                        class="form-label form-label-custom">
                                        Full Name
                                    </label>

                                    <asp:TextBox ID="studentname" class="form-control form-control-custom"
                                        placeholder="e.g. John Doe" runat="server"></asp:TextBox>

                                    <%--<input type="text"
                                               id="student-name"
                                               class="form-control form-control-custom"
                                               placeholder="e.g. John Doe"
                                               required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter your full name.
                                    </div>

                                </div>


                                <!-- Email -->
                                <div class="col-md-6">

                                    <label for="student-email"
                                        class="form-label form-label-custom">
                                        Email Address
                                    </label>

                                    <asp:TextBox ID="studentemail" class="form-control form-control-custom"
                                        placeholder="e.g. john@university.edu" runat="server"></asp:TextBox>
                                    <%--<input type="email"
                                        id="student-email"
                                        class="form-control form-control-custom"
                                        placeholder="e.g. john@university.edu"
                                        required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter a valid email address.
                                    </div>

                                </div>


                                <!-- Mobile Number -->
                                <div class="col-md-6">

                                    <label for="student-phone"
                                        class="form-label form-label-custom">
                                        Mobile Number
                                    </label>
                                    <asp:TextBox ID="studentphone" class="form-control form-control-custom"
                                        placeholder="e.g. 10 digit number" runat="server"></asp:TextBox>

                                    <%-- <input type="tel"
                                        id="student-phone"
                                        class="form-control form-control-custom"
                                        placeholder="e.g. 10 digit number"
                                        required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter your 10-digit mobile number.
                                    </div>

                                </div>


                                <!-- College -->
                                <div class="col-md-6">

                                    <label for="student-college"
                                        class="form-label form-label-custom">
                                        College / University
                                    </label>

                                    <asp:TextBox ID="studentcollege" class="form-control form-control-custom"
                                        placeholder="e.g. Stanford University" runat="server"></asp:TextBox>
                                    <%-- <input type="text"
                                        id="student-college"
                                        class="form-control form-control-custom"
                                        placeholder="e.g. Stanford University"
                                        required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please specify your university name.
                                    </div>

                                </div>


                                <!-- Course -->
                                <div class="col-md-6">

                                    <label for="student-course"
                                        class="form-label form-label-custom">
                                        Course / Program
                                    </label>

                                    <asp:TextBox ID="studentcourse" class="form-control form-control-custom"
                                        placeholder="e.g. B.S. Computer Science" runat="server"></asp:TextBox>

                                    <%--   <input type="text"
                                        id="student-course"
                                        class="form-control form-control-custom"
                                        placeholder="e.g. B.S. Computer Science"
                                        required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please specify your active course name.
                                    </div>

                                </div>


                                <!-- Skills -->
                                <div class="col-md-6">

                                    <label class="form-label form-label-custom">
                                        Skills Checklist (Press Enter/Comma)
                                    </label>

                                    <div id="skills-wrapper"
                                        class="skills-select-wrapper">

                                        <asp:TextBox ID="skillinput" class="skill-tag-input"
                                            placeholder="e.g. Java, Figma, SEO" runat="server"></asp:TextBox>

                                        <%--  <input type="text"
                                            id="skill-input"
                                            class="skill-tag-input"
                                            placeholder="e.g. Java, Figma, SEO">--%>
                                    </div>

                                    <input type="hidden"
                                        id="hidden-skills-field"
                                        name="skills">

                                    <div class="fs-8 text-muted mt-1">
                                        Press Enter or comma to create a badge tag.
                                    </div>

                                </div>


                                <!-- Student Password -->
                                <div class="col-md-6">

                                    <label for="student-password"
                                        class="form-label form-label-custom">
                                        Password
                                    </label>

                                    <div class="password-field-container">

                                        <asp:TextBox ID="studentpassword" TextMode="Password" class="form-control form-control-custom"
                                            placeholder="Min. 8 characters" runat="server"></asp:TextBox>

                                        <%--                                        <input type="password"
                                            id="student-password"
                                            class="form-control form-control-custom"
                                            placeholder="Min. 8 characters"
                                            required>--%>

                                        <button type="button"
                                            class="password-toggle-btn">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>

                                    </div>

                                    <div class="invalid-feedback-custom">
                                        Password is required.
                                    </div>

                                </div>


                                <!-- Student Confirm Password -->
                                <div class="col-md-6">

                                    <label for="student-confirm-password"
                                        class="form-label form-label-custom">
                                        Confirm Password
                                    </label>

                                    <div class="password-field-container">

                                        <asp:TextBox ID="studentcnpassword" TextMode="Password" class="form-control form-control-custom"
                                            placeholder="Verify password" runat="server"></asp:TextBox>

                                        <%-- <input type="password"
                                            id="student-confirm-password"
                                            class="form-control form-control-custom"
                                            placeholder="Verify password"
                                            required>--%>

                                        <button type="button"
                                            class="password-toggle-btn">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>

                                    </div>

                                    <div class="invalid-feedback-custom">
                                        Passwords must match.
                                    </div>

                                </div>


                                <!-- Resume Upload -->
                                <div class="col-12">

                                    <label class="form-label form-label-custom">
                                        Upload Resume (PDF format)
                                    </label>

                                    <asp:FileUpload ID="studentresume" accept=".pdf" runat="server" />



                                    <%--<div class="upload-drag-zone">

                                        <i class="fa-solid fa-file-arrow-up"></i>

                                        <h6>Drag & drop your Resume file here or click to browse
                                        </h6>

                                        <p class="upload-file-info mb-0">
                                            Accepted files: PDF only (Max. 5MB)
                                        </p>

                                        <input type="file"
                                            id="student-resume"
                                            accept=".pdf"
                                            required>
                                    </div>--%>

                                    <div class="invalid-feedback-custom text-center mt-2">
                                        Resume file is required.
                                    </div>

                                </div>


                                <!-- Student Terms -->
                                <div class="col-12 mt-4">

                                    <div class="form-check mb-3">
                                        <asp:CheckBox ID="studentterms"
                                            runat="server"
                                            Text=" I agree to the Terms & Conditions and Privacy Policy." />

                                        <%-- <input class="form-check-input text-primary"
                                            type="checkbox"
                                            id="student-terms"
                                            required>--%>

                                        <%--<label class="form-check-label fs-7 text-muted"
                                            for="student-terms">
                                            I agree to the
                                                <a href="#">Terms & Conditions</a>
                                            and
                                                <a href="#">Privacy Policy</a>.

                                        </label>--%>

                                        <div class="invalid-feedback-custom">
                                            You must accept the terms before registering.
                                        </div>

                                    </div>


                                    <!-- Student Register Button -->

                                    <asp:Button ID="studentregister" class="btn btn-primary w-100 py-2" runat="server" Text="Register student Profile" OnClick="studentregister_Click"  />



                                    <%--<button type="submit"
                                        class="btn btn-primary w-100 py-2">

                                        <i class="fa-solid fa-user-plus me-2"></i>
                                        Register Profile

                                    </button>--%>
                                </div>

                            </div>

                        </div>


                        <!-- ================================================= -->
                        <!-- COMPANY REGISTRATION CARD -->
                        <!-- ================================================= -->

                        <div id="company-reg-card"
                            class="form-card d-none auth-card-glow">

                            <h3 class="fw-bold text-secondary mb-1">Create Company Profile
                            </h3>

                            <p class="text-muted fs-7 mb-4">
                                Register your company to post and manage premium internships.
                            </p>



                            <div class="row g-3">


                                <!-- Company Name -->
                                <div class="col-md-6">

                                    <label for="company-name"
                                        class="form-label form-label-custom">
                                        Company Name
                                    </label>

                                    <asp:TextBox ID="companyname" class="form-control form-control-custom"
                                        placeholder="e.g. Microsoft India" runat="server"></asp:TextBox>

                                    <%-- <input type="text"
                                            id="company-name"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. Microsoft India"
                                            required>--%>



                                    <div class="invalid-feedback-custom">
                                        Please enter the company name.
                                    </div>

                                </div>


                                <!-- Email Address -->
                                <div class="col-md-6">

                                    <label for="company-email"
                                        class="form-label form-label-custom">
                                        Email Address
                                    </label>

                                    <asp:TextBox ID="companyemail" class="form-control form-control-custom"
                                        placeholder="e.g. hr@company.com" runat="server"></asp:TextBox>

                                    <%--<input type="email"
                                            id="company-email"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. hr@company.com"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter a valid email address.
                                    </div>

                                </div>


                                <!-- Mobile Number -->
                                <div class="col-md-6">

                                    <label for="company-phone"
                                        class="form-label form-label-custom">
                                        Mobile Number
                                    </label>

                                    <asp:TextBox ID="companyphone" class="form-control form-control-custom" placeholder="e.g. 10 digit number"
                                        MaxLength="10" runat="server"></asp:TextBox>

                                    <%-- <input type="tel"
                                            id="company-phone"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. 10 digit number"
                                            maxlength="10"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter your 10-digit mobile number.
                                    </div>

                                </div>


                                <!-- Company Website -->
                                <div class="col-md-6">

                                    <label for="company-website"
                                        class="form-label form-label-custom">
                                        Company Website
                                    </label>

                                    <asp:TextBox ID="companywebsite" class="form-control form-control-custom"
                                        placeholder="e.g. https://company.com" runat="server"></asp:TextBox>

                                    <%-- <input type="url"
                                            id="company-website"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. https://company.com"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter a valid website URL.
                                    </div>

                                </div>


                                <!-- Industry / Sector -->
                                <div class="col-md-6">

                                    <label for="company-industry"
                                        class="form-label form-label-custom">
                                        Industry / Sector
                                    </label>

                                    <asp:TextBox ID="companyindustry" class="form-control form-control-custom" placeholder="e.g. Information Technology" runat="server"></asp:TextBox>

                                    <%--<input type="text"
                                            id="company-industry"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. Information Technology"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter industry / sector.
                                    </div>

                                </div>


                                <!-- Company Location -->
                                <div class="col-md-6">

                                    <label for="company-location"
                                        class="form-label form-label-custom">
                                        Company Location
                                    </label>

                                    <asp:TextBox ID="companylocation" class="form-control form-control-custom" placeholder="e.g. Ahmedabad, Gujarat" runat="server"></asp:TextBox>

                                    <%--<input type="text"
                                            id="company-location"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. Ahmedabad, Gujarat"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter company location.
                                    </div>

                                </div>


                                <!-- HR / Recruiter Name -->
                                <div class="col-md-6">

                                    <label for="company-contact"
                                        class="form-label form-label-custom">
                                        HR / Recruiter Name
                                    </label>

                                    <asp:TextBox ID="companycontact" class="form-control form-control-custom" placeholder="e.g. John Smith" runat="server"></asp:TextBox>

                                    <%--<input type="text"
                                            id="company-contact"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. John Smith"
                                            required>--%>

                                    <div class="invalid-feedback-custom">
                                        Please enter HR / Recruiter name.
                                    </div>

                                </div>


                                <!-- Internship Domains -->
                                <div class="col-md-6">

                                    <label for="company-domain"
                                        class="form-label form-label-custom">
                                        Internship Domains
                                    </label>

                                    <asp:TextBox ID="companydomain" class="form-control form-control-custom" placeholder="e.g. Java, Figma, SEO" runat="server"></asp:TextBox>

                                    <%--<input type="text"
                                            id="company-domain"
                                            class="form-control form-control-custom"
                                            placeholder="e.g. Java, Figma, SEO">--%>
                                </div>


                                <!-- Company Password -->
                                <div class="col-md-6">

                                    <label for="company-password"
                                        class="form-label form-label-custom">
                                        Password
                                    </label>

                                    <div class="password-field-container">

                                        <asp:TextBox ID="companypassword" TextMode="Password" class="form-control form-control-custom" placeholder="Min. 8 characters"
                                            minlength="8" runat="server"></asp:TextBox>

                                        <%--<input type="password"
                                                id="company-password"
                                                class="form-control form-control-custom"
                                                placeholder="Min. 8 characters"
                                                minlength="8"
                                                required>--%>

                                        <button type="button"
                                            class="password-toggle-btn">

                                            <i class="fa-solid fa-eye"></i>

                                        </button>

                                    </div>

                                    <div class="invalid-feedback-custom">
                                        Password must contain at least 8 characters.
                                    </div>

                                </div>


                                <!-- Company Confirm Password -->
                                <div class="col-md-6">

                                    <label for="company-confirm-password"
                                        class="form-label form-label-custom">
                                        Confirm Password
                                    </label>

                                    <div class="password-field-container">

                                        <asp:TextBox ID="companyconfirmpassword" TextMode="Password" minlength="8" class="form-control form-control-custom" placeholder="Verify password" runat="server"></asp:TextBox>

                                        <%-- <input type="password"
                                                id="company-confirm-password"
                                                class="form-control form-control-custom"
                                                placeholder="Verify password"
                                                minlength="8"
                                                required>--%>

                                        <button type="button"
                                            class="password-toggle-btn">

                                            <i class="fa-solid fa-eye"></i>

                                        </button>

                                    </div>

                                    <div class="invalid-feedback-custom">
                                        Passwords must match.
                                    </div>

                                </div>


                                <!-- Company Logo -->
                                <div class="col-12">

                                    <label class="form-label form-label-custom">
                                        Upload Company Logo
                                    </label>

                                    <asp:FileUpload ID="companylogo" accept=".png,.jpg,.jpeg" runat="server" />

                                    <%-- <div class="upload-drag-zone">

                                        <i class="fa-solid fa-cloud-arrow-up"></i>

                                        <h6>Drag & drop your Company Logo here
                                                or click to browse
                                        </h6>

                                        <p class="upload-file-info mb-0">
                                            Accepted files: PNG, JPG, JPEG only (Max. 2MB)
                                        </p>

                                        <input type="file"
                                            id="company-logo"
                                            accept=".png,.jpg,.jpeg"
                                            required>
                                    </div>--%>

                                    <div class="invalid-feedback-custom text-center mt-2">
                                        Please upload company logo.
                                    </div>

                                </div>


                                <!-- Company Terms & Register -->
                                <div class="col-12 mt-4">

                                    <div class="form-check mb-3">
                                        <asp:CheckBox ID="companyterms"
                                            runat="server"
                                            Text=" I agree to the Terms & Conditions and Privacy Policy." />

                                        <%-- <input class="form-check-input text-primary"
                                            type="checkbox"
                                            id="company-terms"
                                            required>

                                        <label class="form-check-label fs-7 text-muted"
                                            for="company-terms">
                                            I agree to the
                                                <a href="#">Terms & Conditions</a>
                                            and
                                                <a href="#">Privacy Policy</a>.

                                        </label>--%>

                                        <div class="invalid-feedback-custom">
                                            You must accept the terms and conditions.
                                        </div>

                                    </div>


                                    <!-- Company Register Button -->
                                    <asp:Button ID="companyregister" runat="server" class="btn btn-primary w-100 py-2" Text=" Register Company Account" OnClick="companyregister_Click" />

                                    <%--<button type="submit"

                                        class="btn btn-primary w-100 py-2">

                                        <i class="fa-solid fa-building me-2"></i>
                                        Register Company Account

                                    </button>--%>
                                </div>

                            </div>



                        </div>

                    </div>

                </div>

            </div>

        </section>

    </main>


    <!-- Registration Tab Script -->
    <script>

        document.addEventListener('DOMContentLoaded', function () {

            const urlParams = new URLSearchParams(window.location.search);
            const type = urlParams.get('type');

            if (type === 'company') {

                const tabCompany = document.getElementById('tab-company-btn');

                if (tabCompany) {
                    tabCompany.click();
                }

            }

        });

    </script>


    <script src="js/validation.js"></script>

</asp:Content>
