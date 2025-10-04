// 搜索页面JavaScript
document.addEventListener('DOMContentLoaded', function() {
    loadCategories();
    setupEventListeners();
});

// 加载活动类别
async function loadCategories() {
    const categorySelect = document.getElementById('category');
    
    try {
        const response = await fetch(`${API_BASE_URL}/events/categories`);
        const result = await response.json();

        if (result.success) {
            categorySelect.innerHTML = '<option value="">All Categories</option>' +
                result.data.map(category => 
                    `<option value="${category.id}">${category.name}</option>`
                ).join('');
        }
    } catch (error) {
        console.error('Error loading categories:', error);
    }
}

// 设置事件监听器
function setupEventListeners() {
    const searchForm = document.getElementById('search-form');
    const clearButton = document.getElementById('clear-filters');

    searchForm.addEventListener('submit', handleSearch);
    clearButton.addEventListener('click', clearFilters);
}

// 处理搜索
async function handleSearch(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const searchParams = {
        date: formData.get('date'),
        location: formData.get('location'),
        category: formData.get('category')
    };

    await searchEvents(searchParams);
}

// 搜索活动
async function searchEvents(filters) {
    const container = document.getElementById('results-container');
    const loading = document.getElementById('results-loading');
    const noResults = document.getElementById('no-results');
    const error = document.getElementById('results-error');

    try {
        CharityEventsApp.showLoading('results-loading');
        CharityEventsApp.hideError('results-error');
        noResults.style.display = 'none';
        container.innerHTML = '';

        // 构建查询参数
        const queryParams = new URLSearchParams();
        Object.entries(filters).forEach(([key, value]) => {
            if (value) queryParams.append(key, value);
        });

        const response = await fetch(`${API_BASE_URL}/events/search?${queryParams}`);
        const result = await response.json();

        if (!response.ok) {
            throw new Error(result.message || 'Failed to search events');
        }

        if (result.success && result.data.length > 0) {
            displayEvents(result.data, container);
        } else {
            noResults.style.display = 'block';
        }
    } catch (error) {
        console.error('Error searching events:', error);
        CharityEventsApp.showError('results-error', 'Failed to search events. Please try again.');
    } finally {
        CharityEventsApp.hideLoading('results-loading');
    }
}

// 清除过滤器
function clearFilters() {
    document.getElementById('search-form').reset();
    document.getElementById('results-container').innerHTML = '';
    document.getElementById('no-results').style.display = 'none';
    document.getElementById('results-error').style.display = 'none';
}

// 显示搜索结果
function displayEvents(events, container) {
    container.innerHTML = events.map(event => createEventCard(event)).join('');
}

// 创建活动卡片HTML（与home.js中的类似但简化）
function createEventCard(event) {
    const formattedDate = CharityEventsApp.formatDate(event.event_date);
    const formattedPrice = event.ticket_price > 0 ? 
        CharityEventsApp.formatCurrency(event.ticket_price) : 'Free';

    return `
        <div class="event-card">
            <div class="event-image">
                ${event.image_url ? 
                    `<img src="${event.image_url}" alt="${event.title}" style="width:100%;height:100%;object-fit:cover;">` : 
                    'Event Image'
                }
            </div>
            <div class="event-content">
                <h3 class="event-title">${event.title}</h3>
                <div class="event-meta">
                    <strong>📅 ${formattedDate}</strong><br>
                    <strong>📍 ${event.location}</strong><br>
                    <strong>🎯 ${event.category_name}</strong>
                </div>
                <p class="event-description">${event.description}</p>
                <div class="event-actions">
                    <a href="event-details.html?id=${event.id}" class="btn btn-primary">View Details</a>
                    <span class="ticket-price-badge">${formattedPrice}</span>
                </div>
            </div>
        </div>
    `;
}