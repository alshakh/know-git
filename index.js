var express = require('express')
var expressws = require('express-ws')
var bodyparser = require('body-parser')

var app = express()
var ews = expressws(app); app.use(bodyparser.json())

app.use(express.static(__dirname + "/public"));

// ----------------------------------------------

const Malafat = require("malafat")


ews.app.ws('/malafat', function (ws, req) {
    let cmd = new Malafat()
    ws.on('message', (message) => {
        cmd.write(message)
    })

    cmd.on("response", (response) => {
        ws.send(response)
    })
});

// ----------------------------------------------
const WebbyTerm = require("webbyterm")

let terminals = {}

app.post('/terminal/:id/start', (req, res) => {
    const id = req.params.id
    console.log("start Connections", id, req.body )

    if (terminals[id]) {
        terminals[id].restart(req.body)
    } else {
        terminals[id] = new WebbyTerm(req.body)
    }

    res.end("OK")
})


app.post('/terminal/:id/resize', (req, res) => {
    const id = req.params.id

    if (terminals[id]) {
        terminals[id].resize(req.body)
    }
    res.end("OK")
})

ews.app.ws('/terminal/:id', function(ws, req) {
    let id = req.params.id

    if (!terminals[id]) {
        console.error(`Connection refused on id ${id}`)
        ws.close()
    }

    terminals[id].connect(ws)
});

app.listen(3000, "0.0.0.0");
console.log("listening to localhost:3000")
