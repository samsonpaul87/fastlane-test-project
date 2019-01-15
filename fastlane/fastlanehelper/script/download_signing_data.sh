#!/bin/bash
curl -X POST https://content.dropboxapi.com/2/files/download \
  --header "Authorization: Bearer $FASTLANE_TEST_DROPBOX_AUTH_TOKEN" \
  --header "Dropbox-API-Arg: {\"path\": \"/$FASTLANE_TEST_SIGNING_ARCHIVE_NAME\"}" \
  -o "./$FASTLANE_TEST_SIGNING_ARCHIVE_NAME" \
  && unzip -o $FASTLANE_TEST_SIGNING_ARCHIVE_NAME \
  && rm $FASTLANE_TEST_SIGNING_ARCHIVE_NAME