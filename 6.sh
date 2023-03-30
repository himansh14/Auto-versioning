#!/bin/bash

#add a change in the working directory to the staging area
git add .

#commit the files and give message
git commit -m "latest commit to the file"

#git branching specify
git branch -M main

#configuration file settings
git config --global user.email "972214himanshu@gmail.com"
git config user.email "972214himanshu@gmail.com"
git config --global user.name "himansh14"
git config user.name "himansh14"
git commit
git push origin "$NEW_TAG"
git push

#checking the current tag of the file

EXISTING_TAG=$(echo git tags v1.0.1 | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}') 

#different versions for major minor patch
MAJOR=$(echo "$EXISTING_TAG" | awk -F. '{print $1}')
MINOR=$(echo "$EXISTING_TAG" | awk -F. '{print $2}')
PATCH=$(echo "$EXISTING_TAG" | awk -F. '{print $3}')

#determine the new tag number(different versions for major minor patch)

case "$1" in
	"MAJOR") ((major++)); minor=0; patch=0;; 
        "MINOR") ((minor++)); patch=0;; 
        "PATCH") ((patch++));; 
	*) echo "Usage: $0 [major|minor|patch]"; exit 1;; 
esac

#creating the new tag for versioning
NEW_TAG="$MAJOR.$MINOR.$PATCH"
echo "$NEW_TAG"

#specifying new tags to the existing tags
git tag -a "$NEW_TAG" -m "Version $NEW_TAG"

#push changes to the remote
echo "$NEW_TAG" > /opt/all_data_backup/backup/autoversion_script/version/version.txt 
