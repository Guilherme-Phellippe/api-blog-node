-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Prize" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "image" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Prize" ("available", "createdAt", "id", "image", "name", "price") SELECT "available", "createdAt", "id", "image", "name", "price" FROM "Prize";
DROP TABLE "Prize";
ALTER TABLE "new_Prize" RENAME TO "Prize";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
