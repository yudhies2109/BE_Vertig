var express = require('express');
var router = express.Router();

module.exports = function (pool) {

  router.get('/restaurant/:id', function (req, res, next) {
    let id = req.params.id;

    try {
      let sql = `
      SELECT r.nama_restaurant, m.list_menu, sr.price_menu 
      FROM restaurants AS r, menu AS m, specific_restaurant AS sr
      WHERE r.id_restaurant = sr.id_restaurant
      AND m.id_menu = sr.id_menu
      AND r.id_restaurant = ${id}`;

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