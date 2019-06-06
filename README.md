# kubevirt-containerized-cloud-image-builder

KubeCCI Builder creates containerized VM images and pushes them to quay.

## Execution

TravisCI sets up a proper Ubuntu 16.04 env with podman and buildah, then runs all three phases in order. That's it.

## Design

Three phases:

### 1. Fetch (`fetch.sh`)

* Read `targets.cfg`,
* fetch all the remote images listed there (TODO: TravisCI cache might be involved here),
* verify their sha256 sums,
* (TODO) convert them to the desired image format.

### 2. Build (`build.sh`)

For each image in `targets.cfg` run `buildah bud … cci` to create a corresponding container image.

### 3. Push (`push.sh`)

Using `podman` push everything to container registry, currently quay.io.

## TODO

* Make the build phase idempotent, so rebuilding target X always creates the exact same image.
* Create our own base image layer, preferably lighter. (Figure out kubevirt's boot disk container image format, while I'm at it.)
* Make pushing more error–tolerant (I've seen quay get back to me with a random 500).

