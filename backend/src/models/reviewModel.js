const mongoose = require("mongoose");
const schema = mongoose.Schema;



const newSchema = new schema({
    user_id: {
        type: String,
        require: true,
    },
    username: {
        type: String,
        require: true,
    },
    rate: {
        type: String,
        require: true,
    },
    food_name: {
        type: String,
        require: true,
    },
    source: {
        type: String,
        require: true,
    },
    image: {
        type: String,
    },
    review: {
        type: String,
        require: true,
    },
    date: {
        type: Date,
        default: Date.now,
    }
})




//collection
const Register = mongoose.model('review', newSchema);
module.exports = Register;