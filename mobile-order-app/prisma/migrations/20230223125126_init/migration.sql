/*
  Warnings:

  - You are about to drop the column `menuId` on the `Topping` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Topping" DROP CONSTRAINT "Topping_menuId_fkey";

-- AlterTable
ALTER TABLE "Topping" DROP COLUMN "menuId";

-- CreateTable
CREATE TABLE "_MenuToTopping" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MenuToTopping_AB_unique" ON "_MenuToTopping"("A", "B");

-- CreateIndex
CREATE INDEX "_MenuToTopping_B_index" ON "_MenuToTopping"("B");

-- AddForeignKey
ALTER TABLE "_MenuToTopping" ADD CONSTRAINT "_MenuToTopping_A_fkey" FOREIGN KEY ("A") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MenuToTopping" ADD CONSTRAINT "_MenuToTopping_B_fkey" FOREIGN KEY ("B") REFERENCES "Topping"("id") ON DELETE CASCADE ON UPDATE CASCADE;
