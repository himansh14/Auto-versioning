#!/bin/bash

#add a change in the working directory to the staging area
git add .

#commit the files and give message
git commit -m "latest commit to the file"

#git branching specify
git branch -M main

#configuration file settings
#git commit config --global user.name "himansh14"
#git commit config --global user.email "972214himanshu@gmail.com"
git config --global user.email "972214himanshu@gmail.com"
git config user.email "972214himanshu@gmail.com"
git config --global user.name "himansh14"
git config user.name "himansh14"
git commit
#git commit --author="himansh14 972214himanshu@gmail.com" --no-edit

#checking the current tag of the file
NEW_TAG=$(git describe --tags --abbrev=0) 

#latest tag on the current branch
#LATEST_TAG=$(git describe --tags --abbrev=0 | awk -F. '{OFS="."; $NF+=1; print $0}')
#LATEST_TAG=$(echo git describe --tags --abbrev=0 | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}') 

#different versions for major minor patch
MAJOR=$(echo "$NEW_TAG" | awk -F. '{print $1}')
MINOR=$(echo "$NEW_TAG" | awk -F. '{print $2}')
PATCH=$(echo "$NEW_TAG" | awk -F. '{print $3}')

#determine the new tag number(different versions for major minor patch)

case "$1" in
	"MAJOR") ((major++)); minor=0; patch=0;; 
        "MINOR") ((minor++)); patch=0;; 
        "PATCH") ((patch++));; 
	*) echo "Usage: $0 [major|minor|patch]"; exit 1;; 
esac
}

#creating the new tag for versioning
NEWEST_TAG="$MAJOR.$MINOR.$PATCH"
echo "$NEWEST_TAG"

#specifying new tags to the existing tags
git tag -a "$NEWEST_TAG" -m "Version $NEWEST_TAG"


#push changes to the remote
git push origin "$NEWEST_TAG"

git push
#echo "$GIT_PUSH" > /opt/all_data_backup/backup/autoversion_script/version/version.txt 
