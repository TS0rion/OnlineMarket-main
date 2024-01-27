const express = require('express')
const router = express.Router();
// import * as voucherController from '../../controller/voucherController/voucherController.js'
router.get('/',(req,res)=>{
    res.status(200).json({
        msg : 'Thanh cong roi ba con'
    });
});
module.exports = router;