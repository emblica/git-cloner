# git-cloner
Docker container for shallow cloning private repository

Use it as Docker container or deploy into Kubernetes as initContainer

## Usage
```
docker run -it --rm -e REPOSITORY_URL=git@github.com:emblica/git-cloner.git -e SSH_PRIVATE_KEY="$(cat ~/.ssh/deploy-key)" -v $(pwd)/git:/mnt/git emblica/git-cloner
```

## Usage with Kubernetes

```
# Create secret from private key:
kubectl create secret generic git-repo --from-file=deploy-key

# Apply pod:
kubectl apply -f k8s/example.yml
```

## Build
```
docker build -t git-cloner .
```
