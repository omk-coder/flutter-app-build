const express = require('express')
const inventory = require('../src/models/inventoryModel')
const routerInventory = express.Router()
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('config')




routerInventory.post('/additem', (req, res) => {
    inventory.findOne({ item_id: req.body.item_id }, (err, user) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (user == null) {
                const user = inventory({
                    item_id: req.body.item_id,
                    item_name: req.body.item_name,
                    avl_stock: req.body.avl_stock,
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
                return res.status(200).json({
                    message: "item id present",
                })
            }
        }
    })

});


routerInventory.get('/inventory', (req, res, next) => {
    inventory.find().then(result => {
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


routerInventory.delete('/inventory/d/:id', async (req, res,) => {
    try {
        const result = await inventory.findOneAndDelete({ $and: [{ id: req.params.id }] });
        if (!req.params.id) {
            return res.status(400).send("not match");
        } else {
            return res.status(200).send(result)
        }
    } catch (e) {
        res.status(500).send(e);

    }
})





module.exports = routerInventory
