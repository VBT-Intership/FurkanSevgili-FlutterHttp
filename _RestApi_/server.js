const express = require('express')
const app = express()
const port = 3000
const items=require('./planets.json')
app.use(express.static('Pictures'))
app.get('/', (req, res) => res.send(items))
app.listen(port, () => console.log(`Example app listening on port ${port.toString()}!`))