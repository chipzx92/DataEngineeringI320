#!/usr/bin/env bash
 
PROJECT_DIR=/de_i320/data/projects
if [ -e ${PROJECT_DIR} ]; then
    echo "Project directory exists, removing..."
    sudo rm -rf ${PROJECT_DIR}
fi
sudo mkdir ${PROJECT_DIR}
sudo chown ubuntu:ubuntu ${PROJECT_DIR}
echo "Created ${PROJECT_DIR}"

declare -a projects=("imdb" "aac" "covid" "olympics" "dwts" "songs")
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
    # sudo chmod -R o-rwx ${PROJECT_DIR}/${project}
done
echo "Copied data for projects"

for project in "${projects[@]}"
do
    pushd ${PROJECT_DIR}/${project}/src/dbt
    dbt init ${project}
    cd ${project}
    mkdir -p models/star_schema models/data_products
    chmod -R 775 models
    rm -rf models/example
    rm -rf ./README.md
    sudo chown -R ubuntu:${project} .
    sudo chmod 777 /de_i320/data/projects/${project}/src/dbt/logs
    sudo touch /de_i320/data/projects//${project}/src/dbt/logs/dbt.log
    sudo chmod 666 /de_i320/data/projects/${project}/src/dbt/logs/dbt.log
    sudo chown -R ubuntu:${project} /de_i320/data/projects/${project}/src/dbt/logs
    popd
done
