const mongoose = require("mongoose");
const schema = mongoose.Schema;



const newSchema = new schema({
    order_id: {
        type: String,
        require: true,
        unique: true,

    },
    customer_name: {
        type: String,
        require: true,
    },
    food: {
        type: String,
        require: true,

    },
    status: {
        type: String,
        require: true,
    },
    date: {
        type: Date,
        default: Date.now,

    },
    price: {
        type: Number,
        required: true,
    },
    source: {
        type: String,
        required: true,
    }


})




//collection
const Register = mongoose.model('Order_Stores_', newSchema);
module.exports = Register;