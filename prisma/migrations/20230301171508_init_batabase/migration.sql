-- CreateTable
CREATE TABLE "Recipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "categoryId" TEXT,
    "images_recipe" TEXT NOT NULL,
    "videos_recipe" TEXT NOT NULL,
    "name_recipe" TEXT NOT NULL,
    "describe_recipe" TEXT NOT NULL,
    "time" INTEGER NOT NULL,
    "portion" INTEGER NOT NULL,
    "ing" TEXT NOT NULL,
    "word_key" TEXT NOT NULL,
    "prepareMode" TEXT NOT NULL,
    "nmr_hearts" INTEGER NOT NULL,
    "nmr_eyes" INTEGER NOT NULL,
    "nmr_saved" INTEGER NOT NULL,
    "votes" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Recipe_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "recipeId" TEXT,
    "name" TEXT NOT NULL,
    "photo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "nmr_hearts" INTEGER NOT NULL,
    "nmr_eyes" INTEGER NOT NULL,
    "nmr_prizes_won" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "User_recipeId_fkey" FOREIGN KEY ("recipeId") REFERENCES "Recipe" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name_category" TEXT NOT NULL,
    "suggestion" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Prize" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "image" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
