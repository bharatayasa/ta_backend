const express = require('express');
const router = express.Router();
const news = require('../controller/news');
const bodyParser = require('body-parser');
const userController = require('../controller/users');
const jwt = require('jsonwebtoken');

const secretKey = 'your_secret_key';

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

const app = express();

app.use(express.json());
app.use(bodyParser.json());

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/users/me', verifyAccessToken, userController.getMe); 
router.get('/admin/users', verifyAccessToken, userController.getAllUsers); 
router.get('/admin/user/:id', verifyAccessToken, userController.getUserById);
router.post('/admin/adduser', verifyAccessToken, userController.adminAddUser);
router.put('/admin/updateuser/:id', verifyAccessToken, userController.adminUpdateUser);
router.delete('/admin/deleteuser/:id', verifyAccessToken, userController.adminDeleteUser); 

// news
router.get('/newsLokal', news.newsLokal);
router.get('/newsInter', news.newsinter);

module.exports = router;
