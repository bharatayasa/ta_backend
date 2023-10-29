const conn = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

module.exports = {
    register:(req, res) => {
        const { username, name, email, password } = req.body;
        const role = 'user';
        // Periksa apakah alamat email sudah ada dalam database
        conn.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
            if (err) {
                console.error('Error checking email duplication: ', err);
                res.status(500).json({ error: 'Internal Server Error' });
                return;
            }
            if (results.length > 0) {
                // Alamat email sudah ada
                res.status(400).json({ status: 'error', message: 'Email is already registered' });
                return;
            }
            // Alamat email belum terdaftar, lanjutkan pendaftaran
            bcrypt.hash(password, 10, (err, hashedPassword) => {
                if (err) {
                    console.error('Error hashing password: ', err);
                    res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                    return;
                }
                const user = {
                    username,
                    name,
                    email,
                    password: hashedPassword,
                    role,
                };
                const query = 'INSERT INTO users (username, name, email, password, role) VALUES (?, ?, ?, ?, ?)';
                conn.query(query, [user.username, user.name, user.email, user.password, user.role], (err, results) => {
                    if (err) {
                        console.error('Error registering user: ', err);
                        res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                        return;
                    }
                    user.id = results.insertId;
                    res.json({ status: 'success', message: 'User Created' });
                });
            });
        });
    },

    login:(req, res) => {
        const { username, password } = req.body;
        conn.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                return;
            }
            if (results.length === 0) {
                res.status(401).json({ status: 'error', message: 'Authentication failed. User not found.' });
                return;
            }
            const user = results[0];
            bcrypt.compare(password, user.password, (bcryptErr, isPasswordValid) => {
                if (bcryptErr) {
                    console.error('Error comparing passwords: ', bcryptErr);
                    res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                    return;
                }
                if (!isPasswordValid) {
                    res.status(401).json({ status: 'error', message: 'Authentication failed. Incorrect password.' });
                    return;
                }
                const payload = {
                    userId: user.id,
                    username: user.username,
                    role: user.role
                };
                const accessToken = jwt.sign(payload, 'your_secret_key', { expiresIn: '1h' });
                res.json({
                    status: 'success',
                    message: 'User logged successfully',
                    role: user.role,
                    data: {
                        accessToken
                    },
                });
            });
        });
    }, 

    getMe:(req, res) => {
        const userId = req.user.userId;
        conn.query('SELECT id, name, email, role FROM users WHERE id = ?', [userId], (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (results.length === 0) {
                return res.status(404).json({ status: 'error', message: 'Resource not found' });
            }
            const user = results[0];
            res.json({
                status: 'success',
                message: 'User retrieved',
                data: {
                    id: `${user.role}-${user.id}`,
                    name: user.name,
                    email: user.email,
                    role: user.role
                },
            });
        });
    }, 

    getAllUsers:(req, res) => {
        if (req.user.role !== 'admin') {
            return res.status(403).json({ status: 'error', message: 'Permission denied' });
        }
        conn.query('SELECT * FROM users', (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            res.json({
                status: 'success',
                message: 'Users retrieved',
                data: results,
            });
        });
    }, 

    getUserById:(req, res) => {
        if (req.user.role !== 'admin') {
            return res.status(403).json({ status: 'error', message: 'Permission denied' });
        }
        const userId = req.params.id; // Ambil ID pengguna dari URL
        conn.query('SELECT * FROM users WHERE id = ?', [userId], (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (results.length === 0) {
                return res.status(404).json({ status: 'error', message: 'User not found' });
            }
            res.json({
                status: 'success',
                message: 'User retrieved',
                data: results[0], // Mengambil data pengguna pertama dari hasil query
            });
        });
    },

    adminAddUser:(req, res) => {
        if (!req.body.username || !req.body.name || !req.body.email || !req.body.password || !req.body.role) {
            return res.status(400).json({ status: 'error', message: 'Missing required fields' });
        }
        const { username, name, email, password, role } = req.body;
        conn.query('SELECT email FROM users WHERE email = ?', [email], (err, results) => {
            if (err) {
                console.error('Error checking email: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (results.length > 0) {
                return res.status(400).json({ status: 'error', message: 'Email already exists' });
            }
            bcrypt.hash(password, 10, (err, hashedPassword) => {
                if (err) {
                    console.error('Error hashing password: ', err);
                    return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                }
                const newUser = {
                    username,
                    name,
                    email,
                    password: hashedPassword,
                    role
                };
                conn.query('INSERT INTO users (username, name, email, password, role) VALUES (?, ?, ?, ?, ?)', [newUser.username, newUser.name, newUser.email, newUser.password, newUser.role], (err, result) => {
                    if (err) {
                        console.error('Error adding user: ', err);
                        return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                    }
                    newUser.id = result.insertId;
                    res.json({
                        status: 'success',
                        message: 'User created',
                        data: {
                            id: newUser.id,
                            username: newUser.username,
                            name: newUser.name,
                            email: newUser.email,
                            role: newUser.role,
                        }
                    });
                });
            });
        });
    },

    adminUpdateUser:(req, res) => {
        const { id } = req.params;
        const { username, name, email, password, role } = req.body;
        // Periksa apakah data lengkap
        if (!id || !username || !name || !email || !password || !role) {
            return res.status(400).json({ status: 'error', message: 'Missing required fields' });
        }
        // Periksa apakah email sudah ada dalam database (kecuali untuk pengguna yang sedang diperbarui)
        conn.query('SELECT email FROM users WHERE email = ? AND id != ?', [email, id], (err, results) => {
            if (err) {
                console.error('Error checking email: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (results.length > 0) {
                return res.status(400).json({ status: 'error', message: 'Email already exists' });
            }
            // Hash kata sandi sebelum menyimpannya
            bcrypt.hash(password, 10, (err, hashedPassword) => {
                if (err) {
                    console.error('Error hashing password: ', err);
                    return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                }
                conn.query(
                    'UPDATE users SET username = ?, name = ?, email = ?, password = ?, role = ? WHERE id = ?',
                    [username, name, email, hashedPassword, role, id],
                    (err, result) => {
                        if (err) {
                            console.error('Error updating user: ', err);
                            return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                        }
                        res.json({
                            status: 'success',
                            message: 'User updated',
                            data: {
                                id,
                                username,
                                name,
                                email,
                                role,
                            }
                        });
                    }
                );
            });
        });
    },

    adminDeleteUser:(req, res) => {
        const { id } = req.params;
        // Periksa apakah ID pengguna ada
        if (!id) {
            return res.status(400).json({ status: 'error', message: 'Missing user ID' });
        }
        // Hapus pengguna berdasarkan ID
        conn.query('DELETE FROM users WHERE id = ?', [id], (err, result) => {
            if (err) {
                console.error('Error deleting user: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (result.affectedRows === 0) {
                return res.status(404).json({ status: 'error', message: 'User not found' });
            }
            res.json({
                status: 'success',
                message: 'User deleted',
            });
        });
    }
}
