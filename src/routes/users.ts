import { PrismaClient } from "@prisma/client";

const app = require("express").Router();
const prisma = new PrismaClient();

//USERS
app.get('/users', async (req: any, res: any) => {
    const users = await prisma.user.findMany()
    res.status(200).json(users)
});

app.get('/user/:id', async (req: any, res: any) => {
    const id = req.params.id
    const user = await prisma.user.findUniqueOrThrow({
        where: { id },
    })
    res.status(200).json(user)
});

app.post('/users', async (req: any, res: any) => {
    const body = req.body
    const user = await prisma.user.create({
        data: {
            name: body.name,
            photo: body.photo,
            email: body.email,
            login: body.login,
            password: body.password,
            nmr_hearts: body.nmr_hearts,
            nmr_eyes: body.nmr_eyes,
            nmr_prizes_won: body.nmr_prizes_won,
        }
    })
    res.status(200).json(user)
});

app.put('/users/:id', (req: any, res: any) => {
    res.status(200).json([])
});

app.delete('/users/:id', (req: any, res: any) => {
    res.status(200).json([])
});


module.exports = app