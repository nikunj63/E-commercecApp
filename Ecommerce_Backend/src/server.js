const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const cors = require('cors');
const morgan = require('morgan');
const mongoose = require('mongoose');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));
app.use(helmet());
app.use(morgan('dev'));
app.use(cors());

mongoose.connect("mongodb+srv://Nikunj:1234@cluster0.yxv4y.mongodb.net/ecommerce?retryWrites=true&w=majority&appName=Cluster0");

const UserRoutes = require('./routes/user_routes');
app.use("/api/user", UserRoutes);


const CategoryRoutes = require('./routes/category_routes');
app.use("/api/category", CategoryRoutes);

const ProductRoutes = require('./routes/products_routes');
app.use("/api/product", ProductRoutes);

const CartRoutes = require('./routes/cart_routes');
app.use("/api/cart", CartRoutes);

const OrderRoutes = require('./routes/order_routes');
app.use("/api/order", OrderRoutes);


const PORT = 5001;
app.listen(PORT, () => console.log('Server started at PORT : 5001'));