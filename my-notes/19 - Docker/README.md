### Build a Docker Image 

```bash

# docker build -t <img-name> <Dockerfile-path>
docker build -t softLandingImg .

# docker build -t <img-name:tag> <Dockerfile-path>
docker build -t softLandingImg:v2 .

# for host in docker hub #
# docker build -t <username/img-name:tag> <Dockerfile-path>
docker build -t mmsaeed509/softLandingImg:v2 .

# push to docker hub
docker push mmsaeed509/softLandingImg:v2

```
___

### Entrypoint vs. CMD  vs. Entrypoint & CMD together


In Docker, `ENTRYPOINT` and `CMD` are instructions used to specify the command that should be executed when a container is started. They serve slightly different purposes, and you can use them together in a Dockerfile to define how your container behaves.

1. **ENTRYPOINT**:
   - The `ENTRYPOINT` instruction sets the primary command that is executed when a container is started.
   - It defines the default executable for the container image and can include arguments.
   - If you use `ENTRYPOINT`, it will be the command that Docker runs, and you can override it by providing arguments when starting the container.
   - It is often used for the main application or process that runs inside the container.

   Example:
   ```Dockerfile
   FROM ubuntu
   ENTRYPOINT ["echo", "Hello, World!"]
   ```

   When you run a container from this image, it will always execute the `echo "Hello, World!"` command.

2. **CMD**:
   - The `CMD` instruction provides default arguments for the `ENTRYPOINT` or the command to run when the container starts.
   - It is used to specify the default behavior of the container, which can be overridden at runtime.
   - If a Dockerfile contains both `ENTRYPOINT` and `CMD`, the `CMD` instruction's values are passed as arguments to the `ENTRYPOINT` command.

   Example:
   ```Dockerfile
   FROM ubuntu
   ENTRYPOINT ["echo"]
   CMD ["Hello, World!"]
   ```

   When you run a container from this image, it will execute `echo "Hello, World!"` by default, but you can override the `CMD` value by providing a different command when starting the container.

3. **ENTRYPOINT & CMD Together**:
   - You can use both `ENTRYPOINT` and `CMD` in the same Dockerfile to provide a default command with optional arguments.
   - The `CMD` instruction provides default arguments for the command specified in `ENTRYPOINT`.
   - You can override both the `ENTRYPOINT` and `CMD` values at runtime.

   Example:
   ```Dockerfile
   FROM ubuntu
   ENTRYPOINT ["echo"]
   CMD ["Hello, World!"]
   ```

   When you run a container from this image, it will execute `echo "Hello, World!"` by default. However, you can override both `ENTRYPOINT` and `CMD` by providing a different command and arguments when starting the container.

   ```bash
   docker run my-image echo "Custom message"
   # or 
   docker run my-image Custom message
   ```

   In this example, the custom message will be echoed instead of "Hello, World!"

In summary, `ENTRYPOINT` sets the main command for a container, `CMD` provides default arguments for that command, and using them together allows you to create flexible Docker images with default behaviors that can be easily customized at runtime.