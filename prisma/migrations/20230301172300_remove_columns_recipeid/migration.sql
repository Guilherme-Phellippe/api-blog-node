/*
  Warnings:

  - You are about to drop the column `recipeId` on the `User` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
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
INSERT INTO "new_User" ("createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo") SELECT "createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
