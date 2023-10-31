const conn = require('../db');

module.exports = {
    predik:(req, res) => {
        const inputData = req.body;
    
        const insertQuery = 'INSERT INTO savepredict (kelas, confidence, description, prevention, userId) VALUES (?, ?, ?, ?, ?)';
        const insertValues = [inputData.kelas, inputData.confidence, inputData.description, inputData.prevention, inputData.userId];
        conn.query(insertQuery, insertValues, (err, results) => {
            if (err) {
            console.error('Gagal memasukkan data ke database: ' + err.message);
            res.status(500).json({ error: 'Gagal memasukkan data ke database' });
            } else {
            console.log('Data berhasil dimasukkan ke database dengan ID: ' + results.insertId);
            res.status(200).json({ message: 'Data berhasil dimasukkan ke database' });
            }
        });
    }
}
