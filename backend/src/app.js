const express = require("express");
const app = express();
require("./db/conn");
const Register = require("./models/usermodel");
const OrderRegister = require("./models/ordermodel");
const inventoryRegister = require("./models/inventoryModel");
const reviewRegister = require("./models/reviewModel");
const bodyParser = require('body-parser');

const port = process.env.PORT || 3000

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/', require('../routes/user.route'));
app.use('/', require('../routes/orderRoute'));
app.use('/', require('../routes/menuRout'));
app.use('/', require('../routes/inventoryRout'));
app.use('/', require('../routes/reviewRout'));

app.listen(port, () => {
    console.log(`server port : ${port}`);
})