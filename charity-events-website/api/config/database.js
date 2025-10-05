const mysql = require('mysql2');

// 创建数据库连接池
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root', // 根据你的MySQL设置修改
    password: '137855', // 根据你的MySQL设置修改
    database: 'charityevents_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// 将pool promise化以支持async/await
const promisePool = pool.promise();

module.exports = promisePool;