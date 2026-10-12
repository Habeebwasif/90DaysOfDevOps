# Docker Cheat Sheet

> “Keep this open while you work: every Docker command you’ll reach for on the job, one line each.”

## Container commands

- `docker run -it --name app alpine sh` — Run an interactive container.
- `docker run -d --name web -p 8080:80 nginx` — Run a container in detached mode.
- `docker ps` — List running containers.
- `docker ps -a` — List all containers.
- `docker stop <container>` — Stop a running container.
- `docker rm <container>` — Remove a stopped container.
- `docker exec -it <container> sh` — Open a shell inside a running container.
- `docker logs -f <container>` — Follow container logs.

## Image commands

- `docker build -t <image>:<tag> .` — Build and tag an image from a Dockerfile.
- `docker pull <image>:<tag>` — Download an image from a registry.
- `docker push <username>/<image>:<tag>` — Push an image to a registry.
- `docker tag <image>:<tag> <username>/<image>:<tag>` — Add a registry tag.
- `docker image ls` — List local images.
- `docker image rm <image>` — Remove a local image.

## Volume commands

- `docker volume create <volume>` — Create a named volume.
- `docker volume ls` — List volumes.
- `docker volume inspect <volume>` — Show volume details.
- `docker volume rm <volume>` — Remove a volume.

## Network commands

- `docker network create <network>` — Create a user-defined network.
- `docker network ls` — List networks.
- `docker network inspect <network>` — Show network details.
- `docker network connect <network> <container>` — Connect a container to a network.

## Compose commands

- `docker compose up --pull always -d` — Build or start services in detached mode.
- `docker compose down` — Stop and remove Compose containers and networks.
- `docker compose ps` — List Compose service status.
- `docker compose logs -f` — Follow Compose service logs.
- `docker compose build` — Build Compose service images.

## Cleanup commands

- `docker container prune` — Remove stopped containers.
- `docker image prune` — Remove unused images.
- `docker volume prune` — Remove unused volumes.
- `docker network prune` — Remove unused networks.
- `docker system prune` — Remove unused Docker resources.
- `docker system df` — Show Docker disk usage.

## Dockerfile instructions

- `FROM <image>:<tag>` — Set the base image.
- `RUN <command>` — Execute a command during the image build.
- `COPY <source> <destination>` — Copy local files into the image.
- `WORKDIR /app` — Set the working directory for later instructions.
- `EXPOSE 8080` — Document the container listening port.
- `CMD ["executable", "arg"]` — Set the default runtime command.
- `ENTRYPOINT ["executable"]` — Set the primary runtime executable.
