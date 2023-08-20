# _____ I M A G E _______
# The official Node.js image is selected as the base image.
# All the other statements apply on top of node:16.
FROM node:16

# _____ W O R K D I R _____
# The working directory is changed to /app. Subsequent statements which
# use relative paths, such as the COPY instructions immediately afterwards,
# will be resolved to /app inside the container. The working directory is
# changed to /app. Subsequent statements which use relative paths, such as the
# COPY instructions immediately afterwards, will be resolved to /app inside
# the container.
WORKDIR /app

# _____ C O P Y _____
# he next two lines copy in your package.json and package-lock.json files from
# your host’s working directory. The destination path is ., meaning they’re
# deposited into the in-container working directory with their original names.
COPY package.json .
COPY package-lock.json .

# _____ I N S T A L L _____
# The next line runs npm install to install your application’s dependencies
# from the package.json file. The --production flag tells npm to not install
# modules listed in devDependencies. This is important because devDependencies
# are typically used to list modules used for local development and testing.
# They’re not needed in the production image and would only waste precious
# space.
RUN npm install

# _____ C O P Y _____
# The next line copies the rest of your application’s source code from your
# host to your image filesystem. The destination path is again ., which means
# the files are copied into the in-container working directory.
# It happens after the RUN instruction because your code will usually change
# more frequently than your dependencies. This order of operations
# allows more optimal usage of Docker’s build cache.
COPY main.js .

# _____ E X P O S E _____
# The next line exposes port 8080 to the host. This is the port that your
# application will listen on when running in the container.
#EXPOSE 8080

# _____ E N T R Y P O I N T _____
# The next line sets the default command for the container to node main.js.
# This tells Docker to run node main.js whenever the container is launched
# without a command.
# The image’s entrypoint is set so the node binary is launched automatically
# when you create new containers with your image.
ENTRYPOINT ["node"]

# _____ C O M M A N D _____
# The final line sets the default command for the container to node main.js.
# This tells Docker to run node main.js whenever the container is launched
# without a command.
# The image’s entrypoint is set so the node binary is launched automatically
# when you create new containers with your image.
# This instruction supplies arguments for the image’s entrypoint.
# In this example, it results in Node.js running your application’s code.
CMD ["main.js"]
