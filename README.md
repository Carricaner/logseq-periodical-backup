# Logseq Backup Project
## Description
I am a Logseq heavy user because I love the freedom to set up my everything about it.Since I decide to persist them into my GitHub, I came up with an idea of an application which can help me periodically push the whole content into the remote repository, which is the origin of this project.
<br>
The project aims at backing up Loqseq notes on below places:
1. GitHub
2. Another place in your local computer, such like your SSD or hard drive.
<br>

## Prerequisites
### Basics
* Docker (docker compose)
<br>

### Feature I : Back up the note for GitHub
1. Set the variable `UPDATE_GITHUB_ENABLED` in .env as `true`.
2. Create your GitHub access token 
    1. follow the path `Setting -> Developer Settings -> Personal Access Token -> Tokens(classic)`
    ![image info](./assets/personal-access-token.png)
    2. Create a new one which is granted with repository accesses.
    3. Paste the generated key to `GITHUB_TOKEN` in .env
3. keep filling related variables.

### Feature II :Back up in another local place
1. Set the variable `FOLDER_UPDATE_ENABLED` in .env as `true`.
2. keep filling related variables.
<br>

## Steps
1. Fill the necessary values in .env.
2. Go to the root path of the project and execute below command
    ```bash
    docker compose build && docker compose -d up
    ```
3. To stop the service, execute below command
    ```bash
    docker compose down
    ```
<br>

## Customization
* You can fine-tune the frequency of backup in `task-cron.txt` following the conventional cron pattern. (Notice: The leftmost unit presents "minute".)
* Also, you can add other cronjobs in `task-cron.txt`.
<br>

## Supplimentory
* Go into the running container
    ```
    docker exec -it logseq-backup-app-1 bash
    ```
* Prune redundant images caused from docker compose build
    ```
    docker image prune -f
    ```
<br>

## Update Notes
* Last updated on 2023/05/28