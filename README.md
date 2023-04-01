# Gitinit 

### To use
1. Clone the repository 
2. Create a Github personal access token.
3. Add the token and your username to a .env file in the same directory as [gitinit](./gitinit.sh)
4. Run ./gitinit.sh <repo_name> 

## To make global
1. Add `export PATH="$PATH:$HOME/path/to/gitinit/directory"` to the .zshrc file in your home directory.
2. Optionally, add `alias gitinit="gitinit.sh"` to the .zshrc file so you can omit the `./sh` ending. 


### TODO
1. Add the option to initialize git in the current directory, skipping the mkdir and cd commands. 
2. Probably some more error handling. 
