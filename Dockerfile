FROM node:lts-alpine

WORKDIR /app

# Install dependencies
COPY ./yarn.lock .
COPY ./package.json .
RUN apk add --no-cache openssl zlib libgcc musl && \
    yarn install

# Migrate
COPY ./prisma/ .
RUN yarn run postinstall

COPY . .

ENTRYPOINT ["yarn"]
CMD ["run", "dev"]
