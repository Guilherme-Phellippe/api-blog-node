const route = require('express').Router();

const recipes = require("./routes/recipes")
route.use(recipes)
const categories = require("./routes/categories")
route.use(categories)
const users = require("./routes/users")
route.use(users)
const prizes = require("./routes/prizes")
route.use(prizes)

module.exports = route