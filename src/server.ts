import express from 'express';
import cors from 'cors'

const route = require('./routes')
const app = express();


app.use(express.json())
app.use(cors())
app.use(route)


app.listen(3438);