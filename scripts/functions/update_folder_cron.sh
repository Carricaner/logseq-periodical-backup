update_folder_cron() {
    if [ "$FOLDER_UPDATE_ENABLED" = true ]
    then
        cp -r $CONTAINER_LOGSEQ_DIR $CONTAINER_FOLDER_DIR
    fi
}