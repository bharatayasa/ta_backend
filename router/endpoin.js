const express = require('express');
const router = express.Router();
const verifyAccessToken = require('../verifyAccessToken');

require('dotenv').config();

const userController = require('../controller/users');
const predik = require('../controller/predikInput');
const prediksiControl = require('../controller/prediksiControl');

router.post('/register', userController.register);
router.post('/login', userController.login);
router.put('/verify', userController.verify);
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
