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
        if (req.user.role !== 'petani') {
            return res.status(403).json({ status: 'error', message: 'Permission denied' });
        }
    
        const userId = req.user.userId;
    
        conn.query('SELECT * FROM savepredict WHERE userId = ? AND status = ?',
            [userId, 'aktif'], (err, results) => {
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
    },

    updateStatus: (req, res) => {
        const { id } = req.params;
        const { status } = req.body;
    
        if (!id || !status) {
            return res.status(400).json({ status: 'error', message: 'Missing ID or status' });
        }
    
        if (status !== 'aktif' && status !== 'nonaktif') {
            return res.status(400).json({ status: 'error', message: 'Invalid status value' });
        }
    
        conn.query('UPDATE savepredict SET status = ? WHERE id = ?', [status, id], (err, result) => {
            if (err) {
                console.error('Error updating status: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
    
            if (result.affectedRows === 0) {
                return res.status(404).json({ status: 'error', message: 'Data not found' });
            }
    
            res.json({
                status: 'success',
                message: 'Status updated',
            });
        });
    }, 

    updateStatusByUser:(req, res) => {
        const { id } = req.params;
        if (!id) {
            return res.status(400).json({ status: 'error', message: 'Missing user ID' });
        }
    
        const updateStatusQuery = 'UPDATE savepredict SET status = ? WHERE id = ?';
        const newStatus = 'nonaktif';
    
        conn.query(updateStatusQuery, [newStatus, id], (err, result) => {
            if (err) {
                console.error('Error updating status: ', err);
                return res.status(500).json({ status: 'error', message: 'Internal Server Error' });
            }
            
            if (result.affectedRows === 0) {
                return res.status(404).json({ status: 'error', message: 'Data not found' });
            }
    
            res.json({
                status: 'success',
                message: 'Status updated to nonaktif',
            });
        });
    }

}
