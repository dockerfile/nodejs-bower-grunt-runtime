#
# Node.js w/ Bower & Grunt runtime Dockerfile
#
# https://github.com/dockerfile/nodejs-bower-grunt-runtime
#

# Pull base image.
FROM dockerfile/nodejs-bower-grunt

# Set instructions on build.
ONBUILD ADD bower.json /app/
ONBUILD ADD Gruntfile.js /app/
ONBUILD ADD package.json /app/
ONBUILD RUN \
  bower install --allow-root && \
  npm install
ONBUILD ADD . /app
ONBUILD RUN grunt build

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["npm", "start"]

# Expose ports.
EXPOSE 8080
