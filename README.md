### Steps
1. Build the image with the `Dockerfile` by running 
```
docker build -t logseq_backup --build-arg MOVE_PATH=$(pwd) .
```
2. Create a container using the image
```
docker run --name logseq-backup-container -d logseq_backup
```


### Notes
- If you want to use bind mount, try below:
```
docker run --name logseq-backup-container -d -v $(pwd):/usr/src/app logseq_backup
```
