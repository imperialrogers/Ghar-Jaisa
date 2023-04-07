//Package Imports
const express = require("express");
const bcryptjs = require("bcryptjs");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");

//Other Files Imports
const User = require("../models/user");
const auth = require("../middlewares/auth");



//initializing and adding router functionality
const authRouter = express.Router();


//__________________________________SIGNUP USER_________________________________
authRouter.post('/api/signup', async (req, res)=>{
    try {

        //****************get data from user in req.body*****************
    const {name, email, password,}=req.body;

    //VALIDATION:Checking for existing user
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg: "User with the same email address already exists"});
    }

    //Hashing the password

    const hashedPassword = await bcryptjs.hash(password, 8);

    //Creating a new user
    let user = new User({
        email, 
        password: hashedPassword, 
        name
    });

    //****************post data in the database**********************
    user= await user.save();
    //********************return the data to user********************
    res.json(user);

    } catch (e) {
        res.status(500).json({error:e.message});
    }

    



});

//__________________________________SIGNIN USER_________________________________

authRouter.post('/api/signin', async (req, res)=>{
    try {
    //****************get data from user in req.body*****************
    const {email, password}=req.body;
    
    //VALIDATION:Checking if the user exists
    const user = await User.findOne({email});
    if (!user) {
        return res
          .status(400)
          .json({ msg: "User with this email does not exist!" });
      }

      //VALIDATION: Checking for the password matching
      const isMatch = await bcryptjs.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect password." });
      }

      //***************Storing the user token*****************
      const token = jwt.sign({id: user._id,}, "passwordKey");
      res.json({token, ...user._doc});
  

    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

//__________________________________TOKEN VALIDATION____________________________________

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        //VALIDATION: token is ull
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");

      //VALIDATION: token is incorrect
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);

      //VALIDATION: if user is valid or not
      if (!user) return res.json(false);
      
      //Success case
      res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//__________________________________GETTING USER DATA____________________________________

authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });


//export the authRouter functionality
module.exports = authRouter;