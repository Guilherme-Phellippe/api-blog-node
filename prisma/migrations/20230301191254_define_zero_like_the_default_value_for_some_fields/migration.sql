-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Recipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "categoryId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name_recipe" TEXT NOT NULL,
    "describe_recipe" TEXT NOT NULL,
    "images_recipe" TEXT NOT NULL,
    "videos_recipe" TEXT NOT NULL,
    "time" INTEGER NOT NULL,
    "portion" INTEGER NOT NULL,
    "ing" TEXT NOT NULL,
    "word_key" TEXT NOT NULL,
    "prepareMode" TEXT NOT NULL,
    "nmr_hearts" INTEGER NOT NULL DEFAULT 0,
    "nmr_eyes" INTEGER NOT NULL DEFAULT 0,
    "nmr_saved" INTEGER NOT NULL DEFAULT 0,
    "votes" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Recipe_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Recipe_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Recipe" ("categoryId", "createdAt", "describe_recipe", "id", "images_recipe", "ing", "name_recipe", "nmr_eyes", "nmr_hearts", "nmr_saved", "portion", "prepareMode", "time", "userId", "videos_recipe", "votes", "word_key") SELECT "categoryId", "createdAt", "describe_recipe", "id", "images_recipe", "ing", "name_recipe", "nmr_eyes", "nmr_hearts", "nmr_saved", "portion", "prepareMode", "time", "userId", "videos_recipe", "votes", "word_key" FROM "Recipe";
DROP TABLE "Recipe";
ALTER TABLE "new_Recipe" RENAME TO "Recipe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
