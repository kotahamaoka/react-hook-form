/*
  Warnings:

  - You are about to drop the column `orderId` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `storeId` on the `Menu` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Menu" DROP CONSTRAINT "Menu_orderId_fkey";

-- DropForeignKey
ALTER TABLE "Menu" DROP CONSTRAINT "Menu_storeId_fkey";

-- AlterTable
ALTER TABLE "Menu" DROP COLUMN "orderId",
DROP COLUMN "storeId";

-- CreateTable
CREATE TABLE "_MenuToOrder" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_MenuToStore" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MenuToOrder_AB_unique" ON "_MenuToOrder"("A", "B");

-- CreateIndex
CREATE INDEX "_MenuToOrder_B_index" ON "_MenuToOrder"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MenuToStore_AB_unique" ON "_MenuToStore"("A", "B");

-- CreateIndex
CREATE INDEX "_MenuToStore_B_index" ON "_MenuToStore"("B");

-- AddForeignKey
ALTER TABLE "_MenuToOrder" ADD CONSTRAINT "_MenuToOrder_A_fkey" FOREIGN KEY ("A") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MenuToOrder" ADD CONSTRAINT "_MenuToOrder_B_fkey" FOREIGN KEY ("B") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MenuToStore" ADD CONSTRAINT "_MenuToStore_A_fkey" FOREIGN KEY ("A") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MenuToStore" ADD CONSTRAINT "_MenuToStore_B_fkey" FOREIGN KEY ("B") REFERENCES "Store"("id") ON DELETE CASCADE ON UPDATE CASCADE;
