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

return router;
}