# Étape 1 : builder l'app React
FROM node:20 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Étape 2 : servir avec Caddy
FROM caddy:2.7.4

# Copier le build React dans Caddy
COPY --from=build /app/build /usr/share/caddy

# Exposer le port 80
EXPOSE 80

