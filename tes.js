const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2'); // Pastikan Anda telah menginstal modul mysql
const axios = require('axios');

app.use(bodyParser.json());
app.use(cors());

const dbConfig = {
    host     : '101.128.64.219',
    user     : 'bharata',
    password : 'Kanginkauh22',
    database : 'tomatify'
};

const conn = mysql.createConnection(dbConfig);

conn.connect((err) => {
  if (err) {
    console.error('Koneksi ke database gagal: ' + err.message);
  } else {
    console.log('Koneksi ke database berhasil');
  }
});

app.post('/save-result-endpoint', async (req, res) => {
  const resultData = req.body;

  // Lakukan pemanggilan ke endpoint eksternal
  try {
    const externalResponse = await axios.post('https://us-central1-deploy-402513.cloudfunctions.net/predict', {
      file: resultData.file, // Gantilah ini dengan properti yang sesuai dalam body Anda
    });

    const predictionData = externalResponse.data;

    // Simpan hasil prediksi ke database
    const sql = 'INSERT INTO prediction_results (class, confidence, description, prevention) VALUES (?, ?, ?, ?)';
    const values = [predictionData.class, predictionData.confidence, predictionData.description, predictionData.prevention];

    conn.query(sql, values, (err, result) => {
      if (err) {
        console.error('Gagal menyimpan hasil prediksi ke database: ' + err.message);
        res.status(500).json({ message: 'Gagal menyimpan hasil prediksi ke database' });
      } else {
        console.log('Hasil prediksi berhasil disimpan ke database');
        res.json({ message: 'Hasil prediksi berhasil disimpan ke database' });
      }
    });
  } catch (error) {
    console.error('Gagal memanggil endpoint eksternal:', error);
    res.status(500).json({ message: 'Gagal memanggil endpoint eksternal' });
  }
});

const host = 'localhost';
const port = process.env.PORT;

app.listen(port, host, () => {
  console.log(`Server berjalan di http://${host}:${port}`);
});
