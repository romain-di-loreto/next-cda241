FROM debian:12
RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash \
    && apt-get install nodejs -yq \
    && apt-get clean -y

LABEL org.opencontainers.image.source=https://github.com/romain-di-loreto/next-cda241
COPY . /app/
WORKDIR /app
RUN npm install \
    && npm run build
EXPOSE 3000
CMD npm run start