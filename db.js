const mysql2 = require('mysql2');
require('dotenv').config();

function createConnection() {
    const conn = mysql2.createConnection({
        host     : process.env.DB_HOST,
        user     : process.env.DB_USER,
        password : process.env.DB_PASSWORD,
        database : process.env.DB_DATABASE
    });

    conn.connect((err) => {
        if (err) {
            console.error('Kesalahan saat membuat koneksi:', err);
            setTimeout(createConnection, 2000);
        } else {
            console.log('nyambung ke database');
        }
    });

    conn.on('error', (err) => {
        console.error('Kesalahan koneksi:', err);
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            setTimeout(createConnection, 2000);
        } else {
            throw err;
        }
    });

    return conn;
}

module.exports = createConnection();
