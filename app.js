const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World! Staging site!')
})

app.listen(process.env.PORT, function () {
  console.log('Example app listening on port 8080!')
})