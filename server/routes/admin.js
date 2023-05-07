//External Imports
const express = require('express');

//Internal Imports
const adminRouter = express.Router();
const admin = require('../middlewares/admin.js');
const { Product } = require('../models/product.js');
const Order = require('../models/order.js');

//__________________________Adding a new product_________________________
adminRouter.post("/admin/add-products", admin, async (req, res) => {
    try {
      const { name, description, images, availability, price, category } = req.body;
      let product = new Product({
        name,
        description,
        images,
        availability,
        price,
        category,
      });
      product = await product.save();
      res.json(product);

    } catch (e) {
        console.log(e);
      res.status(500).json({ error: e.message });
    }
  });

//____________________________Get all your products_________________________
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//____________________________Delete the product_______________________________
adminRouter.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//_______________________ADMIN: Get all orders___________________________________
adminRouter.get("/admin/get-orders", admin, async(req, res)=>{
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//______________________Change order status_____________________________________
adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
try {
  const { id, status } = req.body;
  let order = await Order.findById(id);
  order.status = status;
  order = await order.save();
  res.json(order);
} catch (e) {
  res.status(500).json({ error: e.message });
}
});

//
adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].products.length; j++) {
        totalEarnings +=
          orders[i].products[j].quantity * orders[i].products[j].product.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
  let maincourseEarnings = await fetchCategoryWiseProduct('Main Course');
  let biryaniEarnings = await fetchCategoryWiseProduct('Biryani');
  let startersEarnings = await fetchCategoryWiseProduct('Starters');
  let southindianEarnings = await fetchCategoryWiseProduct('South Indian');
  // let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

  let earnings = {
    totalEarnings,
    maincourseEarnings,
    biryaniEarnings,
    startersEarnings,
    southindianEarnings,
  };


  res.json(earnings);
} catch (e) {
  res.status(500).json({ error: e.message });
}
});

async function fetchCategoryWiseProduct(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earnings +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earnings;
}

//Exporting adminRouter
module.exports=adminRouter;