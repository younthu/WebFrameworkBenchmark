var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  setTimeout(()=>{
      res.send('respond with a resource');
   },
   700)
});

module.exports = router;
