var express = require('express');
var router = express.Router();

module.exports = function (pool) {

/* GET home page. */

// Get Data Restaurant

router.get('/', function (req, res, next) {
  try {
    let sql = `SELECT * FROM restaurants `;
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

// Added Data Restaurant
router.post('/', function (req, res, next) {
  try {
    let namaRestaurant = req.body.nama_restaurant;
    let almtRestaurant = req.body.almt_restaurant;
    let tlpRestaurant = req.body.nmr_tlpn;
    let sql = `INSERT INTO restaurants (nama_restaurant, almt_restaurant, nmr_tlpn) VALUES ('${namaRestaurant}', '${almtRestaurant}', '+${tlpRestaurant}')`;
    pool.query(sql, (err) => {
      res.json({
        success: true,
        message: "Data has been added successfully",
        data: {
          restaurant: namaRestaurant,
          alamatRestaurant: almtRestaurant,
          teleponRestaurant: tlpRestaurant 
        }
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