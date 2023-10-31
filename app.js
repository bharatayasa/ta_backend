'use strict';
const express = require('express');
const app = express();
const routes = require('./router/endpoin');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const corsOptions = {
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
    optionsSuccessStatus: 204,
};

app.use(cors(corsOptions));
app.use(express.json());
app.use(routes);

app.get('/', (req, res) => {
    res.send('Server berjalan');
});

const host = 'localhost';
const port = process.env.PORT;

app.listen(port, host, () => {
    console.log(`Server berjalan di http://${host}:${port}`);
});
