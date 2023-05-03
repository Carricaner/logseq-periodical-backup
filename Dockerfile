FROM ubuntu:latest

# Define arguments
ARG CONTAINER_WORKDIR
ARG CONTAINER_CRON_D_DIR

# Set env
ENV CONTAINER_CRON_D_DIR $CONTAINER_CRON_D_DIR

# Set Working directory
WORKDIR $CONTAINER_WORKDIR

# Installation
RUN apt-get update 
RUN apt-get install -y cron
RUN apt-get install -y git
RUN apt-get install -y openssh-server

# Copy the files
COPY . .
COPY task-cron $CONTAINER_CRON_D_DIR/task-cron
 
# Give execution rights on the cron job
RUN chmod 0644 $CONTAINER_CRON_D_DIR/task-cron

# Apply cron job
RUN crontab $CONTAINER_CRON_D_DIR/task-cron
 
# Run the command on container startup
CMD cron && tail -f $CONTAINER_WORKDIR/log.txt