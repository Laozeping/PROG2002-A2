// API基础URL - 根据你的服务器配置修改
const API_BASE_URL = 'http://localhost:3000/api';

// 通用工具函数
class CharityEventsApp {
    // 显示加载状态
    static showLoading(elementId) {
        const element = document.getElementById(elementId);
        if (element) {
            element.style.display = 'block';
        }
    }

    // 隐藏加载状态
    static hideLoading(elementId) {
        const element = document.getElementById(elementId);
        if (element) {
            element.style.display = 'none';
        }
    }

    // 显示错误消息
    static showError(elementId, message = null) {
        const element = document.getElementById(elementId);
        if (element) {
            if (message) {
                element.textContent = message;
            }
            element.style.display = 'block';
        }
    }

    // 隐藏错误消息
    static hideError(elementId) {
        const element = document.getElementById(elementId);
        if (element) {
            element.style.display = 'none';
        }
    }

    // 格式化日期
    static formatDate(dateString) {
        const date = new Date(dateString);
        return date.toLocaleDateString('en-AU', {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    // 格式化货币
    static formatCurrency(amount) {
        return new Intl.NumberFormat('en-AU', {
            style: 'currency',
            currency: 'AUD'
        }).format(amount);
    }

    // 计算筹款进度百分比 - 更新字段名
    static calculateProgress(current, goal) {
        if (!goal || goal === 0) return 0;
        return Math.min(Math.round((current / goal) * 100), 100);
    }

    // 显示注册模态框
    static showRegisterModal() {
        const modal = document.getElementById('register-modal');
        if (modal) {
            modal.style.display = 'flex';
        }
    }

    // 关闭模态框
    static closeModal() {
        const modal = document.getElementById('register-modal');
        if (modal) {
            modal.style.display = 'none';
        }
    }
}

// 全局关闭模态框函数
function closeModal() {
    CharityEventsApp.closeModal();
}

// 点击模态框外部关闭
document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('register-modal');
    if (modal) {
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                CharityEventsApp.closeModal();
            }
        });

        const closeButton = modal.querySelector('.close-button');
        if (closeButton) {
            closeButton.addEventListener('click', CharityEventsApp.closeModal);
        }
    }

    // 新增：导航栏注册按钮事件监听
    const navRegisterBtn = document.getElementById('nav-register-btn');
    if (navRegisterBtn) {
        navRegisterBtn.addEventListener('click', function() {
            CharityEventsApp.showRegisterModal();
        });
    }
});