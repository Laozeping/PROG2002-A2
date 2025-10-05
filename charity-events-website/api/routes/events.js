const express = require('express');
const router = express.Router();
const db = require('../config/database');

/**
 * @route GET /api/events/home
 * @description 获取首页显示的活动列表（当前和即将到来的活动）
 */
router.get('/home', async (req, res) => {
    try {
        const query = `
            SELECT 
                e.*,
                c.name as category_name,
                o.name as organisation_name
            FROM events e
            LEFT JOIN categories c ON e.category_id = c.id
            LEFT JOIN organizations o ON e.organization_id = o.id
            WHERE e.is_active = TRUE 
            AND e.is_suspended = FALSE
            AND e.event_date >= CURDATE()
            ORDER BY e.event_date ASC
            LIMIT 10
        `;
        
        const [events] = await db.execute(query);
        
        res.json({
            success: true,
            data: events,
            count: events.length
        });
    } catch (error) {
        console.error('Error fetching home events:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error'
        });
    }
});

/**
 * @route GET /api/events/categories
 * @description 获取所有活动类别
 */
router.get('/categories', async (req, res) => {
    try {
        const query = 'SELECT * FROM categories ORDER BY name';
        const [categories] = await db.execute(query);
        
        res.json({
            success: true,
            data: categories
        });
    } catch (error) {
        console.error('Error fetching categories:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error'
        });
    }
});

/**
 * @route GET /api/events/search
 * @description 根据条件搜索活动
 */
router.get('/search', async (req, res) => {
    try {
        const { date, location, category } = req.query;
        
        let query = `
            SELECT 
                e.*,
                c.name as category_name,
                o.name as organisation_name
            FROM events e
            LEFT JOIN categories c ON e.category_id = c.id
            LEFT JOIN organizations o ON e.organization_id = o.id
            WHERE e.is_active = TRUE
            AND e.is_suspended = FALSE
        `;
        
        const params = [];
        
        // 构建动态查询条件
        if (date) {
            query += ' AND DATE(e.event_date) = ?';
            params.push(date);
        }
        
        if (location) {
            query += ' AND e.location LIKE ?';
            params.push(`%${location}%`);
        }
        
        if (category) {
            query += ' AND e.category_id = ?';
            params.push(category);
        }
        
        query += ' ORDER BY e.event_date ASC';
        
        const [events] = await db.execute(query, params);
        
        res.json({
            success: true,
            data: events,
            count: events.length,
            filters: { date, location, category }
        });
    } catch (error) {
        console.error('Error searching events:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error'
        });
    }
});

/**
 * @route GET /api/events/:id
 * @description 获取特定活动的详细信息
 */
router.get('/:id', async (req, res) => {
    try {
        const eventId = req.params.id;
        
        const query = `
            SELECT 
                e.*,
                c.name as category_name,
                c.description as category_description,
                o.name as organisation_name,
                o.description as organisation_description,
                o.contact_email,
                o.contact_phone,
                o.address
            FROM events e
            LEFT JOIN categories c ON e.category_id = c.id
            LEFT JOIN organizations o ON e.organization_id = o.id
            WHERE e.id = ? AND e.is_active = TRUE AND e.is_suspended = FALSE
        `;
        
        const [events] = await db.execute(query, [eventId]);
        
        if (events.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Event not found'
            });
        }
        
        res.json({
            success: true,
            data: events[0]
        });
    } catch (error) {
        console.error('Error fetching event details:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error'
        });
    }
});

module.exports = router;