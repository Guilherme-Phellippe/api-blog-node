import express from 'express';

const app = express();


// RECIPES
app.get('/recipes', (req: any, res: any) =>{
    res.status(200).json([])
});

app.get('/recipes/:id', (req: any, res: any) =>{
    res.status(200).json(
        [
            {
                id: 0,
                name_recipe: 'Receita de bolo de fubá ',
            },
            {
                id: 0,
                name_recipe: 'Receita de bolo de cenoura',
            },

        ]
    )
});

app.post('/recipe', (req: any, res: any) =>{
    res.status(200).json(
        [
            {
                id: 0,
                name_recipe: 'Receita de bolo de fubá ',
            },
            {
                id: 0,
                name_recipe: 'Receita de bolo de cenoura',
            },

        ]
    )
});

app.put('/recipes/:id', (req: any, res: any) =>{
    res.status(200).json(
        [
            {
                id: 0,
                name_recipe: 'Receita de bolo de fubá ',
            },
            {
                id: 0,
                name_recipe: 'Receita de bolo de cenoura',
            },

        ]
    )
});

app.delete('/recipes/:id', (req: any, res: any) =>{
    res.status(200).json(
        [
            {
                id: 0,
                name_recipe: 'Receita de bolo de fubá ',
            },
            {
                id: 0,
                name_recipe: 'Receita de bolo de cenoura',
            },

        ]
    )
});


//CATEGORIES
app.get('/categories', (req: any, res: any) =>{
    res.status(200).json([])
});

app.post('/categories', (req: any, res: any) =>{
    res.status(200).json([])
});

app.put('/categories/:id', (req: any, res: any) =>{
    res.status(200).json([])
});

app.delete('/categories/:id', (req: any, res: any) =>{
    res.status(200).json([])
});


//USERS
app.get('/users', (req: any, res: any) =>{
    res.status(200).json([])
});
app.get('/users/:id', (req: any, res: any) =>{
    res.status(200).json([])
});

app.post('/users', (req: any, res: any) =>{
    res.status(200).json([])
});

app.put('/users/:id', (req: any, res: any) =>{
    res.status(200).json([])
});

app.delete('/users/:id', (req: any, res: any) =>{
    res.status(200).json([])
});


//PRIZES
app.get('/prizes', (req: any, res: any) =>{
    res.status(200).json([])
});

app.post('/prizes', (req: any, res: any) =>{
    res.status(200).json([])
});

app.put('/prizes/:id', (req: any, res: any) =>{
    res.status(200).json([])
});

app.delete('/prizes/:id', (req: any, res: any) =>{
    res.status(200).json([])
});


app.listen(3438);