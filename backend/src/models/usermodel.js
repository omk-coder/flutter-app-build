const mongoose = require("mongoose");
const schema = mongoose.Schema;
const bcrypt = require("bcryptjs");


const newSchema = new schema({
    name: {
        type: String,
        require: true,

    },
    email: {
        type: String,
        require: true,
        unique: true,
    },
    password: {
        type: String,
        require: true,

    },
    Comp_Name: {
        type: String,
        require: true,
    },
    date: {
        type: Date,
        default: Date.now,
    }
})



//collection
const Register = mongoose.model('Resturant_Detail', newSchema);
module.exports = Register;