# Day 37 – Docker Revision & Cheat Sheet
---

## Self-Assessment Checklist
Mark yourself honestly — **can do**, **shaky**, or **haven't done**:

- [x] Run Docker containers in interactive and detached modes
- [x] List, stop, and remove containers and images
- [x] Explain Docker image layers and build cache
- [x] Write a Dockerfile using `FROM`, `RUN`, `COPY`, `WORKDIR`, and `CMD`
- [x] Explain the difference between `CMD` and `ENTRYPOINT`
- [x] Build and tag custom Docker images
- [x] Create and manage Docker volumes
- [x] Use bind mounts for local development
- [x] Create custom Docker networks and connect containers
- [x] Build multi-container applications with Docker Compose
- [x] Configure environment variables using `.env` files
- [x] Write multi-stage Dockerfiles
- [x] Push Docker images to Docker Hub
- [x] Configure health checks and service dependencies

---

## Docker Quick-Fire Questions

### 1. What is the difference between an image and a container?

`Image` - An image is an immutable(read-only) template which is used to create containers.

`Container` - a container is an instance created from an image

---

### 2. What happens to data inside a container when you remove it?

if the container is removed, the `Data` inside the container’s writable layer gets deleted. (unless, a volume attached for data persistence)

---

### 3. How do two containers on the same custom network communicate?

`Containers` communicate through `Docker’s internal DNS` using container or service names.

---

### 4. What does `docker compose down -v` do differently from `docker compose down`?

* `docker compose down` removes containers and networks but keeps volumes.
* whereas, `docker compose down -v` also deletes the volumes (and their data).

### 5. Why are multi-stage builds useful?

They separate the build tools from runtime files, producing smaller and cleaner final images.

---

### 6. What is the difference between `COPY` and `ADD`?

* `COPY` copies local files

* while `ADD` supports url and extract tar archives automaticlly.

---

### 7. What does `-p 8080:80` mean?

It maps `host port 8080` (i.e ur computer) to `container port 80` (port inside the containerr)

---

### 8. How do you check how much disk space Docker is using?

```text
docker system df
```

It helps us view info of image, container, volume, and build-cache usage.

## Build Your Docker Cheat Sheet

I created `docker-cheatsheet.md` organized by category:

[View my-Docker-Cheat-Sheet](docker-cheatsheet.md)

- **Container commands** — run, ps, stop, rm, exec, logs
- **Image commands** — build, pull, push, tag, ls, rm
- **Volume commands** — create, ls, inspect, rm
- **Network commands** — create, ls, inspect, connect
- **Compose commands** — up, down, ps, logs, build
- **Cleanup commands** — prune, system df
- **Dockerfile instructions** — FROM, RUN, COPY, WORKDIR, EXPOSE, CMD, ENTRYPOINT

---

