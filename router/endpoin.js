const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const secretKey = 'your_secret_key';

const userController = require('../controller/users');
const predik = require('../controller/predikInput');
const prediksiControl = require('../controller/prediksiControl');

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
router.get('/user/me', verifyAccessToken, userController.getMe);
router.get('/admin/users', verifyAccessToken, userController.getAllUsers);
router.get('/admin/user/:id', verifyAccessToken, userController.getUserById);
router.post('/admin/add/user', verifyAccessToken, userController.adminAddUser);
router.put('/admin/update/user/:id', verifyAccessToken, userController.adminUpdateUser);
router.delete('/admin/delete/user/:id', verifyAccessToken, userController.adminDeleteUser);

// predik
router.post('/save/predict', verifyAccessToken, predik.predik);
router.get('/get/all/predict', verifyAccessToken, prediksiControl.getAllPredict);
router.get('/get/predict/by/user', verifyAccessToken, prediksiControl.getPredictByUser);
router.delete('/delete/history/:id', verifyAccessToken, prediksiControl.deleteHistory);

module.exports = router;
