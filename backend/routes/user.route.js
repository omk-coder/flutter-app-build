const express = require('express')
const User = require('../src/models/usermodel')
const router = express.Router()
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('config')

router.post('/signup', (req, res) => {
    User.findOne({ email: req.body.email }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (user == null) {
                const user = User({
                    email: req.body.email,
                    name: req.body.name,
                    Comp_Name: req.body.Comp_Name,
                    password: req.body.password,
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



router.post('/signin', (req, res) => {
    User.findOne({ email: req.body.email, password: req.body.password }, (err, user) => {
        if (err) return res.status(500).json({ msg: err });
        if (user === null) {
            return res.status(403).json({ message: "Invalid User" });
        }
        if (user.password === req.body.password) {

            return res.status(200).json({
                message: "Login ScussesFully",
            });
        }
        else {
            return res.status(404);
        }
    })
})

module.exports = router
