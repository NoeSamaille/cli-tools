# CLI tools

This repository builds a Docker image whose container is a client for interacting with different CLI tools, based on RedHat UBI.

The container includes the following tools:
- `vim` editor
- `podman` cli and container runtime
- `htpasswd` cli
- `openssl` cli
- `curl` cli
- `wget` cli
- `kubectl` cli
- `oc` cli
- `git` cli
- `jq` cli
- `yq` cli
- `helm` cli
- `rclone` cli
- `ncdu` cli
- `grpcurl` cli
- `unzip` cli
- `tar` cli

**Warning**: The material contained in this repository has not been thoroughly tested. Proceed with caution.

## Getting started

### Prerequisites

To run this image, the following tools are required:
- `podman` cli
- `podman` backend - e.g. podman runtime, Podman Desktop

**Note**: It should also work with `docker` cli and runtime although not thoroughly tested:
- `docker` cli
- `docker` backend - Docker Desktop, colima, OrbStack, etc

### Running the client

Start the client to use it.

- To run the `cli-tools` container:

    ```bash
    podman run -itd --name cli-tools -v ./cli-tools-data:/home/podman/data:Z,U quay.io/noesamaille0/cli-tools:latest
    ```

Once the client is running in the background, use it by opening a shell in it.

- To use the `cli-tools` container, exec shell into it:

    ```bash
    podman exec -it cli-tools /bin/bash
    ```

    Your terminal is now in the container. 

Use this shell to run commands using the installed tools and scripts.

When you're finished running commands, to exit the client.

- To leave the `cli-tools` container shell, as with any shell:

    ```bash
    exit
    ```

    The container will keep running after you exit its shell.

If the client stops:

- To run the `cli-tools` container again:

    ```bash
    podman start cli-tools
    ```

The `cli-tools` container is just a standard container, so all [Podman CLI commands](https://docs.podman.io/en/latest/Commands.html) should work.
