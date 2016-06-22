# RepoMap

![No Longer Maintained](https://img.shields.io/badge/maintained%3F-no!-red.svg?style=flat)

Keep track of your local git repos.

Add and remove any git repository to RepoMap, and it will keep
track of them in a simple YAML file. You can also pretty print
your git repositories.

CLI: 
- `repo ls` 
- `repo add [optional: -r for recursive] [git repo path]` 
- `repo rm [git repo path]`
- `repo find [optional: path/to/search] [regex pattern, like ".*"]`

Want all git repos in some directory to be listed in one place?

- `repo add -r [directory holding repositories]`
- `repo ls`

Want to search with regular expressions for a repo within RepoMap?

- `repo find "test[0-9]{1}"`
- `repo find ~/devel/Ruby "test[0-9]{1}"`


## Installation

Things are pretty new, but since this project doesn't really do much beyond
affect the state of one file that it itself creates, it's actually OK to use
already. Check out the specs in `spec` and the source in `lib` if you wanna see
what's happening.

### Install from RubyGems

- `gem install repomap`

On first use, `~/.repomap.yml` will be created.

### Build from Gemspec

- `gem build repomap.gemspec`
- `gem install repomap-x.x.x.gem`

On first use, `~/.repomap.yml` will be created.

## Usage

- `repo [global opts] [subcommand] [subcommand opts]`

- `repo -h` for help

- `repo [subcommand] -h` for help about subcommands

**Sub Commands**

- `add [optional: -r] [path to git repository]`
    - Add the given git repository to RepoMap
    - Use `-r` switch to add all git repository under some path
- `rm  [path to git repository]`
    - Add the given git repository to RepoMap
- `ls`
    - List all git repositories in RepoMap
- `find [optional: path/to/search] [regex pattern, like ".*"]`
    - Find a repo in RepoMap

## Testing

- Run `rake` to run all specs.

## Future

- ~~search a given path recusively for all git repos, adding any that
are found to RepoMan~~
- ~~make a gemspec~~
- ~~add some simple specs~~
- ~~change name because of conflicts with other gem names~~
- ~~add a find command~~
- an 'update' command to update information about each repo that RepoMan
knows about
- keep track of other meta data about git repos (remotes, for instance)
    - then you could list your github repos and their paths

