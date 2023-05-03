FROM ubuntu:latest

# Set the working directory
WORKDIR /usr/src/app

# Copy the files
COPY . .

# Copy hello-cron file to the cron.d directory
COPY task-cron /etc/cron.d/task-cron

# Installation
RUN apt-get update && apt-get -y install cron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/task-cron

# Apply cron job
RUN crontab /etc/cron.d/task-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log