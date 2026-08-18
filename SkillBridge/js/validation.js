/* ==========================================================================
   Internship Management Portal - Validations & Dynamic Forms (validation.js)
   ========================================================================== */

document.addEventListener('DOMContentLoaded', function () {
  
  // 1. Password Visibility Toggle Utility
  const toggleButtons = document.querySelectorAll('.password-toggle-btn');
  toggleButtons.forEach(btn => {
    btn.addEventListener('click', function () {
      const input = this.closest('.password-field-container').querySelector('input');
      const icon = this.querySelector('i');
      if (input.type === 'password') {
        input.type = 'text';
        icon.classList.replace('fa-eye', 'fa-eye-slash');
      } else {
        input.type = 'password';
        icon.classList.replace('fa-eye-slash', 'fa-eye');
      }
    });
  });

  // 2. Tab Switcher Logic in register.html (Student vs Company Registration Cards)
  const tabStudentBtn = document.getElementById('tab-student-btn');
  const tabCompanyBtn = document.getElementById('tab-company-btn');
  const studentFormCard = document.getElementById('student-reg-card');
  const companyFormCard = document.getElementById('company-reg-card');

  if (tabStudentBtn && tabCompanyBtn && studentFormCard && companyFormCard) {
    tabStudentBtn.addEventListener('click', function () {
      tabStudentBtn.classList.add('active');
      tabCompanyBtn.classList.remove('active');
      studentFormCard.classList.remove('d-none');
      companyFormCard.classList.add('d-none');
    });

    tabCompanyBtn.addEventListener('click', function () {
      tabCompanyBtn.classList.add('active');
      tabStudentBtn.classList.remove('active');
      companyFormCard.classList.remove('d-none');
      studentFormCard.classList.add('d-none');
    });
  }

  // 3. Dynamic Skills Adding Tag system
  const skillInput = document.getElementById('skill-input');
  const skillsWrapper = document.getElementById('skills-wrapper');
  const hiddenSkillsField = document.getElementById('hidden-skills-field');

  if (skillInput && skillsWrapper) {
    let skillList = [];

    // Pre-populate if skill-tags already exist in DOM (profile view/edit)
    const existingTags = skillsWrapper.querySelectorAll('.skill-badge-removable');
    existingTags.forEach(tag => {
      const val = tag.textContent.trim();
      skillList.push(val);
    });

    function updateHiddenField() {
      if (hiddenSkillsField) {
        hiddenSkillsField.value = skillList.join(',');
      }
    }

    function createSkillTag(skillName) {
      const cleanName = skillName.trim();
      if (!cleanName || skillList.includes(cleanName)) return;

      skillList.push(cleanName);
      
      const tag = document.createElement('span');
      tag.className = 'skill-badge-removable';
      tag.innerHTML = `${cleanName} <i class="fa-solid fa-xmark text-danger ms-2 btn-remove-tag"></i>`;
      
      // Add remove handler
      tag.querySelector('.btn-remove-tag').addEventListener('click', function () {
        skillList = skillList.filter(s => s !== cleanName);
        tag.remove();
        updateHiddenField();
      });

      skillsWrapper.insertBefore(tag, skillInput);
      updateHiddenField();
    }

    skillInput.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ',') {
        e.preventDefault();
        createSkillTag(this.value);
        this.value = '';
      }
    });

    skillInput.addEventListener('blur', function () {
      if (this.value) {
        createSkillTag(this.value);
        this.value = '';
      }
    });
  }

  // 4. Client Side Forms Validations
  const formsToValidate = document.querySelectorAll('.needs-validation-custom');
  
  formsToValidate.forEach(form => {
    form.addEventListener('submit', function (event) {
      let isFormValid = true;
      
      // Get all inputs requiring validation
      const requiredInputs = form.querySelectorAll('[required]');
      
      requiredInputs.forEach(input => {
        // Clear previous validations
        input.classList.remove('is-invalid');
        
        // General empty check
        if (!input.value.trim()) {
          input.classList.add('is-invalid');
          isFormValid = false;
        } 
        // Email validations
        else if (input.type === 'email' && !validateEmail(input.value)) {
          input.classList.add('is-invalid');
          isFormValid = false;
        }
        // Mobile validations
        else if (input.id === 'student-phone' && !validatePhone(input.value)) {
          input.classList.add('is-invalid');
          isFormValid = false;
        }
        // Password Match checks
        else if (input.id === 'student-confirm-password' || input.id === 'company-confirm-password') {
          const passId = input.id.includes('student') ? 'student-password' : 'company-password';
          const primaryPass = document.getElementById(passId);
          if (primaryPass && primaryPass.value !== input.value) {
            input.classList.add('is-invalid');
            isFormValid = false;
          }
        }
      });

      if (!isFormValid) {
        event.preventDefault();
        event.stopPropagation();
        alert('Please review form inputs and correct any highlight errors.');
      } else {
        // For mock template demonstration
        event.preventDefault();
        
        // Show success action depending on form name
        const actionMessage = form.getAttribute('data-success-msg') || 'Action completed successfully!';
        alert(actionMessage);
        
        const redirectUrl = form.getAttribute('data-redirect');
        if (redirectUrl) {
          window.location.href = redirectUrl;
        }
      }
    });
  });

  // Helpers
  function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
  }

  function validatePhone(phone) {
    const re = /^\d{10}$/; // Simple 10 digit match
    return re.test(String(phone));
  }
});
