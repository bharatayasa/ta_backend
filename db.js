const mysql2 = require('mysql2');
require('dotenv').config();

function createConnection() {
    const conn = mysql2.createConnection({
        host     : process.env.DB_HOST,
        user     : process.env.DB_USER,
        password : process.env.DB_PASSWORD,
        database : process.env.DB_DATABASE
    });

    function handleDisconnect() {
        conn.connect((err) => {
            if (err) {
                console.error('Kesalahan saat membuat koneksi:', err);
                setTimeout(handleDisconnect, 2000);
            } else {
                console.log('Terhubung ke database');
            }
        });

        conn.on('error', (err) => {
            console.error('Kesalahan koneksi:', err);
            if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                console.log('Koneksi terputus. Mencoba menghubungkan kembali...');
                handleDisconnect();
            } else {
                throw err;
            }
        });
    }

    handleDisconnect();

    return conn;
}

module.exports = createConnection();
