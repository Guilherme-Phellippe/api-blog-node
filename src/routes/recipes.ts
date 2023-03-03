import { PrismaClient } from "@prisma/client";

const app = require("express").Router();
const prisma = new PrismaClient();


app.get('/recipes', async (req: any, res: any) => {
    const recipes = await prisma.recipe.findMany({
        select: {
            id: true,
            images_recipe: true,
            videos_recipe: true,
            name_recipe: true,
            describe_recipe: true,
            time: true,
            portion: true,
            ing: true,
            word_key: true,
            prepareMode: true,
            nmr_hearts: true,
            nmr_eyes: true,
            nmr_saved: true,
            votes: true,
            createdAt: true,
            comments: true,
            user: {
                select: {
                    id: true,
                    name: true,
                    photo: true,
                    nmr_eyes: true,
                    nmr_hearts: true,
                    nmr_prizes_won: true,
                }
            },
            category: {
                select: {
                    id: true,
                    name_category: true,
                },
            }
        },
    });

    res.status(200).json(recipes.map(rec => {
        return {
            ...rec,
            ing: rec.ing.split(','),
            word_key: rec.word_key.split(','),
            votes: rec.votes ? rec.votes.split(',') : [],
            comments: rec.comments ? rec.comments.split(',') : [],
            user:{
                ...rec.user,
                nmr_prizes_won: rec.user.nmr_prizes_won ? rec.user.nmr_prizes_won.split(',') : []
            }
        }
    }))
});

app.get('/recipe/:id', async (req: any, res: any) => {
    const id = req.params.id
    const recipe = await prisma.recipe.findUniqueOrThrow(
        {
            where: { id },
            select: {
                id: true,
                images_recipe: true,
                videos_recipe: true,
                name_recipe: true,
                describe_recipe: true,
                time: true,
                portion: true,
                ing: true,
                word_key: true,
                prepareMode: true,
                nmr_hearts: true,
                nmr_eyes: true,
                nmr_saved: true,
                votes: true,
                createdAt: true,
                comments: true,
                user: {
                    select: {
                        id: true,
                        name: true,
                        photo: true,
                        nmr_eyes: true,
                        nmr_hearts: true,
                        nmr_prizes_won: true,
                        _count: {
                            select: {
                                recipe: true
                            }
                        }
                    }
                },
                category: {
                    select: {
                        id: true,
                        name_category: true
                    }
                }

            }
        }
    )

    res.status(200).json({
        ...recipe,
        ing: recipe.ing.split(','),
        word_key: recipe.word_key.split(','),
        votes: recipe.votes ? recipe.votes.split(',') : [],
        comments: recipe.comments ? recipe.comments.split(',') : [],
        user:{
            ...recipe.user,
            nmr_prizes_won: recipe.user.nmr_prizes_won ? recipe.user.nmr_prizes_won.split(',') : []
        }
    }
    )
});

app.post('/recipe', async (req: any, res: any) => {
    const recipeInfo = req.body

    const recipe = await prisma.recipe.create({
        data: {
            name_recipe: recipeInfo.name_recipe,
            describe_recipe: recipeInfo.describe_recipe,
            images_recipe: recipeInfo.images_recipe,
            videos_recipe: recipeInfo.videos_recipe,
            time: recipeInfo.time,
            portion: recipeInfo.portion,
            ing: recipeInfo.ing.join(','),
            word_key: recipeInfo.word_key.join(','),
            prepareMode: recipeInfo.prepareMode,
            nmr_hearts: recipeInfo.nmr_hearts,
            nmr_eyes: recipeInfo.nmr_eyes,
            nmr_saved: recipeInfo.nmr_saved,
            votes: recipeInfo.votes,
            userId: recipeInfo.userId,
            categoryId: recipeInfo.categoryId
        }
    })

    res.status(201).json(recipe);
});

app.put('/recipes/:id', (req: any, res: any) => {
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

app.delete('/recipes/:id', (req: any, res: any) => {
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

module.exports = app; 