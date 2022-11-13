const express = require('express')
const Order = require('../src/models/ordermodel')
const routerOrder = express.Router()
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('config')
const router = require('./user.route')
const { countDocuments } = require('../src/models/usermodel')




routerOrder.post('/', (req, res) => {
    Order.findOne({ order_id: req.body.order_id }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (user == null) {
                const user = Order({
                    order_id: req.body.order_id,
                    customer_name: req.body.customer_name,
                    food: req.body.food,
                    status: req.body.status,
                    price: req.body.price,
                    source: req.body.source,
                    Date: Date,

                })
                user.save()
                    .then((err) => {
                        if (err) {
                            console.log(err)
                            res.json(err)
                        } else {
                            console.log(user)
                            res.json(user)
                        }

                    })
                return res.status(200);
            } else {
                return res.status(409).json({
                    message: "user present",
                })
            }
        }
    })

});


routerOrder.get('/order', (req, res, next) => {
    Order.find().sort({ order_id: -1 }).then(result => {
        res.status(200).json({
            orderData: result
        });
    }).catch(err => {
        console.log(err);
        res.status.json({
            error: err
        });
    })
});

routerOrder.get('/forder', async (req, res) => {
    try {
        const result = await Order.find({ $and: [{ status: "Delivered" }] });
        console.log(result);
        res.status(200).json({
            count: result
        })
    } catch (e) {
        console.log(e);
    }
});
routerOrder.get('/fporder', async (req, res) => {
    try {
        const result = await Order.find({ $and: [{ status: "Pending" }] });
        console.log(result);
        res.status(200).json({
            count: result
        })
    } catch (e) {
        console.log(e);
    }
});


routerOrder.get('/fcalrder', async (req, res) => {
    try {
        const result = await Order.aggregate([{ $group: { _id: null, price: { $sum: "$price" } } }]);
        console.log(result);
        res.status(200).json({
            orderData: result
        })
    } catch (e) {
        console.log(e);
    }
});


routerOrder.get('/order/swiggy', async (req, res) => {
    try {
        const result = await Order.find({ $and: [{ source: "swiggy" }] });
        console.log(result);
        res.status(200).json({
            orderData: result
        })
    } catch (e) {
        console.log(e);
    }
});
routerOrder.get('/order/zomato', async (req, res) => {
    try {
        const result = await Order.find({ $and: [{ source: "zomato" }] });
        console.log(result);
        res.status(200).json({
            orderData: result
        })
    } catch (e) {
        console.log(e);
    }
});







module.exports = routerOrder
