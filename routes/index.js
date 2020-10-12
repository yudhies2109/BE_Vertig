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

// Update Data Restaurant
router.put('/:id', function (req, res, next) {
  let id = req.params.id;

  try {
    let namaRestaurant = req.body.nama_restaurant;
    let almtRestaurant = req.body.almt_restaurant;
    let tlpRestaurant = req.body.nmr_tlpn;
    let sql = `UPDATE restaurants SET nama_restaurant = '${namaRestaurant}', almt_restaurant = '${almtRestaurant}', nmr_tlpn = '${tlpRestaurant}' WHERE id_restaurant = ${id}`;
    pool.query(sql, (err, data) => {
      res.json({
        success: true,
        message: "Data has been updated",
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

// Delete Restaurant
router.delete('/:id', function (req, res, next) {
  let id = req.params.id;

  try {
    let sql = `DELETE FROM restaurants WHERE id_restaurant = ${id}`;
    pool.query(sql, (err, data) => {
      res.json({
        success: true,
        message: "Data has been deleted"
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