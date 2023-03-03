import { PrismaClient } from "@prisma/client";

const app = require("express").Router(); 
const prisma = new PrismaClient();

//CATEGORIES
app.get('/categories', async (req: any, res: any) => {
    const categories = await prisma.category.findMany({
        select: {
            id: true,
            name_category: true,
            suggestion: true,
            recipe: true,
            createdAt: true
        }
    });


    res.status(200).json(categories.map(cat => {
        return {
            ...cat,
            recipe: Object.keys(cat.recipe).length
        }
    }))
});

app.post('/categories', async (req: any, res: any) => {
    const body = req.body
    const category = await prisma.category.create({
        data :{
            name_category: body.name_category,
            suggestion: body.suggestion
        }
    })
    res.status(200).json(category)
});

app.put('/categories/:id', (req: any, res: any) => {
    res.status(200).json([])
});

app.delete('/categories/:id', (req: any, res: any) => {
    res.status(200).json([])
});


module.exports = app