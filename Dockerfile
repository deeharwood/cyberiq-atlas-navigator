# Build and serve CyberIQ ATLAS Navigator
FROM node:16

WORKDIR /src

# Copy files
COPY nav-app/ /src/nav-app/
COPY layers/*.md /src/layers/
COPY *.md /src/

WORKDIR /src/nav-app

# Give user permissions
RUN chown -R node:node ./

# Install packages
RUN npm install --unsafe-perm --legacy-peer-deps

# Railway uses PORT env var (default 4200)
ENV PORT=4200
EXPOSE 4200

# Start Angular dev server on 0.0.0.0 with Railway PORT
CMD ["sh", "-c", "npx ng serve --host 0.0.0.0 --port ${PORT} --disable-host-check"]

USER node
