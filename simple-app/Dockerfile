FROM node:buster

# Add Group
RUN addgroup -g 1001 -S nodejs
# Add User
RUN adduser -S eko9x9 -u 1001

USER eko9x9
WORKDIR /home/app/eko9x9

COPY --chown=eko9x9:nodejs ./package.json ./
RUN yarn
COPY --chown=eko9x9:nodejs ./ ./

# Change The owner!. if workdir outside directory $home uncomment bellow
# RUN chown -Rh eko9x9:nodejs ./dist

CMD [ "yarn start" ]
