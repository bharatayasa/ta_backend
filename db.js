const mysql2 = require('mysql2');
require('dotenv').config();

const conn = mysql2.createConnection({
    host     : process.env.DB_HOST,
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_DATABASE
}); 

conn.connect((err) => {
    if (err) {
        console.error('Kesalahan saat membuat koneksi:', err);
        return;
    }
    console.log('nyambung ke database');
});

module.exports = conn; 
