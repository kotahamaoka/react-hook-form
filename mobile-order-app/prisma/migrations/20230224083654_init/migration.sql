/*
  Warnings:

  - You are about to drop the column `orderId` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the `Order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_MenuToOrder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Payment" DROP CONSTRAINT "Payment_orderId_fkey";

-- DropForeignKey
ALTER TABLE "_MenuToOrder" DROP CONSTRAINT "_MenuToOrder_A_fkey";

-- DropForeignKey
ALTER TABLE "_MenuToOrder" DROP CONSTRAINT "_MenuToOrder_B_fkey";

-- AlterTable
ALTER TABLE "Payment" DROP COLUMN "orderId";

-- DropTable
DROP TABLE "Order";

-- DropTable
DROP TABLE "_MenuToOrder";
