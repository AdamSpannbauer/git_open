git_open(){
    remote=$(git config --get remote.origin.url)

    # If no remote found, exit
    if [ -z "$remote" ]; then
        echo "ERROR: Not a git repo, or no remote url set"
        exit 1
    fi

    # Replace ssh style remote origin with https

    # Input: git@github.com:AdamSpannbauer/git_open.git
    # Output: https://github.com/AdamSpannbauer/git_open.git
    if [[ $remote == "git@"* ]]; then
        remote="${remote/git@/https://}" 
        remote="${remote/.com:/.com/}" 
    fi

    # Assumes OSX
    open "$remote"
}
