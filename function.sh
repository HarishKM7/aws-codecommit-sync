#!/bin/bash
export HOME=/tmp # so Git can write .gitconfig here
CLONE_DIR=/tmp/src-repo

# URL encode
SRC_USER=$(echo -n "$SRC_USER" | jq -sRr @uri)
SRC_PASS=$(echo -n "$SRC_PASS" | jq -sRr @uri)
DEST_USER=$(echo -n "$DEST_USER" | jq -sRr @uri)
DEST_PASS=$(echo -n "$DEST_PASS" | jq -sRr @uri)

SRC_REPO=${SRC_REPO/'https://'/"https://$SRC_USER:$SRC_PASS@"}
DEST_REPO=${DEST_REPO/'https://'/"https://$DEST_USER:$DEST_PASS@"}

function handler() {
  rm -rf $CLONE_DIR
  git clone --mirror "$SRC_REPO" $CLONE_DIR
  cd $CLONE_DIR
  git remote add dest "$DEST_REPO"
  git push dest --mirror
  echo 'DONE! Successfully mirrored source repo to destination!'
}
