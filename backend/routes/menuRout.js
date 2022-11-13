const express = require('express')
const menu = require('../src/models/menumodel')
const routerOrder = express.Router()
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('config')




routerOrder.post('/addmenu', (req, res) => {
    menu.findOne({ food_id: req.body.food_id }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (user == null) {
                const user = menu({
                    food_name: req.body.food_name,
                    food_id: req.body.food_id,
                    food_price: req.body.food_price,
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

            } else {
                return res.status(406).json({
                    message: "food id present",
                })
            }
        }
    })

});





routerOrder.get('/menu', (req, res) => {
    menu.find().then(result => {
        res.status(200).json({
            orderData: result
        });
    }).catch(err => {
        console.log(err);
        res.status.json({
            error: err
        });
    })
})





module.exports = routerOrder
