FROM ubuntu:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Install Cron
RUN apt-get install -y cron

# Install Nano
RUN apt-get install -y nano

# Set the working directory
WORKDIR /usr/src/app

# Copy the script to the container
COPY ${MOVE_PATH}/. .

# Add a cron job to run the script every 15 seconds
RUN echo "*/15 * * * * /bin/bash /usr/src/app/schedule.sh" > /etc/cron.d/schedule-cron

# Give execution permission to the script
RUN chmod +x /usr/src/app/schedule.sh

# Start Cron when the container starts
CMD cron -f
