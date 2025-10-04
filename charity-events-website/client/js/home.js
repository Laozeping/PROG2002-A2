// 首页JavaScript
document.addEventListener('DOMContentLoaded', function() {
    loadHomeEvents();
});

// 加载首页活动
async function loadHomeEvents() {
    const container = document.getElementById('events-container');
    const loading = document.getElementById('events-loading');
    const error = document.getElementById('events-error');

    try {
        CharityEventsApp.showLoading('events-loading');
        CharityEventsApp.hideError('events-error');
        container.innerHTML = '';

        const response = await fetch(`${API_BASE_URL}/events/home`);
        const result = await response.json();

        if (!response.ok) {
            throw new Error(result.message || 'Failed to load events');
        }

        if (result.success && result.data.length > 0) {
            displayEvents(result.data, container);
        } else {
            container.innerHTML = '<p class="no-results">No upcoming events found.</p>';
        }
    } catch (error) {
        console.error('Error loading home events:', error);
        CharityEventsApp.showError('events-error', 'Failed to load events. Please try again later.');
    } finally {
        CharityEventsApp.hideLoading('events-loading');
    }
}

// 显示活动列表
function displayEvents(events, container) {
    container.innerHTML = events.map(event => createEventCard(event)).join('');
}

// 创建活动卡片HTML - 更新字段名
function createEventCard(event) {
    // 使用你的数据库字段名：goal_amount 和 current_amount
    const progress = CharityEventsApp.calculateProgress(event.current_amount, event.goal_amount);
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
                
                ${event.goal_amount ? `
                <div class="event-progress">
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${progress}%"></div>
                    </div>
                    <div class="progress-text">
                        Raised: ${CharityEventsApp.formatCurrency(event.current_amount)} / 
                        ${CharityEventsApp.formatCurrency(event.goal_amount)} (${progress}%)
                    </div>
                </div>
                ` : ''}
                
                <div class="event-actions">
                    <a href="event-details.html?id=${event.id}" class="btn btn-primary">View Details</a>
                    <span class="ticket-price-badge">${formattedPrice}</span>
                </div>
            </div>
        </div>
    `;
}