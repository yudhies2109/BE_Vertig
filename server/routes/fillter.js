var express = require('express');
var router = express.Router();


module.exports = function (pool) {
    // Update Data Restaurant
    router.get('/:tags', function (req, res, next) {
        let tags = req.params.tags;

        try {
            // let nameTags = req.body.tag_name;
            let sql = `SELECT r.nama_restaurant
        FROM restaurants AS r, tags AS t
        WHERE r.id_restaurant = t.id_restaurant
        AND t.tag_name = '${tags}'`;

            pool.query(sql, (err, data) => {
                res.json({
                    success: true,
                    message: "Data has been load successfully",
                    data: data.rows
                });
            })
        } catch (err) {
            res.json({
                error: true,
                message: `something went wrong : ${err.message}`
            })
        }
    });

    return router;
}