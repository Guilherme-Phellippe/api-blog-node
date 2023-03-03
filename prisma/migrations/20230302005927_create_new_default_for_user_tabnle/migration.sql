-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "photo" TEXT NOT NULL DEFAULT 'https://scontent.fpoo1-1.fna.fbcdn.net/v/t1.30497-1/143086968_2856368904622192_1959732218791162458_n.png?_nc_cat=1&ccb=1-7&_nc_sid=7206a8&_nc_ohc=ctuv1-iVcTkAX-gl5Xh&_nc_ht=scontent.fpoo1-1.fna&oh=00_AfCdxkIMoKu5XINgR815CDH3GilGYfLQ3sqeqH4OHDPOKw&oe=642764F8',
    "email" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "nmr_hearts" INTEGER NOT NULL DEFAULT 0,
    "nmr_eyes" INTEGER NOT NULL DEFAULT 0,
    "nmr_prizes_won" TEXT NOT NULL DEFAULT '',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_User" ("createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo") SELECT "createdAt", "email", "id", "login", "name", "nmr_eyes", "nmr_hearts", "nmr_prizes_won", "password", "photo" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
