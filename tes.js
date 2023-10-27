const express = require('express');
const axios = require('axios');
const app = express();
const port = 5000; // Ganti dengan port yang Anda inginkan

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Definisikan endpoint untuk mengunggah file gambar
app.post('/upload', async (req, res) => {
  try {
    // Mengambil file gambar dari request
    const imageFile = req.body.file; // Pastikan Anda sudah memproses request untuk menyimpan file gambar ke req.body.file

    // Kirim file gambar ke endpoint GCP Anda
    const response = await axios.post('https://us-central1-deploy-402513.cloudfunctions.net/predict', {
      file: imageFile,
    });

    // Tanggapan dari endpoint GCP
    const prediction = response.data;

    // Kirim prediksi sebagai respons dari backend Anda
    res.json(prediction);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Terjadi kesalahan dalam permintaan ke GCP.' });
  }
});

app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
