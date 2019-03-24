var express = require('express')
var expressws = require('express-ws')
var bodyparser = require('body-parser')

var app = express()
var ews = expressws(app); app.use(bodyparser.json())

app.use(express.static(__dirname + "/public"));

// ----------------------------------------------

const Webbyterm = require("webbyterm")



app.listen(3000, "localhost");
console.log("listening to localhost:3000")
