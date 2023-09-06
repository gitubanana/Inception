#!/bin/sh

filebrowser config init -a $FILEBROWSER_HOST -p $FILEBROWSER_PORT -r $FILEBROWSER_DIR
filebrowser users add $FILEBROWSER_USER $FILEBROWSER_PW
filebrowser
