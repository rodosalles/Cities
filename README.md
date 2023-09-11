# README
- Ruby version 2.7.0
- Rails version 5.2.6

# Pre-requisites

- Docker-Compose

# Starting the application

```bash
$ docker compose up
```

# Setting up the database

```bash
$ docker ps
$ docker exec -it <CONTAINER_ID> rails db:migrate
$ docker exec -it <CONTAINER_ID> rails db:seed
```

# Creating a Pull-Request

```bash
$ git checkout main
$ git pull origin main —rebase
$ git checkout -b <INITIALS>-main/<BRANCH_TYPE>/feature-name
$ git add .
$ git commit -m "Add commit message"
$ git push origin <INITIALS>-main/<BRANCH_TYPE>/feature-name
```

# Navigating in Api

https://localhost:3000

# Running the tests

```bash
$ docker exec -it <CONTAINER_ID> rspec
```
