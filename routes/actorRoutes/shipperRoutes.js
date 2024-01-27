const express = require("express");
const shipperController = require("../../controller/actorController/shipperController");
const router = express.Router();

router.get("/getAllShipper", shipperController.getAllShipper);
router.get("/getShipper/:id", shipperController.getShipperById);
router.post("/create_shipper", shipperController.createShipper);
router.put("/update_shipper/:id", shipperController.updateShipperById);
module.exports = router;
