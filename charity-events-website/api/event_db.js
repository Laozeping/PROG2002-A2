const mysql = require('mysql2');
const db = require('./config/database');

// 这个文件现在主要用于向后兼容
// 实际的数据库操作已经在 routes/events.js 中实现

module.exports = db;