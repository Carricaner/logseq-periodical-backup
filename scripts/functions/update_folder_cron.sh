
update_folder() {
    # Source the env file
    . "/usr/src/app/.env"

    if [ "$FOLDER_UPDATE_ENABLED" = true ]
    then
        # copy the whole folder into the designated folder
        cp -r $CONTAINER_LOGSEQ_DIR $CONTAINER_FOLDER_DIR
    fi

    # Log
    echo "Folder updated on $FORMATTED_DATE." >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
}