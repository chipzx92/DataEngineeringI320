#!/usr/bin/env bash
 
PROJECT_DIR=/de_i320/data/projects
if [ -e ${PROJECT_DIR} ]; then
    echo "Project directory exists, removing..."
    sudo rm -rf ${PROJECT_DIR}
fi
sudo mkdir ${PROJECT_DIR}
sudo chown ubuntu:ubuntu ${PROJECT_DIR}
echo "Created ${PROJECT_DIR}"

declare -a projects=("imdb" "aac" "covid" "faang" "dancing" "songs")
for project in "${projects[@]}"
do
    mkdir ${PROJECT_DIR}/${project}
    cd ./project_template
    cp -R . ${PROJECT_DIR}/${project}
    cd ..
done
echo "Created individual project directories"

for project in "${projects[@]}"
do
    cp project_data/${project}/*.* ${PROJECT_DIR}/${project}/data
    # change group to project group
    sudo chown -R ubuntu:${project} ${PROJECT_DIR}/${project}
    # take away all permssions for world - only group and owner can access
    sudo chmod -R o-rwx ${PROJECT_DIR}/${project}
done
echo "Copied data for projects"

