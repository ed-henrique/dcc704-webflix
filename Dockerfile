FROM node:lts-alpine

WORKDIR /app

# Install dependencies
COPY ./package.json ./yarn.lock .
RUN apk add --no-cache openssl zlib libgcc musl && \
    yarn install --frozen-lockfile

# Migrate
COPY ./prisma/ ./prisma/
RUN yarn run postinstall && \
    yarn exec prisma migrate deploy

COPY . .

COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
