/*
  Warnings:

  - You are about to drop the column `closeAt` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `openAt` on the `Store` table. All the data in the column will be lost.
  - Added the required column `isOpen` to the `Store` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Store" DROP COLUMN "closeAt",
DROP COLUMN "openAt",
ADD COLUMN     "isOpen" BOOLEAN NOT NULL;
