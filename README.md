# Repo Man

Keep track of your git repos.

Want all git repos in some directory to be listed in one place?
`repo add -r [directory holding repositories]`

Add and remove any git repository to RepoMan, and it will keep
track of them in a simple YAML file. You can also pretty print
your git repositories.

CLI: 
- `repo ls` 
- `repo add [-r for recursive] [git repo path]` 
- `repo rm [git repo path]`

## Installation

Things are pretty new, but since this project doesn't really do
much beyond affect the state of one file that it itself creates, it's actually
OK to use already. Check out the source if you wanna see what's happening.

- `gem build repo-man.gemspec`
- `gem install repo-man-x.x.x.gem`

On first use, `~/.git-repos.yml` will be created.

## Usage

- `repo [global opts] [subcommand] [subcommand opts]`

- `repo -h` for help

- `repo [subcommand] -h` for help about subcommands

**Sub Commands**

- add [path to git repository]
    - Add the given git repository to RepoMan
    - Use `-r` switch to add all git repository under some path
- rm  [path to git repository]
    - Add the given git repository to RepoMan
- ls
    - List all git repositories in RepoMan

## Future

- ~~search a given path recusively for all git repos, adding any that
are found to RepoMan~~
- ~~make a gemspec~~
- add some simple specs
- an 'update' command to update information about each repo that RepoMan
knows about
- keep track of other meta data about git repos (remotes, for instance)
    - then you could list your github repos and their paths

