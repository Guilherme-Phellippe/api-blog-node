/*
  Warnings:

  - Made the column `recipeId` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `userId` to the `Recipe` table without a default value. This is not possible if the table is not empty.
  - Made the column `categoryId` on table `Recipe` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "recipeId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "photo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "nmr_hearts" INTEGER NOT NULL,
    "nmr_eyes" INTEGER NOT NULL,
    "nmr_prizes_won" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_User" ("createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo", "recipeId") SELECT "createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo", "recipeId" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE TABLE "new_Recipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "categoryId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
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
    CONSTRAINT "Recipe_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Recipe_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Recipe" ("categoryId", "createdAt", "describe_recipe", "id", "images_recipe", "ing", "name_recipe", "nmr_eyes", "nmr_hearts", "nmr_saved", "portion", "prepareMode", "time", "videos_recipe", "votes", "word_key") SELECT "categoryId", "createdAt", "describe_recipe", "id", "images_recipe", "ing", "name_recipe", "nmr_eyes", "nmr_hearts", "nmr_saved", "portion", "prepareMode", "time", "videos_recipe", "votes", "word_key" FROM "Recipe";
DROP TABLE "Recipe";
ALTER TABLE "new_Recipe" RENAME TO "Recipe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
