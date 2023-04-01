#!/bin/zsh
source .env

if [[ $# -eq 1 ]]
    then
        repo=$1

        mkdir $repo
        cd $repo
        echo "# $repo" >> README.md 
        
        git init 
        git add .
        git commit -m "initialize $repo"
        git branch -M main
        response=$(curl -X POST -H "Authorization: token ${GITHUB_TOKEN}" -d '{"name": "'"${repo}"'"}' "https://api.github.com/user/repos" -w "HTTP%{http_code}")
        http_status=$(echo $response | grep -o "HTTP[0-9][0-9][0-9]" | grep -o "[0-9][0-9][0-9]")
        
        if [[ http_status -eq 201 ]]
            then
                echo git@github.com:${GITHUB_USERNAME}/${repo}.git
                git remote add origin git@github.com:${GITHUB_USERNAME}/${repo}.git
                git push -u origin main
                echo "Git repository successfully initialized."
            else
                echo "Failed to create remote repository."
        fi

    else 
        echo "Missing repository name: gitinit <repo>"
fi


# git init
# git add .
# git commit -m "init commit"
# git branch -M main
# git remote add origin https://github.com/[github-username]/%1.git
# git push -u origin main

