# Repo Man

Keep track of your git repos.

Want all git repos in some directory to be listed in one place?
`./repo add -r [directory holding repositories]`

Add and remove any git repository to RepoMan, and it will keep
track of them in a simple YAML file. You can also pretty print
your git repositories.

CLI: 
- `./repo ls` 
- `./repo add [-r for recursive] [git repo path]` 
- `./repo rm [git repo path]`

## Usage

**Sub Commands**

- add [path to git repository]
    - Add the given git repository to RepoMan
    - Use `-r` switch to add all git repository under some path
    - Use `-h` switch for help
- rm  [path to git repository]
    - Add the given git repository to RepoMan
    - Use `-h` switch for help
- ls
    - List all git repositories in RepoMan
    - Use `-h` switch for help

## Installation


## Quirks

- you have to run `repo` from this repository for now. I need to
make a gem out of this.

## Future

- ~~search a given path recusively for all git repos, adding any that
are found to RepoMan~~
- an 'update' command to update information about each repo that RepoMan
knows about
- keep track of other meta data about git repos (remotes, for instance)
    - then you could list your github repos and their paths

