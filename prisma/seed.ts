import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
  await prisma.icon.createMany({
    data: [
      {
        title: 'Gray',
        href: '/images/classic-profile-icon-gray.webp',
      },
      {
        title: 'Red',
        href: '/images/classic-profile-icon-red.webp',
      },
    ],
  })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
