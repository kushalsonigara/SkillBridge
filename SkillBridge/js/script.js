/* ==========================================================================
   Internship Management Portal - Common Scripts (script.js)
   ========================================================================== */

document.addEventListener('DOMContentLoaded', function () {
  
  // 1. Page Loader Fade Out
  const loaderWrapper = document.getElementById('loader-wrapper');
  if (loaderWrapper) {
    window.addEventListener('load', function () {
      loaderWrapper.style.opacity = '0';
      loaderWrapper.style.visibility = 'hidden';
      setTimeout(() => {
        loaderWrapper.remove();
      }, 500);
    });
    // Fallback: remove loader after 3 seconds in case window.load takes too long
    setTimeout(() => {
      if (document.getElementById('loader-wrapper')) {
        loaderWrapper.style.opacity = '0';
        loaderWrapper.style.visibility = 'hidden';
      }
    }, 3000);
  }

  // 2. Sidebar Toggling logic for Dashboard Pages
  const sidebar = document.querySelector('.sidebar');
  const sidebarToggle = document.querySelector('.sidebar-toggle');
  
  if (sidebar && sidebarToggle) {
    // Create and append backdrop element for mobile view overlay
    const backdrop = document.createElement('div');
    backdrop.className = 'sidebar-backdrop';
    sidebar.parentNode.insertBefore(backdrop, sidebar.nextSibling);
    
    // Toggle sidebar status on click
    sidebarToggle.addEventListener('click', function (e) {
      e.stopPropagation();
      sidebar.classList.toggle('active');
    });

    // Close sidebar when clicking on the mobile backdrop
    backdrop.addEventListener('click', function () {
      sidebar.classList.remove('active');
    });

    // Close sidebar on window resize if user scales up to desktop size
    window.addEventListener('resize', function () {
      if (window.innerWidth >= 992) {
        sidebar.classList.remove('active');
      }
    });
  }

  // 3. Shared footer for dashboard-style user pages
  const dashboardContent = document.querySelector('.dashboard-content');
  if (dashboardContent && !dashboardContent.querySelector('.footer-custom')) {
    const dashboardFooter = document.createElement('footer');
    dashboardFooter.className = 'footer-custom dashboard-footer';
    dashboardFooter.innerHTML = `
      <div class="container">
        <div class="row g-4 align-items-start">
          <div class="col-lg-5 col-md-6">
            <a class="navbar-brand navbar-brand-custom footer-brand text-white mb-3" href="index.html">
              <i class="fa-solid fa-graduation-cap text-accent"></i>
              <span>Skill</span>Bridge
            </a>
            <p class="footer-text mb-4">
              Manage internships, applications, and hiring activity from one polished workspace built for students, employers, and administrators.
            </p>
            <div class="d-flex flex-wrap gap-2">
              <a href="#" class="footer-social-btn" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
              <a href="#" class="footer-social-btn" aria-label="Twitter"><i class="fa-brands fa-twitter"></i></a>
              <a href="#" class="footer-social-btn" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
              <a href="#" class="footer-social-btn" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <h5>Explore</h5>
            <a href="internship-list.html" class="footer-link">Browse Internships</a>
            <a href="recommendation.html" class="footer-link">Recommendations</a>
            <a href="my-applications.html" class="footer-link">My Applications</a>
            <a href="track-application.html" class="footer-link">Track Application</a>
          </div>
          <div class="col-lg-4 col-md-6">
            <h5>Support</h5>
            <a href="contact.html" class="footer-support-link">
              <span>Contact Support</span>
              <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="about.html" class="footer-support-link">
              <span>About SkillBridge</span>
              <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="login.html" class="footer-support-link">
              <span>Sign In</span>
              <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="register.html" class="footer-support-link mb-0">
              <span>Create Account</span>
              <i class="fa-solid fa-arrow-right"></i>
            </a>
          </div>
        </div>
        <div class="footer-divider"></div>
        <div class="footer-bottom">
          <p class="mb-0">&copy; 2026 SkillBridge Internship Portal. All rights reserved.</p>
          <div class="footer-legal-links">
            <a href="#" class="footer-link mb-0">Privacy Policy</a>
            <a href="#" class="footer-link mb-0">Terms of Service</a>
          </div>
        </div>
      </div>
    `;
    dashboardContent.appendChild(dashboardFooter);
  }

  // 4. Back To Top Button Behavior
  const backToTopBtn = document.createElement('button');
  backToTopBtn.className = 'back-to-top';
  backToTopBtn.innerHTML = '<i class="fa-solid fa-arrow-up"></i>';
  document.body.appendChild(backToTopBtn);

  window.addEventListener('scroll', function () {
    if (window.scrollY > 300) {
      backToTopBtn.classList.add('show');
    } else {
      backToTopBtn.classList.remove('show');
    }
  });

  backToTopBtn.addEventListener('click', function () {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });

  // 5. Highlight Active Navigation Links automatically based on path
  const currentPath = window.location.pathname;
  const pageName = currentPath.substring(currentPath.lastIndexOf('/') + 1);
  
  if (pageName) {
    // Navbar links (Public site)
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link-custom');
    navLinks.forEach(link => {
      const linkPage = link.getAttribute('href');
      if (linkPage === pageName || (pageName === '' && linkPage === 'index.html')) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });

    // Sidebar links (Dashboards)
    const sidebarLinks = document.querySelectorAll('.sidebar-nav .sidebar-link');
    sidebarLinks.forEach(link => {
      const linkPage = link.getAttribute('href');
      if (linkPage === pageName) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  }

  // 6. Initialize Bootstrap Tooltips & Popovers if available
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  if (typeof bootstrap !== 'undefined') {
    tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl);
    });
  }

  // ==========================================================================
  // Premium Public Home Page Scripting Enhancements
  // ==========================================================================

  // A. Dark/Light Theme Switcher Manager
  const themeToggleBtn = document.getElementById('theme-toggle');
  
  // Apply saved theme immediately on load
  const currentTheme = localStorage.getItem('theme') || 'light';
  if (currentTheme === 'dark') {
    document.documentElement.setAttribute('data-theme', 'dark');
    if (themeToggleBtn) {
      themeToggleBtn.innerHTML = '<i class="fa-solid fa-sun"></i>';
    }
  }

  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', function () {
      const activeTheme = document.documentElement.getAttribute('data-theme');
      
      if (activeTheme === 'dark') {
        document.documentElement.removeAttribute('data-theme');
        localStorage.setItem('theme', 'light');
        themeToggleBtn.innerHTML = '<i class="fa-solid fa-moon"></i>';
      } else {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
        themeToggleBtn.innerHTML = '<i class="fa-solid fa-sun"></i>';
      }
      
      // Pulse animation effect on theme button click
      themeToggleBtn.classList.add('pulse');
      setTimeout(() => {
        themeToggleBtn.classList.remove('pulse');
      }, 300);
    });
  }

  // B. Scroll Reveal Animations Observer
  const revealElements = document.querySelectorAll('.reveal, .reveal-left, .reveal-right');
  if (revealElements.length > 0) {
    const revealObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('reveal-active');
          // Once revealed, no need to keep observing
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.15,
      rootMargin: '0px 0px -50px 0px'
    });

    revealElements.forEach(element => {
      revealObserver.observe(element);
    });
  }

  // C. Numeric Count-up Counter Animations
  const statNumbers = document.querySelectorAll('.stat-number');
  if (statNumbers.length > 0) {
    const animateCounter = (el) => {
      const target = parseFloat(el.getAttribute('data-target'));
      const prefix = el.getAttribute('data-prefix') || '';
      const suffix = el.getAttribute('data-suffix') || '';
      const decimals = parseInt(el.getAttribute('data-decimals')) || 0;
      
      const duration = 2000; // 2 seconds
      const startTime = performance.now();
      
      const updateNumber = (currentTime) => {
        const elapsedTime = currentTime - startTime;
        const progress = Math.min(elapsedTime / duration, 1);
        
        // Easing function (outQuad)
        const easedProgress = progress * (2 - progress);
        const currentValue = easedProgress * target;
        
        el.textContent = prefix + currentValue.toFixed(decimals) + suffix;
        
        if (progress < 1) {
          requestAnimationFrame(updateNumber);
        }
      };
      
      requestAnimationFrame(updateNumber);
    };

    const counterObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.5
    });

    statNumbers.forEach(number => {
      counterObserver.observe(number);
    });
  }

  // D. Interactive Category Pill Filters for Internship Listings
  const filterPills = document.querySelectorAll('.btn-filter');
  const filterItems = document.querySelectorAll('.col-filter-item');

  if (filterPills.length > 0 && filterItems.length > 0) {
    filterPills.forEach(pill => {
      pill.addEventListener('click', function () {
        // Toggle active styling
        filterPills.forEach(p => p.classList.remove('active'));
        this.classList.add('active');

        const filterValue = this.getAttribute('data-filter');

        filterItems.forEach(item => {
          const isMatch = filterValue === 'all' || item.classList.contains(filterValue);
          
          if (isMatch) {
            // Remove d-none first, then fade/scale in next frame
            item.classList.remove('d-none');
            // Allow display change to render before adding visible classes
            setTimeout(() => {
              item.style.opacity = '1';
              item.style.transform = 'scale(1) translateY(0)';
            }, 50);
          } else {
            // Fade/scale out first, then add d-none after transition finishes
            item.style.opacity = '0';
            item.style.transform = 'scale(0.8) translateY(20px)';
            setTimeout(() => {
              item.classList.add('d-none');
            }, 300);
          }
        });
      });
    });
  }

  // E. Micro-interactions for Bookmark Buttons
  const bookmarkButtons = document.querySelectorAll('.btn-bookmark');
  if (bookmarkButtons.length > 0) {
    bookmarkButtons.forEach(btn => {
      btn.addEventListener('click', function () {
        this.classList.toggle('active');
        this.classList.add('pulse');
        
        const icon = this.querySelector('i');
        if (this.classList.contains('active')) {
          icon.className = 'fa-solid fa-bookmark fs-5';
        } else {
          icon.className = 'fa-regular fa-bookmark fs-5';
        }
        
        setTimeout(() => {
          this.classList.remove('pulse');
        }, 300);
      });
    });
  }

  // ==========================================================================
  // F. Dynamic Split-Pane Job Search Directory
  // ==========================================================================
  const jobFeedList = document.getElementById('job-feed-list');
  const detailsPane = document.getElementById('job-details-pane-container');

  if (jobFeedList && detailsPane) {
    const jobCards = jobFeedList.querySelectorAll('.job-item-card');

    // Render details function
    function renderJobDetails(card) {
      const title = card.getAttribute('data-title');
      const company = card.getAttribute('data-company');
      const logoClass = card.getAttribute('data-logo-class');
      const location = card.getAttribute('data-location');
      const stipend = card.getAttribute('data-stipend');
      const duration = card.getAttribute('data-duration');
      const deadline = card.getAttribute('data-deadline');
      const skills = card.getAttribute('data-skills').split(',');
      const desc = card.getAttribute('data-desc');
      const responsibilities = card.getAttribute('data-responsibilities').split('<br>');

      // Skills HTML badges
      const skillsHtml = skills.map(skill => `<span class="badge-skill me-1 mb-1">${skill.trim()}</span>`).join('');

      // Responsibilities HTML list items
      const respHtml = responsibilities.map(resp => `<li>${resp.trim()}</li>`).join('');

      // Is bookmarked state
      const isBookmarked = card.querySelector('.btn-bookmark').classList.contains('active');
      const bookmarkIconClass = isBookmarked ? 'fa-solid fa-bookmark' : 'fa-regular fa-bookmark';

      const contentHtml = `
        <div class="job-details-header">
          <div class="header-orb"></div>
          <div class="d-flex justify-content-between align-items-start position-relative">
            <div>
              <h4 class="fw-bold mb-1">${title}</h4>
              <p class="text-accent mb-2 fw-semibold"><i class="fa-solid fa-building me-1"></i>${company}</p>
              <span class="badge bg-light-primary text-primary px-2 py-1 rounded-2 fs-9"><i class="fa-solid fa-location-dot me-1 animate-icon-pin"></i>${location}</span>
            </div>
            <button class="btn-bookmark btn btn-light rounded-circle shadow-sm border p-2 text-primary" style="width: 38px; height: 38px; display: flex; align-items: center; justify-content: center;" aria-label="Bookmark" onclick="toggleMainBookmark(this, '${title}')">
              <i class="${bookmarkIconClass} fs-6"></i>
            </button>
          </div>
        </div>
        <div class="job-details-body fade-up-anim">
          <div class="row g-3 mb-4 text-center">
            <div class="col-4 border-end">
              <span class="d-block text-muted fs-8">STIPEND</span>
              <strong class="text-secondary d-block"><i class="fa-solid fa-hand-holding-dollar me-1 text-primary animate-icon-stipend"></i>${stipend}</strong>
            </div>
            <div class="col-4 border-end">
              <span class="d-block text-muted fs-8">DURATION</span>
              <strong class="text-secondary d-block"><i class="fa-regular fa-clock me-1 text-primary"></i>${duration}</strong>
            </div>
            <div class="col-4">
              <span class="d-block text-muted fs-8">DEADLINE</span>
              <strong class="text-secondary d-block"><i class="fa-regular fa-calendar-days me-1 text-primary animate-icon-calendar"></i>${deadline}</strong>
            </div>
          </div>

          <h6 class="fw-bold text-secondary mb-2">Role Overview</h6>
          <p class="text-muted fs-7 mb-4 leading-relaxed">${desc}</p>

          <h6 class="fw-bold text-secondary mb-2">Key Responsibilities</h6>
          <ul class="text-muted fs-7 mb-4 ps-3 leading-relaxed" style="list-style-type: decimal;">
            ${respHtml}
          </ul>

          <h6 class="fw-bold text-secondary mb-3">Skills Required</h6>
          <div class="mb-4">
            ${skillsHtml}
          </div>

          <hr class="mb-4">

          <div class="d-flex gap-2">
            <button class="btn btn-primary w-100 py-2.5 shadow-sm" onclick="openQuickApply('${title}', '${company}')"><i class="fa-solid fa-paper-plane me-2"></i>Apply Now</button>
            <button class="btn btn-outline-secondary py-2.5 px-3" onclick="alert('Share link copied to clipboard!')"><i class="fa-solid fa-share-nodes"></i></button>
          </div>
        </div>
      `;

      detailsPane.innerHTML = contentHtml;
    }

    // Toggle bookmark from main pane
    window.toggleMainBookmark = function(btn, title) {
      btn.classList.toggle('active');
      btn.classList.add('pulse');
      const icon = btn.querySelector('i');
      
      // Find corresponding card in feed and toggle bookmark icon
      let matchingCard = null;
      jobCards.forEach(c => {
        if (c.getAttribute('data-title') === title) {
          matchingCard = c;
        }
      });

      if (btn.classList.contains('active')) {
        icon.className = 'fa-solid fa-bookmark fs-6';
        if (matchingCard) {
          const cardBtn = matchingCard.querySelector('.btn-bookmark');
          cardBtn.classList.add('active');
          cardBtn.querySelector('i').className = 'fa-solid fa-bookmark';
        }
      } else {
        icon.className = 'fa-regular fa-bookmark fs-6';
        if (matchingCard) {
          const cardBtn = matchingCard.querySelector('.btn-bookmark');
          cardBtn.classList.remove('active');
          cardBtn.querySelector('i').className = 'fa-regular fa-bookmark';
        }
      }

      setTimeout(() => {
        btn.classList.remove('pulse');
      }, 300);
    }

    // Render details for first card by default on desktop
    const activeCard = jobFeedList.querySelector('.job-item-card.active-job') || jobCards[0];
    if (activeCard && window.innerWidth >= 992) {
      renderJobDetails(activeCard);
    }

    // Add card click events
    jobCards.forEach(card => {
      card.addEventListener('click', function(e) {
        // Prevent trigger if clicking bookmark directly
        if (e.target.closest('.btn-bookmark')) return;

        // Check screen width for mobile vs desktop layout
        if (window.innerWidth < 992) {
          // Open details modal on mobile
          openMobileDetailsModal(card);
        } else {
          // Update desktop details pane
          jobCards.forEach(c => c.classList.remove('active-job'));
          card.classList.add('active-job');
          renderJobDetails(card);
        }
      });
    });

    // Mobile job details modal function
    function openMobileDetailsModal(card) {
      const title = card.getAttribute('data-title');
      const company = card.getAttribute('data-company');
      const location = card.getAttribute('data-location');
      const stipend = card.getAttribute('data-stipend');
      const duration = card.getAttribute('data-duration');
      const deadline = card.getAttribute('data-deadline');
      const skills = card.getAttribute('data-skills').split(',');
      const desc = card.getAttribute('data-desc');
      const responsibilities = card.getAttribute('data-responsibilities').split('<br>');

      const skillsHtml = skills.map(skill => `<span class="badge-skill me-1 mb-1">${skill.trim()}</span>`).join('');
      const respHtml = responsibilities.map(resp => `<li>${resp.trim()}</li>`).join('');

      // Build inside modal-job-details-body
      document.getElementById('jobDetailsModalLabel').textContent = title;
      document.getElementById('modal-company-name').innerHTML = `<i class="fa-solid fa-building me-1"></i>${company}`;
      
      const isBookmarked = card.querySelector('.btn-bookmark').classList.contains('active');
      const bookmarkBtn = document.getElementById('modal-bookmark-btn');
      bookmarkBtn.className = isBookmarked ? 'btn btn-bookmark btn-primary btn-sm px-3' : 'btn btn-bookmark btn-outline-secondary btn-sm px-3';
      bookmarkBtn.innerHTML = `<i class="${isBookmarked ? 'fa-solid' : 'fa-regular'} fa-bookmark me-2"></i>Bookmark`;

      // Assign click handlers
      bookmarkBtn.onclick = function() {
        toggleMainBookmark(bookmarkBtn, title);
      };

      document.getElementById('modal-apply-btn').onclick = function() {
        const modalEl = document.getElementById('jobDetailsModal');
        const modalInstance = bootstrap.Modal.getInstance(modalEl);
        if (modalInstance) {
          modalInstance.hide();
        }
        openQuickApply(title, company);
      };

      const contentHtml = `
        <div class="row g-3 mb-4 text-center">
          <div class="col-4 border-end">
            <span class="d-block text-muted fs-8">STIPEND</span>
            <strong class="text-secondary d-block"><i class="fa-solid fa-hand-holding-dollar me-1 text-primary animate-icon-stipend"></i>${stipend}</strong>
          </div>
          <div class="col-4 border-end">
            <span class="d-block text-muted fs-8">DURATION</span>
            <strong class="text-secondary d-block"><i class="fa-regular fa-clock me-1 text-primary"></i>${duration}</strong>
          </div>
          <div class="col-4">
            <span class="d-block text-muted fs-8">DEADLINE</span>
            <strong class="text-secondary d-block"><i class="fa-regular fa-calendar-days me-1 text-primary animate-icon-calendar"></i>${deadline}</strong>
          </div>
        </div>

        <h6 class="fw-bold text-secondary mb-2">Role Overview</h6>
        <p class="text-muted fs-7 mb-4 leading-relaxed">${desc}</p>

        <h6 class="fw-bold text-secondary mb-2">Key Responsibilities</h6>
        <ul class="text-muted fs-7 mb-4 ps-3 leading-relaxed" style="list-style-type: decimal;">
          ${respHtml}
        </ul>

        <h6 class="fw-bold text-secondary mb-3">Skills Required</h6>
        <div class="mb-3">
          ${skillsHtml}
        </div>
      `;

      document.getElementById('modal-job-details-body').innerHTML = contentHtml;

      const myModal = new bootstrap.Modal(document.getElementById('jobDetailsModal'));
      myModal.show();
    }
  }

  // ==========================================================================
  // G. Quick Apply Modal Logic
  // ==========================================================================
  window.openQuickApply = function(jobTitle, company) {
    document.getElementById('apply-job-title').value = jobTitle;
    document.getElementById('apply-company').value = company;
    
    // Clear validation error and files
    const errLabel = document.getElementById('resume-validation-error');
    const selLabel = document.getElementById('resume-file-selected');
    if (errLabel) errLabel.classList.add('d-none');
    if (selLabel) selLabel.classList.add('d-none');
    
    const applyFileInput = document.getElementById('apply-resume');
    if (applyFileInput) applyFileInput.value = '';

    const applyModal = new bootstrap.Modal(document.getElementById('applyModal'));
    applyModal.show();
  };

  const applyDragZone = document.getElementById('apply-drag-zone');
  const applyFileInput = document.getElementById('apply-resume');
  if (applyDragZone && applyFileInput) {
    applyDragZone.addEventListener('click', () => applyFileInput.click());

    applyDragZone.addEventListener('dragover', (e) => {
      e.preventDefault();
      applyDragZone.style.borderColor = 'var(--primary)';
      applyDragZone.style.backgroundColor = 'rgba(37, 99, 235, 0.05)';
    });

    applyDragZone.addEventListener('dragleave', () => {
      applyDragZone.style.borderColor = 'var(--border-light)';
      applyDragZone.style.backgroundColor = 'rgba(37, 99, 235, 0.01)';
    });

    applyDragZone.addEventListener('drop', (e) => {
      e.preventDefault();
      applyDragZone.style.borderColor = 'var(--border-light)';
      applyDragZone.style.backgroundColor = 'rgba(37, 99, 235, 0.01)';
      
      if (e.dataTransfer.files.length > 0) {
        const file = e.dataTransfer.files[0];
        if (file.type === 'application/pdf') {
          applyFileInput.files = e.dataTransfer.files;
          showSelectedFile(file.name);
        } else {
          alert('Please upload a PDF file only.');
        }
      }
    });

    applyFileInput.addEventListener('change', () => {
      if (applyFileInput.files.length > 0) {
        showSelectedFile(applyFileInput.files[0].name);
      }
    });

    function showSelectedFile(name) {
      const selectedLabel = document.getElementById('resume-file-selected');
      if (selectedLabel) {
        selectedLabel.querySelector('span').textContent = `Selected: ${name}`;
        selectedLabel.classList.remove('d-none');
      }
      const errLabel = document.getElementById('resume-validation-error');
      if (errLabel) errLabel.classList.add('d-none');
    }
  }

  const quickApplyForm = document.getElementById('quick-apply-form');
  if (quickApplyForm) {
    quickApplyForm.addEventListener('submit', function(e) {
      e.preventDefault();
      
      const fileUploaded = applyFileInput && applyFileInput.files.length > 0;
      if (!fileUploaded) {
        const errLabel = document.getElementById('resume-validation-error');
        if (errLabel) errLabel.classList.remove('d-none');
        return;
      }

      const jobName = document.getElementById('apply-job-title').value;
      const companyName = document.getElementById('apply-company').value;
      
      // Hide modal
      const modalEl = document.getElementById('applyModal');
      const modalInstance = bootstrap.Modal.getInstance(modalEl);
      if (modalInstance) {
        modalInstance.hide();
      }

      alert(`Application submitted successfully for "${jobName}" at "${companyName}"!\n\nWe have received your resume. We will contact you soon.`);
      quickApplyForm.reset();
    });
  }
});
