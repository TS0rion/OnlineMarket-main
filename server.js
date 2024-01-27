const connect = require("./database/connect.js");
const express = require("express");
//add new
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const port = 5000;

// Routes for actor
const customerRoutes = require("./routes/actorRoutes/customerRoutes.js");
const shipperRoutes = require("./routes/actorRoutes/shipperRoutes.js");
// Routes for location
const areaRoutes = require("./routes/locationRoutes/areaRoutes.js");
const buildingRoutes = require("./routes/locationRoutes/buildingRoutes.js");
// Routes for money
const depositRoutes = require("./routes/moneyRoutes/depositRoutes.js");
const transactionRoutes = require("./routes/moneyRoutes/transactionRoutes.js");
const walletRoutes = require("./routes/moneyRoutes/walletRoutes.js");
// Routes for product
const brandRoutes = require("./routes/productRoutes/brandRoutes.js");
const orderActivityRoutes = require("./routes/productRoutes/orderActivityRoutes.js");
const orderDetailRoutes = require("./routes/productRoutes/orderDetailRoutes.js");
const customerOrderRoutes = require("./routes/productRoutes/customerOrderRoutes.js");
const productCateRoutes = require("./routes/productRoutes/productCateRoutes.js");
const productInStoreRoutes = require("./routes/productRoutes/productInStoreRoutes.js");
const productRoutes = require("./routes/productRoutes/productRoutes.js");
const storeRoutes = require("./routes/productRoutes/storeRoutes.js");
// Routes for voucher
const campainVoucherRoutes = require("./routes/voucherRoutes/campainVoucherRoutes.js");
const voucherRoutes = require("./routes/voucherRoutes/voucherRoutes.js");
// Use routes
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
// app.use('/customer',customerRoutes);
// app.use('/shipper',shipperRoutes);
// app.use('/area',areaRoutes);
// app.use('/building',buildingRoutes);
// app.use('/deposit',depositRoutes);
// app.use('/transaction',transactionRoutes);
// app.use('/wallet',walletRoutes);
// app.use('/brand',brandRoutes);
// app.use('/order',customerOrderRoutes);
// app.use('/orderActivity',orderActivityRoutes);
// app.use('/orderDetail',orderDetailRoutes);
// app.use('/category',productCateRoutes);
// app.use('/product_in_store',productInStoreRoutes);
// app.use('/product',productRoutes);
// app.use('/store',storeRoutes);
// app.use('/campain_voucher',campainVoucherRoutes);

app.use("/voucher", voucherRoutes);
//test
app.use("/shipper", shipperRoutes);

// Running app
app.listen(port, async (req, res) => {
  connect();
  console.log(`Running on port : ${port}`);
});
