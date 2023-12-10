const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');

require('dotenv').config();

const secretKey = process.env.JWT_SECRET;

const userController = require('../controller/users');
const predik = require('../controller/predikInput');
const prediksiControl = require('../controller/prediksiControl');

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
router.get('/verify', userController.verify);
router.get('/user/me', verifyAccessToken, userController.getMe);
router.put('/user/update/me', verifyAccessToken, userController.updateMe);
router.put('/update/my/password', verifyAccessToken, userController.updateMyPassword);
router.get('/admin/users', verifyAccessToken, userController.getAllUsers);
router.get('/admin/user/:id', verifyAccessToken, userController.getUserById);
router.post('/admin/add/user', verifyAccessToken, userController.adminAddUser);
router.put('/admin/update/user/:id', verifyAccessToken, userController.adminUpdateUser);
router.delete('/admin/delete/user/:id', verifyAccessToken, userController.adminDeleteUser);
router.put('/update/status/user/:id', verifyAccessToken, prediksiControl.updateStatusByUser);

// predik
router.post('/save/predict', verifyAccessToken, predik.predik);
router.get('/get/all/predict', verifyAccessToken, prediksiControl.getAllPredict);
router.get('/get/predict/by/user', verifyAccessToken, prediksiControl.getPredictByUser);
router.delete('/delete/history/:id', verifyAccessToken, prediksiControl.deleteHistory);
router.put('/update/status/:id', verifyAccessToken, prediksiControl.updateStatus);

module.exports = router;
