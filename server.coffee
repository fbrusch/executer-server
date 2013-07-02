express = require "express"
exec = require("exec.js").execC
app = express()

app.use(express.bodyParser())
app.use(express.logger())
app.use(express.static(__dirname))

port = process.env.PORT || 3000

app.post "/exec", (req, res) ->
    exec req.body.code, (objRet) ->
        res.send (objRet)

app.listen(port)
