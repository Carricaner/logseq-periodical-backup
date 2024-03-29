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
RUN apt-get install -y cron git

# Copy the files
COPY . .
COPY task-cron.txt $CONTAINER_CRON_D_DIR/task-cron.txt

# Create a log file
RUN touch $CONTAINER_WORKDIR/log.txt
 
# Give execution rights on the cron job
RUN chmod 0644 $CONTAINER_CRON_D_DIR/task-cron.txt

# Apply cron job
RUN crontab $CONTAINER_CRON_D_DIR/task-cron.txt
 
# Run the command on container startup
CMD cron && tail -f $CONTAINER_WORKDIR/log.txt