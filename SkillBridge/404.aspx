<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="SkillBridge._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
      <!-- Main Container Partition -->
  <main class="main-container">
    <!-- 404 Section -->
    <section class="py-5 bg-light flex-grow-1 d-flex align-items-center">
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
          <div class="p-5 bg-white border rounded-3 shadow-lg">
            <div class="text-primary mb-4" style="font-size: 5rem; animation: float 3s ease-in-out infinite;">
              <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            <h1 class="display-3 fw-extrabold text-secondary mb-3">404</h1>
            <h3 class="fw-bold mb-3">Page Not Found</h3>
            <p class="text-muted fs-7 mb-4">The URL path you requested was not found or is currently undergoing database updates. Please verify the link or redirect using the buttons below.</p>
            <div class="d-flex justify-content-center gap-3">
              <a href="index.aspx" class="btn btn-primary px-4 py-2"><i class="fa-solid fa-house me-2"></i>Go to Home</a>
              <a href="login.aspx" class="btn btn-outline-secondary px-4 py-2"><i class="fa-solid fa-right-to-bracket me-2"></i>Log In</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    </section>
  </main>
</asp:Content>

