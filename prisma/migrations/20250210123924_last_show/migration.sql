/*
  Warnings:

  - A unique constraint covering the columns `[lastWatchedShowId]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `Profile` ADD COLUMN `lastWatchedShowId` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Profile_lastWatchedShowId_key` ON `Profile`(`lastWatchedShowId`);
