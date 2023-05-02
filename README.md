### Steps
1. Build the image with the `Dockerfile` by running 
```bash
docker build -t logseq_backup --build-arg MOVE_PATH=$(pwd) .
```
2. Create a container using the image
```
docker run --name logseq-backup-container -d logseq_backup
```
