const express = require('express');
const cors = require('cors');
const eventRoutes = require('./routes/events');

const app = express();
const PORT = process.env.PORT || 3000;

// 中间件
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// 路由
app.use('/api/events', eventRoutes);

// 根路径
app.get('/', (req, res) => {
    res.json({
        message: 'Charity Events API is running!',
        endpoints: {
            home: '/api/events/home',
            categories: '/api/events/categories',
            search: '/api/events/search',
            event: '/api/events/:id'
        }
    });
});

// 启动服务器
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

module.exports = app;