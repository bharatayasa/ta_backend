'use strict';

const express = require('express');
const app = express();
const cors = require('cors');
require('dotenv').config();
const routes = require('./router/endpoin');

app.use(express.json());
app.use(routes);

const corsOptions = {
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
    optionsSuccessStatus: 204,
};
app.use(cors(corsOptions));

app.get('/', (req, res) => {
    res.send('server berjalan');
});

const host = 'localhost';
const port = process.env.PORT

app.listen(port, host, () => {
    console.log(`Server berjalan di http://${host}:${port}`);
});
