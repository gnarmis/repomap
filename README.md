# Repo Man

Keep track of your git repos.

Add and remove any git repository to RepoMan, and it will keep
track of them in a simple YAML file. You can also pretty print
your git repositories.

CLI: 
- 'repo ls', 
- 'repo add [git repo path]', 
- 'repo rm [git repo path]'

## Usage

**Sub Commands**

- add [path to git repository]
    - Add the given git repository to RepoMan
- rm  [path to git repository]
    - Add the given git repository to RepoMan
- ls
    - List all git repositories in RepoMan

## Installation

Symlink the YAML file to ~/.git-repos.yml. This is
not required, though.

- `./link`

## Quirks

- you have to run `repo` from this repository for now. I need to
make a gem out of this.

## Future

- search a given path recusively for all git repos, adding any that
are found to RepoMan
- an 'update' command to update information about each repo that RepoMan
knows about
- keep track of other meta data about git repos (remotes, for instance)
    - then you could list your github repos and their paths

