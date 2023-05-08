const express = require('express');
const userRouter = express.Router();
const auth = require("../middlewares/auth.js");
const jwt = require("jsonwebtoken");
const { Product } = require('../models/product.js');
const User = require("../models/user.js");
const Order = require('../models/order.js');

//Add the item to cart
userRouter.post("/api/add-to-cart", auth, async (req, res) => {
    try {
     const {id} = req.body;
     const product = await Product.findById(id);
     let user = await User.findById(req.user);

     if(user.cart.length == 0){
        user.cart.push({product, quantity: 1});
     } else{
        let isProductFound = false;
        for(let i=0; i<user.cart.length; i++){
            if(user.cart[i].product._id.equals(id)){
                isProductFound =true;
            }
        }

        if(isProductFound){
            let producttt = user.cart.find((productt) => productt.product._id.equals(product._id),
            );
            producttt.quantity += 1;
        } else{
            user.cart.push({product, quantity : 1});
        }
     }

     user = await user.save();
     res.json(user);
    } catch (e) {
        console.log("error");
      res.status(500).json({ error: e.message });
    }
  });


  //Delete the item to cart
userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
    try {
     const {id} = req.params;
     const product = await Product.findById(id);
     let user = await User.findById(req.user);
        for(let i=0; i<user.cart.length; i++){
            if(user.cart[i].product._id.equals(id)){
                if(user.cart[i].quantity==1 ){
                    user.cart.splice(i,1);
                } else {
                    user.cart[i].quantity -= 1;
                }
            }

     }

     user = await user.save();
     res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  //save user address
  userRouter.post("/api/save-user-address", auth, async(req, res)=>{
    try {
        const {address} = req.body;
        let user = await User.findById(req.user);
        user.address = address;
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  });

  //ordering product
  userRouter.post("/api/order", auth, async(req, res)=>{
    try {
        const {cart, totalPrice, address} = req.body;
        let products= [];
        for(let i=0; i<cart.length; i++){
            let product= await Product.findById(cart[i].product._id);
            if(product.availability==true){
              products.push({product, quantity: cart[i].quantity});

            await product.save();
            } else {
                return res.status(400).json({msg: `${product.name} not available`});
            }
        }

        let user = await User.findById(req.user);
        user.cart = [];
        user = await user.save();


        let order = new Order({
            products,
            totalPrice,
            address,
            userId: req.user,
            orderedAt: new Date().getTime(),
        });
        order = await order.save();

        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  });


  //User Orders
  userRouter.get("/api/orders/me", auth, async (req, res) => {
    try {
      const orders = await Order.find({ userId: req.user });
      res.json(orders);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  //Change Credentials
  userRouter.post("/api/change-crendentials", async(req, res)=>{
    try {
      const {email, fname, lname, address} = req.body;
      const token = req.header("x-auth-token");
      const verified = jwt.verify(token, "passwordKey");
      let user = await User.findById(verified.id);
      // let user = await User.findById(req.user);
      console.log(user);
      user.name = fname+" "+lname;
      console.log(fname);
      user.address=address;
      user=await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });


  //Change Address
  userRouter.post("/api/change-address", async(req, res)=>{
    try {
      const {address} = req.body;
      const token = req.header("x-auth-token");
      const verified = jwt.verify(token, "passwordKey");
      let user = await User.findById(verified.id);
      // let user = await User.findById(req.user);
      user.address=address;
      user=await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });



module.exports = userRouter;