-- CreateTable
CREATE TABLE "Recipe" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "idUser" TEXT NOT NULL,
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
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
