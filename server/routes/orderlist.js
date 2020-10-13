var express = require('express');
var router = express.Router();

module.exports = function (pool) {

    // Get List Menu Restaurant
    router.get('/orderlist', function (req, res, next) {

        try {
            let nameBuyer = req.body.buyer_name;
            let sql = `
            SELECT r.nama_restaurant, m.list_menu, sr.price_menu, o.req_order, o.qty_order, (sr.price_menu*o.qty_order) as total_order 
            FROM restaurants AS r, menu AS m, specific_restaurant AS sr, orders As o
            WHERE r.id_restaurant = sr.id_restaurant
            AND m.id_menu = sr.id_menu
            AND sr.id_spec_restaurant = o.id_spec_restaurant
            AND o.buyer_name = '${nameBuyer}'`;

            pool.query(sql, (err, data) => {
                let dataResponse = null;
                if(data.rows.length > 0) {
                    dataResponse = {
                        nama_restaurant: data.rows[0].nama_restaurant,
                                list_menu: [],
                                price_allmenu: [],
                                qty_allorder: [],
                                // .reduce() to get sum in array
                        total_allorder: data.rows.reduce((a, b) => a + (b['total_order'] || 0), 0)
                    }
                    data.rows.forEach(e => {
                        dataResponse.list_menu.push(e.list_menu);
                        dataResponse.price_allmenu.push(e.price_menu);
                        dataResponse.qty_allorder.push(e.qty_order);
                    });
                }
                res.json({
                    success: true,
                    message: "Data has been load successfully",
                    data: dataResponse
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