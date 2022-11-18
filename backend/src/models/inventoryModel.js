const mongoose = require("mongoose");
const schema = mongoose.Schema;



const newSchema = new schema({
    item_id: {
        type: String,
        require: true,
        
    },
    item_name: {
        type: String,
        require: true,
    },
    avl_stock: {
        type: String,
        require: true,
    },
    date: {
        type: Date,
        default: Date.now,
    }
})




//collection
const Register = mongoose.model('inventoryData', newSchema);
module.exports = Register;