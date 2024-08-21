# Docker (Compose), Spring Boot, React and database (MySQL or H2) example

## The Example
This is a fork of the simple `CD Library` application that was communally developed as a technology demo during a 2024 Neueda corporate traning.  The backend is implemented using Spring Boot with Spring Web MVC and Spring Data JPA.

## Two versions

The `main` branch can run standalone or as a single Docker container with the `h2` embedded database.  The `compose` branch runs as two containers, one running the backend Spring Boot application, the other running MySQL.

## The Multistage Build
There are three stages to the Docker build.  Stage 1 builds the React artifact as a static SPA.  Stage 2 builds the Spring Boot application, incorporating the static UI.  Stage 3 is the "production" image.

## Run the Docker version
To bring up this app, run the `bring_up` script, which will build the front-end, copy the static files to the Spring application, and go on from there.
```bash
docker build . -t cdapp && docker run --rm -p 8100:8080 cdapp
```

