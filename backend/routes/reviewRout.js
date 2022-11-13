const express = require('express')
const review = require('../src/models/reviewModel')
const routerReview = express.Router()
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('config')

routerReview.post('/reviewu', (req, res) => {
    review.findOne({ user_id: req.body.user_id }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (user == null) {
                const user = review({
                    user_id: req.body.user_id,
                    username: req.body.username,
                    food_name: req.body.food_name,
                    rate: req.body.rate,
                    source: req.body.source,
                    image: req.body.image,
                    review: req.body.review,
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
                return res.status(409).json({
                    message: "user present",
                })
            }
        }
    })

});







routerReview.get('/rev', (req, res, next) => {
    review.find().then(result => {
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





module.exports = routerReview
