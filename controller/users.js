const conn = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

require('dotenv').config();

const secretKey = process.env.JWT_SECRET;

module.exports = {
    register: (req, res) => {
        const { username, name, email, password } = req.body;
        const role = 'user';
    
        conn.query('SELECT * FROM users WHERE username = ?', [username], (err, usernameResults) => {
            if (err) {
                console.error('Error checking username duplication: ', err);
                res.status(500).json({ error: 'Internal Server Error' });
                return;
            }
            if (usernameResults.length > 0) {
                res.status(400).json({ status: 'error', message: 'Username Sudah Ada' });
                return;
            }
    
            conn.query('SELECT * FROM users WHERE email = ?', [email], (err, emailResults) => {
                if (err) {
                    console.error('Error checking email duplication: ', err);
                    res.status(500).json({ error: 'Internal Server Error' });
                    return;
                }
                if (emailResults.length > 0) {
                    res.status(400).json({ status: 'error', message: 'Email Sudah Ada' });
                    return;
                }
    
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
                const accessToken = jwt.sign(payload, secretKey, { expiresIn: '1h' });
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
        conn.query('SELECT id, name, username, email, role FROM users WHERE id = ?', [userId], (err, results) => {
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
                    id: user.id,
                    username: user.username,
                    name: user.name,
                    email: user.email,
                    role: user.role
                },
            });
        });
    }, 

    updateMe: (req, res) => {
        const userId = req.user.userId;
        const { username, name, email } = req.body;
        if (!username || !name || !email) {
            return res.status(400).json({ status: 'error', message: 'Missing required fields' });
        }
        conn.query('SELECT email FROM users WHERE email = ? AND id != ?', [email, userId], (err, results) => {
            if (err) {
                console.error('Error checking email: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (results.length > 0) {
                return res.status(400).json({ status: 'error', message: 'Email already exists' });
            }
            conn.query(
                'UPDATE users SET username = ?, name = ?, email = ? WHERE id = ?',
                [username, name, email, userId],
                (err, result) => {
                    if (err) {
                        console.error('Error updating user: ', err);
                        return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                    }
                    res.json({
                        status: 'success',
                        message: 'User updated',
                        data: {
                            id: userId,
                            username,
                            name,
                            email,
                        }
                    });
                }
            );
        });
    },

    updateMyPassword: (req, res) => {
        const userId = req.user.userId;
        const { currentPassword, newPassword } = req.body;
    
        if (!currentPassword || !newPassword) {
            return res.status(400).json({ status: 'error', message: 'Current password and new password are required' });
        }
    
        conn.query('SELECT password FROM users WHERE id = ?', [userId], (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
    
            if (results.length === 0) {
                return res.status(404).json({ status: 'error', message: 'User not found' });
            }
    
            const user = results[0];
    
            bcrypt.compare(currentPassword, user.password, (err, passwordMatch) => {
                if (err) {
                    console.error('Error comparing passwords: ', err);
                    return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                }
    
                if (!passwordMatch) {
                    return res.status(401).json({ status: 'error', message: 'Current password is incorrect' });
                }
    
                bcrypt.hash(newPassword, 10, (err, hashedPassword) => {
                    if (err) {
                        console.error('Error hashing new password: ', err);
                        return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                    }
    
                    conn.query('UPDATE users SET password = ? WHERE id = ?', [hashedPassword, userId], (err, updateResults) => {
                        if (err) {
                            console.error('Error updating password: ', err);
                            return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                        }
    
                        if (updateResults.affectedRows === 0) {
                            return res.status(404).json({ status: 'error', message: 'User not found' });
                        }
    
                        res.json({
                            status: 'success',
                            message: 'Password updated successfully',
                        });
                    });
                });
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
                data: results[0], 
            });
        });
    },

    adminAddUser: (req, res) => {
        if (!req.body.username || !req.body.name || !req.body.email || !req.body.password || !req.body.role) {
            return res.status(400).json({ status: 'error', message: 'Missing required fields' });
        }
        const { username, name, email, password, role } = req.body;
    
        conn.query('SELECT email FROM users WHERE email = ?', [email], (err, emailResults) => {
            if (err) {
                console.error('Error checking email: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (emailResults.length > 0) {
                return res.status(400).json({ status: 'error', message: 'E-Mmail sudah ada' });
            }
    
            conn.query('SELECT username FROM users WHERE username = ?', [username], (err, usernameResults) => {
                if (err) {
                    console.error('Error checking username: ', err);
                    return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
                }
                if (usernameResults.length > 0) {
                    return res.status(400).json({ status: 'error', message: 'Username sudah ada' });
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
        });
    },

    adminUpdateUser:(req, res) => {
        const { id } = req.params;
        const { username, name, email, role } = req.body;
        if (!id || !username || !name || !email || !role) {
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
            conn.query(
                'UPDATE users SET username = ?, name = ?, email = ?, role = ? WHERE id = ?',
                [username, name, email, role, id],
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
    },

    adminDeleteUser:(req, res) => {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ status: 'error', message: 'Missing user ID' });
        }
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
