
// Dom manipulations khdamin
document.addEventListener('DOMContentLoaded', function() {
    initNavigation();
    loadChartData();
});

function initNavigation() {
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
            document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
            
            this.classList.add('active');
            const pageId = this.getAttribute('data-page');
            document.getElementById(pageId).classList.add('active');
        });
    });
}

// jib data mn flask 
async function loadChartData() {
    try {
        const response = await fetch('/api/chart-data');
        const data = await response.json();
        
        createBarChart(data);
        createPieChart(data);
        
    } catch (error) {
        console.error('Error loading chart data:', error);
    }
}

function createBarChart(data) {
    const ctx = document.getElementById('barChart');
    if (!ctx) return;
    
    new Chart(ctx.getContext('2d'), {
        type: 'bar',
        data: {
            labels: data.categories,
            datasets: [{
                label: 'Stock Quantity',
                data: data.quantities,
                backgroundColor: [
                    '#FF6384',
                    '#36A2EB',
                    '#FFCE56',
                    '#4BC0C0',
                    '#9966FF',
                    '#FF9F40'
                ],
                borderColor: '#333',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: { display: false },
                title: {
                    display: true,
                    text: 'Stock Analysis by Category (Processed with Pandas & NumPy)'
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Quantity in Stock' }
                },
                x: {
                    title: { display: true, text: 'Product Category' }
                }
            }
        }
    });
}

function createPieChart(data) {
    const ctx = document.getElementById('pieChart');
    if (!ctx) return;
    
    new Chart(ctx.getContext('2d'), {
        type: 'pie',
        data: {
            labels: data.categories,
            datasets: [{
                data: data.quantities,
                backgroundColor: [
                    '#FF6384',
                    '#36A2EB',
                    '#FFCE56',
                    '#4BC0C0',
                    '#9966FF',
                    '#FF9F40'
                ]
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: { position: 'bottom' },
                title: {
                    display: true,
                    text: 'Stock Distribution (Analyzed with Pandas)'
                }
            }
        }
    });
}


async function loadMatplotlibChart() {
    try {
        const response = await fetch('/api/matplotlib-chart');
        const result = await response.json();
        
        // Afficher l'image matplotlib
        const img = document.createElement('img');
        img.src = result.image;
        img.style.width = '100%';
        document.getElementById('matplotlib-container').appendChild(img);
        
    } catch (error) {
        console.error('Error loading matplotlib chart:', error);
    }
}