-- AlterTable
CREATE SEQUENCE order_orderno_seq;
ALTER TABLE "Order" ALTER COLUMN "orderNo" SET DEFAULT nextval('order_orderno_seq');
ALTER SEQUENCE order_orderno_seq OWNED BY "Order"."orderNo";
