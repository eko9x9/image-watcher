FROM node:buster

# Add Group
RUN addgroup nodejs
# Add User
RUN adduser eko9x9

USER eko9x9
WORKDIR /home/eko9x9/app

COPY --chown=eko9x9:nodejs ./package.json ./
RUN yarn
COPY --chown=eko9x9:nodejs ./ ./

# Change The owner!. if workdir outside directory $home uncomment bellow
# RUN chown -Rh eko9x9:nodejs ./dist

CMD [ "yarn start" ]
