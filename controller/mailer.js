require('dotenv').config();
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_MAILER,
        pass: process.env.MAILER_PW
    }
});

module.exports = transporter;
