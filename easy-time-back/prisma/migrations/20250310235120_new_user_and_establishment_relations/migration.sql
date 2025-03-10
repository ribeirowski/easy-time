/*
  Warnings:

  - The values [client] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `establishmentId` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `_EmployeeEstablishment` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('owner', 'employee');
ALTER TABLE "users" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "users" ALTER COLUMN "role" TYPE "Role_new" USING ("role"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
ALTER TABLE "users" ALTER COLUMN "role" SET DEFAULT 'employee';
COMMIT;

-- DropForeignKey
ALTER TABLE "_EmployeeEstablishment" DROP CONSTRAINT "_EmployeeEstablishment_A_fkey";

-- DropForeignKey
ALTER TABLE "_EmployeeEstablishment" DROP CONSTRAINT "_EmployeeEstablishment_B_fkey";

-- DropIndex
DROP INDEX "establishments_ownerId_key";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "establishmentId",
ALTER COLUMN "role" SET DEFAULT 'employee';

-- DropTable
DROP TABLE "_EmployeeEstablishment";

-- CreateTable
CREATE TABLE "establishment_employees" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "establishmentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "establishment_employees_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "establishment_employees" ADD CONSTRAINT "establishment_employees_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "establishment_employees" ADD CONSTRAINT "establishment_employees_establishmentId_fkey" FOREIGN KEY ("establishmentId") REFERENCES "establishments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
