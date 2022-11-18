const mongoose = require("mongoose");
const schema = mongoose.Schema;



const newSchema = new schema({
    food_id: {
        type: String,
        require: true,
    },
    food_name: {
        type: String,
        require: true,
    },
    food_price: {
        type: String,
        require: true,
    },
    image: {
        type: String,
    },
    date: {
        type: Date,
        default: Date.now,
    }
})




//collection
const Register = mongoose.model('Menu_Stores_', newSchema);
module.exports = Register;