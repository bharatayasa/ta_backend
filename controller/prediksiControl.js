const conn = require('../db');

module.exports = {
    getAllPredict:(req, res) => {
        if (req.user.role !== 'admin') {
            return res.status(403).json({ status: 'error', message: 'Permission denied' });
        }
        conn.query('SELECT * FROM savepredict', (err, results) => {
            if (err) {
                console.error('Error fetching user data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            res.json({
                status: 'success',
                message: 'Savepredict retrieved',
                data: results,
            });
        });
    },

    getPredictByUser: (req, res) => {
        if (req.user.role !== 'user') {
            return res.status(403).json({ status: 'error', message: 'Permission denied' });
        }
    
        const userId = req.user.userId;
    
        conn.query('SELECT * FROM savepredict WHERE userId = ?', [userId], (err, results) => {
            if (err) {
                console.error('Error fetching predict data: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error', error: err });
            }
            res.json({
                status: 'success',
                message: 'Predict retrieved',
                data: results,
            });
        });
    },

    deleteHistory:(req, res) => {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ status: 'error', message: 'Missing user ID' });
        }
        conn.query('DELETE FROM savepredict WHERE id = ?', [id], (err, result) => {
            if (err) {
                console.error('Error deleting user: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            if (result.affectedRows === 0) {
                return res.status(404).json({ status: 'error', message: 'data not found' });
            }
            res.json({
                status: 'success',
                message: 'Predict deleted',
            });
        });
    }
}