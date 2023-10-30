const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const secretKey = 'your_secret_key';

const userController = require('../controller/users');
const news = require('../controller/news');
const predik = require('../controller/predikInput'); 

// Middleware untuk verifikasi akses token
function verifyAccessToken(req, res, next) {
    const token = req.header('Authorization');
    if (!token) {
        return res.status(401).json({ status: 'error', message: 'Unauthorized' });
    }
    jwt.verify(token, secretKey, (err, user) => {
        if (err) {
            return res.status(403).json({ status: 'error', message: 'Access denied' });
        }
        req.user = user;
        next();
    });
}

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/users/me', verifyAccessToken, userController.getMe);
router.get('/admin/users', verifyAccessToken, userController.getAllUsers);
router.get('/admin/user/:id', verifyAccessToken, userController.getUserById);
router.post('/admin/adduser', verifyAccessToken, userController.adminAddUser);
router.put('/admin/updateuser/:id', verifyAccessToken, userController.adminUpdateUser);
router.delete('/admin/deleteuser/:id', verifyAccessToken, userController.adminDeleteUser);

// predik
router.post('/savepredict', verifyAccessToken, predik.predik);

// news
router.get('/newsLokal', news.newsLokal);
router.get('/newsInter', news.newsinter);

module.exports = router;
