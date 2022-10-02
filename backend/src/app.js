const express = require("express");
const app = express();
require("./db/conn");
const Register = require("./models/usermodel");
const bodyParser = require('body-parser');

const port = process.env.PORT || 3000

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/', require('../routes/user.route'));

app.listen(port, () => {
    console.log(`server port : ${port}`);
})