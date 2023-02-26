/*
  Warnings:

  - You are about to drop the column `orderNo` on the `Order` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Order_orderNo_key";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "orderNo";
