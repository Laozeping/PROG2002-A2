// 活动详情页面JavaScript
document.addEventListener('DOMContentLoaded', function() {
    loadEventDetails();
});

// 加载活动详情
async function loadEventDetails() {
    const urlParams = new URLSearchParams(window.location.search);
    const eventId = urlParams.get('id');

    if (!eventId) {
        CharityEventsApp.showError('event-error', 'No event ID provided.');
        return;
    }

    try {
        CharityEventsApp.showLoading('event-loading');
        CharityEventsApp.hideError('event-error');

        const response = await fetch(`${API_BASE_URL}/events/${eventId}`);
        const result = await response.json();

        if (!response.ok) {
            throw new Error(result.message || 'Failed to load event details');
        }

        if (result.success) {
            displayEventDetails(result.data);
        } else {
            throw new Error('Event not found');
        }
    } catch (error) {
        console.error('Error loading event details:', error);
        CharityEventsApp.showError('event-error', 'Failed to load event details. Please try again later.');
    } finally {
        CharityEventsApp.hideLoading('event-loading');
    }
}

// 显示活动详情 - 更新字段名
function displayEventDetails(event) {
    const container = document.getElementById('event-container');
    // 使用你的数据库字段名：goal_amount 和 current_amount
    const progress = CharityEventsApp.calculateProgress(event.current_amount, event.goal_amount);
    const formattedDate = CharityEventsApp.formatDate(event.event_date);
    const formattedPrice = event.ticket_price > 0 ? 
        CharityEventsApp.formatCurrency(event.ticket_price) : 'Free';

    container.innerHTML = `
        <div class="event-detail-header">
            <h1>${event.title}</h1>
            <div class="event-meta">
                <p><strong>📅 Date & Time:</strong> ${formattedDate}</p>
                <p><strong>📍 Location:</strong> ${event.location}</p>
                <p><strong>🏢 Venue:</strong> ${event.venue_details || 'TBA'}</p>
                <p><strong>🎯 Category:</strong> ${event.category_name}</p>
                <p><strong>🏢 Organised by:</strong> ${event.organisation_name}</p>
            </div>
        </div>

        <div class="event-detail-content">
            <div class="event-main-info">
                <h2>About This Event</h2>
                <p>${event.full_description || event.description}</p>
                
                <h3>Event Description</h3>
                <p>${event.description}</p>

                ${event.goal_amount ? `
                <div class="fundraising-goal">
                    <h3>Fundraising Progress</h3>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${progress}%"></div>
                    </div>
                    <div class="progress-text">
                        <strong>${CharityEventsApp.formatCurrency(event.current_amount)} raised of 
                        ${CharityEventsApp.formatCurrency(event.goal_amount)} goal (${progress}%)</strong>
                    </div>
                    <p>Help us reach our fundraising target for ${event.organisation_name}'s important cause!</p>
                </div>
                ` : ''}
            </div>

            <div class="event-sidebar">
                <div class="ticket-info">
                    <h3>Registration</h3>
                    <div class="ticket-price">${formattedPrice}</div>
                    <p>${event.ticket_price > 0 ? 
                        'Your ticket purchase supports our cause' : 
                        'Free event - donations appreciated'
                    }</p>
                    <button class="btn btn-success" onclick="CharityEventsApp.showRegisterModal()" style="width:100%;margin-top:1rem;">
                        Register Now
                    </button>
                </div>

                <div class="organisation-info">
                    <h3>About ${event.organisation_name}</h3>
                    <p>${event.organisation_description || 'A dedicated charity organization making a difference in our community.'}</p>
                    <div class="contact-info">
                        <p><strong>Contact:</strong></p>
                        <p>📧 ${event.contact_email}</p>
                        <p>📞 ${event.contact_phone}</p>
                        <p>📍 ${event.address}</p>
                    </div>
                </div>
            </div>
        </div>
    `;

    container.style.display = 'block';
}