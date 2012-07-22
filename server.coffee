express = require "express"
assets  = require "connect-assets"
roy     = require "roy"

assets.jsCompilers.roy =
  compileSync: (fpath, src) -> (roy.compile src).output
  match: /\.js$"/

app = express.createServer()
  .use((express.static (__dirname + "public")))
  .use(assets())
app.set "view engine" , "jade"
app.set 'view options', layout: false

module.exports = app
