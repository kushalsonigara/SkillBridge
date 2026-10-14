
/* ==========================================================================
   Internship Management Portal - Dashboard Charts & Logic (dashboard.js)
   ========================================================================== */

document.addEventListener('DOMContentLoaded', function () {

    // Theme Color Presets to Match design system
    const colors = {
        primary: '#2563EB',
        success: '#10B981',
        warning: '#F59E0B',
        danger: '#EF4444',
        info: '#06B6D4',
        secondary: '#0F172A',
        grayLight: '#E2E8F0',
        grayDark: '#475569',
    };

    // 1. Company Dashboard Charts Setup
    const companyMonthlyCtx = document.getElementById('companyMonthlyChart');
    const companyStatusCtx = document.getElementById('companyStatusChart');

    if (companyMonthlyCtx) {
        new Chart(companyMonthlyCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Applications Received',
                    data: [12, 19, 15, 28, 22, 35],
                    borderColor: colors.primary,
                    backgroundColor: 'rgba(37, 99, 235, 0.1)',
                    fill: true,
                    tension: 0.4,
                    borderWidth: 3
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        grid: { color: colors.grayLight },
                        ticks: { color: colors.grayDark }
                    },
                    x: {
                        grid: { display: false },
                        ticks: { color: colors.grayDark }
                    }
                }
            }
        });
    }

    if (companyStatusCtx) {
        new Chart(companyStatusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Selected', 'Pending', 'Interview', 'Rejected'],
                datasets: [{
                    data: [15, 12, 8, 5],
                    backgroundColor: [
                        colors.success,
                        colors.warning,
                        colors.primary,
                        colors.danger
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            boxWidth: 12,
                            color: colors.grayDark,
                            padding: 15
                        }
                    }
                },
                cutout: '70%'
            }
        });
    }

    // 2. Reports Module Charts Setup
    const reportMainCtx = document.getElementById('reportMainChart');

    if (reportMainCtx) {
        new Chart(reportMainCtx, {
            type: 'doughnut',
            data: {
                labels: [
                    'Accepted',
                    'Pending Review',
                    'Under Interview',
                    'Rejected'
                ],
                datasets: [{
                    data: [350, 240, 180, 95],
                    backgroundColor: [
                        colors.success,
                        colors.warning,
                        colors.primary,
                        colors.danger
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            boxWidth: 15,
                            color: colors.grayDark,
                            padding: 15
                        }
                    }
                },
                cutout: '60%'
            }
        });
    }

    // 3. Mock Reports Export Buttons handler
    const btnExports = document.querySelectorAll('.btn-export-report');

    btnExports.forEach(btn => {
        btn.addEventListener('click', function () {
            const type = this.getAttribute('data-type');
            const format = this.getAttribute('data-format') || 'CSV';

            this.innerHTML =
                '<i class="fa-solid fa-spinner fa-spin me-2"></i>Exporting...';

            this.disabled = true;

            setTimeout(() => {
                alert(`${ type } Report successfully exported to ${ format } format!`);

                this.innerHTML =
                    `< i class="fa-solid fa-download me-2" ></i > Download ${ format } `;

                this.disabled = false;
            }, 1500);
        });
    });

    // 4. Activity log delete actions trigger
    const btnDeleteInternships = document.querySelectorAll('.btn-delete-internship');

    btnDeleteInternships.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();

            const row = this.closest('tr');

            if (confirm('Are you sure you want to delete this internship position?')) {
                row.style.opacity = '0';

                setTimeout(() => {
                    row.remove();
                    alert('Internship position has been successfully removed.');
                }, 300);
            }
        });
    });

});
