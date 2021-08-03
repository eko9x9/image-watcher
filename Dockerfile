FROM node:buster AS deps
WORKDIR /app

COPY ./simple-app/package.json ./
RUN yarn


# build apps
FROM node:buster AS builder
WORKDIR /app

COPY ./simple-app ./
# copies deps
COPY --from=deps /app/node_modules ./node_modules
RUN yarn build


# run app
FROM node:buster AS runner

# Add Group
RUN addgroup nodejs
# Add User
RUN adduser eko9x9

USER eko9x9
WORKDIR /home/eko9x9/app

COPY --from=builder --chown=eko9x9:nodejs ./app/dist ./dist
COPY --from=builder --chown=eko9x9:nodejs ./app/node_modules ./node_modules
COPY --from=builder --chown=eko9x9:nodejs ./app/package.json ./
COPY --from=builder --chown=eko9x9:nodejs ./app/tsconfig.build.json ./

# Change The owner!. if workdir outside directory $home uncomment bellow
# RUN chown -Rh eko9x9:nodejs ./dist

EXPOSE 3000

CMD [ "yarn", "start" ]
